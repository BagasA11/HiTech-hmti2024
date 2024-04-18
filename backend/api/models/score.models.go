package models

import (
	"time"

	"gorm.io/gorm"
)

type Score struct {
	gorm.Model
	ID        uint    `gorm:"primaryKey"`
	Point     float32 `gorm:"not null;default:0"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
	UserID    uint `gorm:"not null;"`
	User      User `gorm:"constraint:OnDelete:CASCADE;"`
	QuizID    uint `gorm:"not null;"`
	Quiz      Quiz `gorm:"constraint:OnDelete:CASCADE;"`
}

// Perform Action before Create record
// created_at and updated_at must be set
func (score *Score) BeforeCreate(tx *gorm.DB) error {
	// generate time
	tx.Statement.SetColumn("CreatedAt", time.Now())
	tx.Statement.SetColumn("UpdatedAt", time.Now())
	return nil
}

func (score *Score) BeforeUpdate(tx *gorm.DB) error {
	// generate time

	tx.Statement.SetColumn("UpdatedAt", time.Now())
	return nil
}
