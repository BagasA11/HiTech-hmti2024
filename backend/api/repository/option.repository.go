package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"

	"gorm.io/gorm"
)

type OptionRepository struct {
	Db *gorm.DB
}

func NewOptRepository() *OptionRepository {
	return &OptionRepository{
		Db: configs.GetDB(),
	}
}

func (optRp *OptionRepository) Create(opt models.Option) error {
	tx := optRp.Db.Begin()
	err := tx.Create(&opt).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return err
}

func (optRp *OptionRepository) FindID(id uint) (models.Option, error) {
	var opt models.Option
	err := optRp.Db.Where("id = ?", id).First(&opt).Error
	return opt, err
}

func (optRp *OptionRepository) ReferToQuestion(questID uint) ([]models.Option, error) {
	var opts []models.Option
	err := optRp.Db.Where("question_id = ?", questID).Find(&opts).Error
	return opts, err
}

func (optRp *OptionRepository) Edit(opt models.Option) error {
	tx := optRp.Db.Begin()
	err := tx.Model(&models.Option{}).Where("id = ?", opt.ID).Updates(&opt).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (optRp *OptionRepository) Delete(id uint) error {
	tx := optRp.Db.Begin()
	err := tx.Delete(&models.Option{}, id).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
