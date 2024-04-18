package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
)

type QuizService struct {
	repository *repository.QuizRepository
}

func NewQuizService() *QuizService {
	return &QuizService{
		repository: repository.NewQuizRepository(),
	}
}

func (qs *QuizService) CreateQuiz(req *dto.QuizCreate) error {
	q := models.Quiz{
		Title: req.Title,
		Topic: req.Topic,
		Desc:  req.Desc,
	}
	err := qs.repository.Create(q)
	return err
}

func (qs *QuizService) All() ([]models.Quiz, error) {
	q, err := qs.repository.All()
	return q, err
}

func (qs *QuizService) GetByID(id uint) (models.Quiz, error) {
	q, err := qs.repository.FindID(id)
	return q, err
}

func (qs *QuizService) GetFree() ([]models.Quiz, error) {
	q, err := qs.repository.Free()
	return q, err
}

func (qs *QuizService) FindTitle(title string) ([]models.Quiz, error) {
	q, err := qs.repository.FindTitle(title)
	return q, err
}

func (qs *QuizService) CheckIMG(id uint) (string, bool) {
	return qs.repository.CheckIMG(id)
}

func (qs *QuizService) Cheapest() ([]models.Quiz, error) {
	q, err := qs.repository.Cheapest()
	return q, err
}

func (qs *QuizService) FindTopic(topic string) ([]models.Quiz, error) {
	q, err := qs.repository.FindTopic(topic)
	return q, err
}

func (qs *QuizService) NotVerified() ([]models.Quiz, error) {
	q, err := qs.repository.NotVerified()
	return q, err
}

func (qs *QuizService) Update(id uint, req *dto.QuizEdit) error {
	q := models.Quiz{
		ID:    id,
		Title: req.Title,
		Topic: req.Topic,
	}
	err := qs.repository.Update(q)
	return err
}

func (qs *QuizService) UploadImgCover(id uint, file string) error {
	err := qs.repository.UploadImageCover(id, file)
	return err
}

func (qs *QuizService) Delete(id uint) error {
	err := qs.repository.Delete(id)
	return err
}

func (qs *QuizService) Verify(id uint) error {
	err := qs.repository.Verify(id)
	return err
}
