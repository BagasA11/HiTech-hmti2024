package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
)

type AnswerService struct {
	QuestRepo *repository.QuestionRepository
	ScoreRepo *repository.ScoreRepository
}

func NewAnswerService() *AnswerService {
	return &AnswerService{
		QuestRepo: repository.NewQuestionRepository(),
		ScoreRepo: repository.NewScoreRepository(),
	}
}

func (as *AnswerService) Answer(questID uint, answer dto.Answer, userID uint, quizID uint) {

}

func (as *AnswerService) Check(questID uint, answer dto.Answer, userID uint, quizID uint) (bool, error) {

	quest, err := as.QuestRepo.FindID(questID)
	if err != nil {
		return false, err
	}

	if answer.Checkbox == quest.Answer {
		return true, nil
	}
	return false, nil
}
