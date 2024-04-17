package models

import (
	"errors"
	"time"

	"gorm.io/gorm"
)

type Quiz struct {
	gorm.Model
	ID        uint   `gorm:"primaryKey"`
	Title     string `gorm:"not null;unique"`
	Topic     string `gorm:"not null; size:50"`
	Img       *string
	Desc      string `gorm:"not null"`
	Verified  bool   `gorm:"type:boolean; not null; default:false"`
	Free      bool   `gorm:"type:boolean; not null; default:true"`
	Price     *uint64
	Disc      uint8 `gorm:"type:integer; not null; default:0"`
	Dura      int   `gorm:"not null; default:true; check:dura<=30"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
	Score     []Score
	TopUp     []TopUp
	Question  []Question
}

// Before
func (quiz *Quiz) BeforeCreate(tx *gorm.DB) error {

	if quiz.Dura > 30 {
		return errors.New("quiz duration must be less or equals to 30 minute")
	}
	if quiz.Dura < 0 {
		return errors.New("quiz duration must be greater than 0")
	}

	// generate time
	tx.Statement.SetColumn("dura", quiz.Dura)
	tx.Statement.SetColumn("CreatedAt", time.Now())
	tx.Statement.SetColumn("UpdatedAt", time.Now())
	return nil
}
