package models

import (
	"errors"
	"fmt"
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
	Dura     int `gorm:"not null; default:1; check:dura<=30"`
}

// Before
func (q *Question) BeforeCreate(tx *gorm.DB) (err error) {
	s := []string{"A", "B", "C", "D", "E"}
	if !slices.Contains(s, strings.ToUpper(q.Answer)) {
		err := errors.New("Answer column: " + strings.ToUpper(q.Answer) + " must be set in " + strings.Join(s, ","))
		return err
	}

	if (q.Dura <= 0) || (q.Dura > 30) {
		return errors.New("timer must be greater than 0 and less than 30 second")

	}

	if tx.Where("quiz_id IN (SELECT id FROM quizzes WHERE id = ?)", q.QuizID).Find(&Question{}).RowsAffected == 0 {
		return fmt.Errorf("unknown quiz id for %d", int(q.QuizID))
	}

	return nil
}
