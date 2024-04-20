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

func (ops *OptionService) Create(questId uint, userID uint, req *dto.Option) error {
	o := models.Option{
		Alphabet:   req.Alphabet,
		Text:       req.Txt,
		QuestionID: questId,
	}
	err := ops.repository.Create(o, userID)
	return err
}

func (ops *OptionService) FindID(id uint) (models.Option, error) {
	o, err := ops.repository.FindID(id)
	return o, err
}

func (ops *OptionService) Edit(id uint, userID uint, req *dto.Option) error {
	o := models.Option{
		ID:       id,
		Alphabet: req.Alphabet,
		Text:     req.Txt,
	}

	return ops.repository.Edit(o, userID)
}

func (ops *OptionService) Delete(id uint, userID uint) error {
	return ops.repository.Delete(id, userID)
}
