package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"errors"
	"fmt"

	"gorm.io/gorm"
)

type QuestionRepository struct {
	Db *gorm.DB
}

func NewQuestionRepository() *QuestionRepository {
	return &QuestionRepository{
		Db: configs.GetDB(),
	}
}

func (qstRepo *QuestionRepository) Create(quest models.Question, userID uint) (uint, error) {
	tx := qstRepo.Db.Begin()
	if tx.Where("id = ? AND user_id = ?", quest.QuizID, userID).First(&models.Quiz{}).RowsAffected == 0 {
		tx.Rollback()
		return 0, errors.New("Unauthorized_You do not have permission to modify this content")
	}

	err := tx.Create(&quest).Error
	if err != nil {
		tx.Rollback()
		return 0, err
	}
	tx.Commit()
	return quest.ID, err
}

// untuk review soal
func (qr *QuestionRepository) ReferToQuiz(quizID uint) ([]models.Question, error) {
	var quest []models.Question
	err := qr.Db.Where("quiz_id = ?", quizID).Find(&quest).Error

	return quest, err
}

/*get question by id*/
func (qr *QuestionRepository) FindID(id uint) (models.Question, error) {
	var q models.Question
	err := qr.Db.Where("id = ?", id).Preload("Option").First(&q).Error
	return q, err
}

func (qr *QuestionRepository) GetAnswer(id uint) (string, error) {
	var q models.Question
	if qr.Db.Where("id = ?", id).First(&q).RowsAffected == 0 {
		return "", fmt.Errorf("question id [%d] not found", id)
	}

	if q.Answer == "" {
		return "", fmt.Errorf("question id [%d] not found", id)
	}

	return q.Answer, nil
}

func (qr *QuestionRepository) QuestionAndOption(quizID uint) ([]models.Question, error) {
	var quest []models.Question
	err := qr.Db.Where("quiz_id = ?", quizID).Preload("Option").Order("id ASC").Find(&quest).Error
	return quest, err
}

func (qstRepo *QuestionRepository) Updates(quest models.Question, userID uint) error {
	tx := qstRepo.Db.Begin()

	// UPDATE questions SET (models.Question{}) WHERE id = $id AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = $user_id)
	// SELECT * FROM questions WHERE id = 6 AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = 1)
	err := tx.Model(&models.Question{}).Where("id = ? AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = ?)", quest.ID, userID).Updates(&quest).Error

	if tx.RowsAffected == 0 {
		return errors.New("you not allowed to modify this content")
	}

	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qr *QuestionRepository) SetImg(id uint, userID uint, file string) error {
	tx := qr.Db.Begin()

	// UPDATE questions SET img = $file WHERE id = $id AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = $user_id)
	err := tx.Model(&models.Question{}).Where("id = ? AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = ?)", id, userID).Update("img", file).Error

	if tx.RowsAffected == 0 {
		return errors.New("you not allowed to modify this content")
	}

	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qstRepo *QuestionRepository) Delete(id uint, userID uint) error {
	tx := qstRepo.Db.Begin()

	//DELETE FROM questions WHERE id = {id} AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = $user_id)
	err := tx.Where("id = ? AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = ?)", id, userID).Delete(&models.Question{}).Error

	if tx.RowsAffected == 0 {
		return errors.New("you not allowed to modify this content")
	}

	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
