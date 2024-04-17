package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"

	"time"

	"gorm.io/gorm"
)

type ScoreRepository struct {
	Db *gorm.DB
}

func NewScoreRepository() *ScoreRepository {
	return &ScoreRepository{
		Db: configs.GetDB(),
	}
}

func (sr *ScoreRepository) CreateScore(score models.Score) (uint, error) {
	tx := sr.Db.Begin()
	err := tx.Create(&score).Error
	if err != nil {
		tx.Rollback()
		return 0, err
	}
	tx.Commit()
	return score.ID, err
}

// ===
// ===

func (sr *ScoreRepository) GetIDWithQuizIDAndUserID(quizID uint, userID uint) (uint, error) {
	var s models.Score
	err := sr.Db.Where("user_id = ? AND quiz_id = ?", userID, quizID).Order("updated_at DESC").First(&s).Error
	if err != nil {
		return 0, err
	}
	return s.ID, nil
}

func (sr *ScoreRepository) FindID(id uint) (models.Score, error) {
	var s models.Score
	err := sr.Db.Where("id = ?", id).First(&s).Error
	return s, err
}

func (sr *ScoreRepository) UpdateOrCreate(id uint, score models.Score) error {
	tx := sr.Db.Begin()
	if tx.Model(&models.Score{}).Where("id = ?", id).Updates(&score).RowsAffected == 0 {
		tx.Rollback()
		err := tx.Create(&score).Error
		if err != nil {
			tx.Rollback()
			return err
		}
		tx.Commit()
		return nil
	}
	tx.Commit()
	return nil
}

func (sr *ScoreRepository) Rank(quizID uint) ([]models.Score, error) {
	var ranks []models.Score
	// SELECT * FROM scores ORDER BY point DESC
	err := sr.Db.Where("quiz_id = ?", quizID).Find(&ranks).Order("point DESC").Error
	return ranks, err
}

// history
func (sr *ScoreRepository) GetHistory(userId uint) ([]models.Score, error) {
	var s []models.Score
	//SELECT * FROM scores WHERE user_id = {userId} ORDER BY created_at DESC
	err := sr.Db.Where("user_id = ?", userId).Order("created_at DESC").Find(&s).Error
	return s, err
}

func (sr *ScoreRepository) Update(score models.Score) error {
	tx := sr.Db.Begin()
	err := tx.Model(&models.Score{}).Where("id = ?", score.ID).Updates(&score).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (sr *ScoreRepository) Delete(id uint) error {
	tx := sr.Db.Begin()
	err := tx.Model(&models.Score{}).Where("id = ?", id).Update("deleted_at", time.Now().Unix()).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
