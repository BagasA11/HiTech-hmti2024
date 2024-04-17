package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"

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

func (qstRepo *QuestionRepository) Create(quest models.Question) error {
	tx := qstRepo.Db.Begin()
	err := tx.Create(&quest).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return err
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

func (qstRepo *QuestionRepository) Updates(quest models.Question) error {
	tx := qstRepo.Db.Begin()
	err := tx.Model(&models.Question{}).Where("id = ?", quest.ID).Updates(&quest).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qr *QuestionRepository) SetAvatar(id uint, file string) error {
	tx := qr.Db.Begin()
	err := tx.Model(&models.Question{}).Where("id = ?", id).Update("img", file).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qstRepo *QuestionRepository) Delete(id uint) error {
	tx := qstRepo.Db.Begin()
	//DELETE FROM questions WHERE id = {id}
	err := tx.Delete(&models.Question{}, id).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
