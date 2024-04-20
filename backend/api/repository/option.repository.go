package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"errors"

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

func (optRp *OptionRepository) Create(opt models.Option, userID uint) error {
	tx := optRp.Db.Begin()
	// SELECT * FROM questions WHERE id = $opt->id AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = $userID)
	if tx.Where("id = ? AND quiz_id IN (SELECT id FROM quizzes WHERE user_id = ?)", opt.QuestionID, userID).First(&models.Question{}).RowsAffected == 0 {
		return errors.New("you not allowed to modify this content")
	}

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

func (optRp *OptionRepository) Edit(opt models.Option, userID uint) error {
	tx := optRp.Db.Begin()

	// UPDATE options SET options{} = $opt WHERE id = $opt->id AND question_i IN (SELECT id FROM questions WHERE quiz_id IN ( SELECT id FROM quizzes WHERE user_id = $userID) )
	err := tx.Model(&models.Option{}).Where("id = ? AND question_id IN (SELECT id FROM questions WHERE quiz_id IN (SELECT id FROM quizzes WHERE user_id = ?))", opt.ID, userID).Updates(&opt).Error

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

func (optRp *OptionRepository) Delete(id uint, userID uint) error {
	tx := optRp.Db.Begin()
	err := tx.Where("id = ? AND question_id IN (SELECT id FROM questions WHERE quiz_id IN (SELECT id FROM quizzes WHERE user_id = ?))").Delete(&models.Option{}).Error

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
