package models

import (
	"errors"
	"slices"
	"strings"

	"gorm.io/gorm"
)

type Option struct {
	gorm.Model
	ID         uint   `gorm:"primaryKey"`
	Alphabet   string `gorm:"not null;size:1"`
	Text       string `gorm:"not null;size:200"`
	Color      string `gorm:"not null;size:30;default:white"`
	QuestionID uint
	Question   Question `gorm:"constraint:OnDelete:CASCADE;"`
}

func (opt *Option) BeforeCreate(tx *gorm.DB) (err error) {
	s := []string{"A", "B", "C", "D", "E"}
	if !slices.Contains(s, strings.ToUpper(opt.Alphabet)) {
		err := errors.New("Alphabet column: " + strings.ToUpper(opt.Alphabet) + " must be in " + strings.Join(s, ","))
		return err
	}
	opt.Alphabet = strings.ToUpper(opt.Alphabet)
	return
}
