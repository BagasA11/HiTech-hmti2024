package models

import (
	"time"

	"gorm.io/gorm"
)

type BlacklistToken struct {
	gorm.Model
	ID        uint   `gorm:"primaryKey"`
	Token     string `gorm:"not null;unique"`
	CreatedAt time.Time
}

func (bt *BlacklistToken) BeforeCreate(tx *gorm.DB) error {
	// generate time
	tx.Statement.SetColumn("CreatedAt", time.Now())
	return nil
}
