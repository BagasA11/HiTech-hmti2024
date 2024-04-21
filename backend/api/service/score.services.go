package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
	"errors"
)

type ScoreService struct {
	repository *repository.ScoreRepository
}

func NewScoreService() *ScoreService {
	return &ScoreService{
		repository: repository.NewScoreRepository(),
	}
}

func (ss *ScoreService) Create(req dto.Score) (uint, error) {

	s := models.Score{
		QuizID: req.QuizID,
		UserID: req.UserID,
		Point:  req.Score,
	}
	return ss.repository.CreateScore(s)
}

func (ss *ScoreService) GetHistory(userID uint) ([]models.Score, error) {
	return ss.repository.GetHistory(userID)
}

func (ss *ScoreService) Rank(quizID uint) ([]models.Score, error) {
	return ss.repository.Rank(quizID)
}

func (ss *ScoreService) You(quizID uint, userid uint) (uint, error) {
	r, err := ss.repository.You(quizID, userid)
	if r == 0 {
		err = errors.New("not found")
	}
	return r, err
}

func (ss *ScoreService) Update(id uint, req dto.Score) error {
	s := models.Score{
		ID:     id,
		QuizID: req.QuizID,
		UserID: req.UserID,
		Point:  req.Score,
	}
	return ss.repository.Update(s)
}
