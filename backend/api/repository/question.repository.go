package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"errors"

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
		return 0, errors.New("you not allowed modify this content")
	}

	err := tx.Create(&quest).Error
	if err != nil {
		tx.Rollback()
		return 0, err
	}
	tx.Commit()
	return 0, err
}

/*get all question which connected to quiz id*/
func (qstRepo *QuestionRepository) ReferToQuiz(quizId uint) ([]models.Question, error) {
	var quest []models.Question
	err := qstRepo.Db.Where("quiz_id = ?", quizId).Order("id ASC").Find(&quest).Error
	return quest, err
}

func (qr *QuestionRepository) FindID(id uint) (models.Question, error) {
	var q models.Question
	err := qr.Db.Where("id = ?", id).Preload("Option").First(&q).Error
	return q, err
}

func (qr *QuestionRepository) QuestionAndOption(quizID uint) ([]models.Question, error) {
	var quest []models.Question
	err := qr.Db.Where("quiz_id = ?", quizID).Preload("Option").Order("id ASC").Find(&quest).Error
	return quest, err
}

func (qstRepo *QuestionRepository) Updates(quest models.Question, userID uint) error {
	tx := qstRepo.Db.Begin()

	// UPDATE questions SET ({}) WHERE id = $id AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = $user_id)
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

func (qr *QuestionRepository) SetAvatar(id uint, userID uint, file string) error {
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
