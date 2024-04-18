package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"

	"gorm.io/gorm"
)

type TopUpRepository struct {
	Db *gorm.DB
}

func NewTopupRepo() *TopUpRepository {
	return &TopUpRepository{
		Db: configs.GetDB(),
	}
}

func (tr *TopUpRepository) Create(topup models.TopUp) error {
	tx := tr.Db.Begin()
	err := tx.Create(&topup).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return err
}

/*return all game topup transaction*/
func (tr *TopUpRepository) All() ([]models.TopUp, error) {
	var topups []models.TopUp
	err := tr.Db.Find(&topups).Error
	return topups, err
}

/*return topup with specified id*/
func (tr *TopUpRepository) FindID(id uint) (models.TopUp, error) {
	var topup models.TopUp
	err := tr.Db.Where("id = ?", id).First(&topup).Error
	return topup, err
}

func (tr *TopUpRepository) FindUserID(userID uint) ([]models.TopUp, error) {
	var topups []models.TopUp
	err := tr.Db.Where("user_id = ?", userID).Find(&topups).Error
	return topups, err
}

func (tr *TopUpRepository) FindQuizID(quizID uint) ([]models.TopUp, error) {
	var topups []models.TopUp
	err := tr.Db.Where("quiz_id = ?", quizID).Find(&topups).Error
	return topups, err
}

func (tr *TopUpRepository) FindQuizUserID(quizID uint, userID uint) (models.TopUp, error) {
	var topup models.TopUp
	err := tr.Db.Where("quiz_id = ? AND user_id = ?", quizID, userID).First(&topup).Error
	return topup, err
}

func (tr *TopUpRepository) Delete(id uint) error {
	tx := tr.Db.Begin()
	//DELETE FROM topups WHERE id = {id}
	err := tx.Delete(&models.TopUp{}, id).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
