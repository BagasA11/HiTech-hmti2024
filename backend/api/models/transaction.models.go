package models

import (
	"time"

	"gorm.io/gorm"
)

type Transaction struct {
	gorm.Model
	ID        uint      `gorm:"primaryKey"`
	Price     uint64    `gorm:"not null"`
	Pay       bool      `gorm:"type:boolean; not null; default:false"`
	Cancel    bool      `gorm:"type:boolean; not null; default:false"`
	PayAt     time.Time `gorm:"null"`
	CancelAt  time.Time `gorm:"null"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
	UserID    uint
	User      User `gorm:"constraint:OnDelete:CASCADE;"`
}

func (transaction *Transaction) BeforeCreate(tx *gorm.DB) error {

	// generate time
	tx.Statement.SetColumn("CreatedAt", time.Now())
	tx.Statement.SetColumn("UpdatedAt", time.Now())
	return nil
}
