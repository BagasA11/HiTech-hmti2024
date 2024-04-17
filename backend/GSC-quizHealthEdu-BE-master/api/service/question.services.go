package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
)

type QuestionService struct {
	repository *repository.QuestionRepository
}

func NewQuestionService() *QuestionService {
	return &QuestionService{
		repository: repository.NewQuestionRepository(),
	}
}

func (qst *QuestionService) Create(quizId uint, req *dto.Question) error {
	q := models.Question{
		Question: req.Question,
		Answer:   req.Answer,
		QuizID:   quizId,
	}
	err := qst.repository.Create(q)
	return err
}

// get all question which correspondent with quiz id
func (qst *QuestionService) ReferToQuiz(quizID uint) ([]models.Question, error) {
	q, err := qst.repository.ReferToQuiz(quizID)
	return q, err
}

func (qs *QuestionService) FindID(id uint) (models.Question, error) {
	q, err := qs.repository.FindID(id)
	return q, err
}

func (qs *QuestionService) AttemptQuiz(quizID uint) ([]models.Question, error) {
	q, err := qs.repository.QuestionAndOption(quizID)
	return q, err
}

func (qst *QuestionService) Updates(id uint, req *dto.Question) error {
	q := models.Question{
		ID:       id,
		Question: req.Question,
		Answer:   req.Answer,
	}
	err := qst.repository.Updates(q)
	return err
}

func (qs *QuestionService) SetAvatar(id uint, file string) error {
	return qs.repository.SetAvatar(id, file)
}

func (qst *QuestionService) Delete(id uint) error {
	err := qst.repository.Delete(id)
	return err
}
