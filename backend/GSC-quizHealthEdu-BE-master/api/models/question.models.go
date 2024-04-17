package models

import (
	"errors"
	"slices"
	"strings"

	"gorm.io/gorm"
)

type Question struct {
	gorm.Model
	ID       uint   `gorm:"primaryKey"`
	Question string `gorm:"not null"`
	Img      *string
	Answer   string `gorm:"not null;size:1"`
	QuizID   uint
	Quiz     Quiz `gorm:"constraint:OnDelete:CASCADE;"`
	Option   []Option
}

// Before
func (q *Question) BeforeCreate(tx *gorm.DB) (err error) {
	s := []string{"A", "B", "C", "D", "E"}
	if !slices.Contains(s, strings.ToUpper(q.Answer)) {
		err := errors.New("Answer column: " + strings.ToUpper(q.Answer) + " must be set in " + strings.Join(s, ","))
		return err
	}
	return nil
}
