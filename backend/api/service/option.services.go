package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
)

type OptionService struct {
	repository *repository.OptionRepository
}

func NewOptionService() *OptionService {
	return &OptionService{
		repository: repository.NewOptRepository(),
	}
}

func (ops *OptionService) Create(questId uint, req *dto.Option) error {
	o := models.Option{
		Alphabet:   req.Alphabet,
		Text:       req.Txt,
		Color:      *req.Color,
		QuestionID: questId,
	}
	err := ops.repository.Create(o)
	return err
}

func (ops *OptionService) FindID(id uint) (models.Option, error) {
	o, err := ops.repository.FindID(id)
	return o, err
}

func (ops *OptionService) Edit(id uint, req *dto.Option) error {
	o := models.Option{
		ID:       id,
		Alphabet: req.Alphabet,
		Text:     req.Txt,
		Color:    *req.Color,
	}
	err := ops.repository.Edit(o)
	return err
}

func (ops *OptionService) Delete(id uint) error {
	err := ops.repository.Delete(id)
	return err
}
