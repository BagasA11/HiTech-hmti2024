package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"time"

	"gorm.io/gorm"
)

type TransRepository struct {
	Db *gorm.DB
}

func NewTransRepository() *TransRepository {
	return &TransRepository{
		Db: configs.GetDB(),
	}
}

func (transRpo *TransRepository) Create(trans models.Transaction) error {
	tx := transRpo.Db.Begin()
	err := tx.Create(&trans).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return err
}

func (transRpo *TransRepository) FindID(id uint) (models.Transaction, error) {
	var trans models.Transaction
	//SELECT * FROM transactions WHERE id = {id}
	err := transRpo.Db.Where("id = ?", id).First(&trans).Error
	return trans, err
}

func (transRpo *TransRepository) All() ([]models.Transaction, error) {
	var trans []models.Transaction
	err := transRpo.Db.Find(&trans).Error
	return trans, err
}

func (transRpo *TransRepository) Updates(tr models.Transaction) error {
	tx := transRpo.Db.Begin()
	err := tx.Model(&models.Transaction{}).Where("id = ?", tr.ID).Updates(&tr).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (transRpo *TransRepository) Cancel(id uint) error {
	tx := transRpo.Db.Begin()
	tr := models.Transaction{
		Cancel:    true,
		CancelAt:  time.Now(),
		UpdatedAt: time.Now(),
	}
	err := tx.Model(&models.Transaction{}).Where("id = ?", id).Updates(&tr).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (transRpo *TransRepository) Pay(id uint) error {
	tx := transRpo.Db.Begin()
	tr := models.Transaction{
		Pay:       false,
		PayAt:     time.Now(),
		UpdatedAt: time.Now(),
	}
	err := tx.Model(&models.Transaction{}).Where("id = ?", id).Updates(&tr).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
