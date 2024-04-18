package models

import (
	"time"

	"gorm.io/gorm"
)

type Quiz struct {
	gorm.Model
	ID       uint   `gorm:"primaryKey"`
	Title    string `gorm:"not null;unique"`
	Topic    string `gorm:"not null; size:50"`
	Img      *string
	Desc     string `gorm:"not null"`
	Verified bool   `gorm:"type:boolean; not null; default:false"`
	Free     bool   `gorm:"type:boolean; not null; default:true"`
	Price    *uint64
	Disc     uint8 `gorm:"type:integer; not null; default:0"`

	UserID    uint
	Public    bool `gorm:"type:boolean; not null; default:true"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
	Score     []Score
	TopUp     []TopUp
	Question  []Question
}

// Before
func (quiz *Quiz) BeforeCreate(tx *gorm.DB) error {

	tx.Statement.SetColumn("CreatedAt", time.Now())
	tx.Statement.SetColumn("UpdatedAt", time.Now())
	return nil
}
