package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"errors"
	"time"

	"gorm.io/gorm"
)

type QuizRepository struct {
	Db *gorm.DB
}

func NewQuizRepository() *QuizRepository {
	return &QuizRepository{
		Db: configs.GetDB(),
	}
}

func (qr *QuizRepository) Create(quiz models.Quiz) (uint, error) {
	tx := qr.Db.Begin()
	err := tx.Create(&quiz).Error
	if err != nil {
		tx.Rollback()
		return 0, err
	}
	tx.Commit()
	return quiz.ID, err
}

func (qr *QuizRepository) All() ([]models.Quiz, error) {
	var quizzes []models.Quiz
	err := qr.Db.Where("public = ?", true).Select("id", "title", "topic", "desc", "free", "price").Order("created_at DESC").Find(&quizzes).Error
	return quizzes, err
}

func (qr *QuizRepository) FindID(id uint) (models.Quiz, error) {
	var quiz models.Quiz
	err := qr.Db.Where("id = ? AND public = ?", id, true).First(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) Free() ([]models.Quiz, error) {
	var freeQuizzes []models.Quiz
	//SELECT * FROM quizzes WHERE free = true
	err := qr.Db.Where("free = ?", true).Select("id", "title", "desc", "free").Find(&freeQuizzes).Error
	return freeQuizzes, err
}

func (qr *QuizRepository) CheckIMG(id uint) (string, bool) {
	var quiz models.Quiz
	err := qr.Db.Where("id = ?", id).First(&quiz).Error
	if err != nil {
		return "", false
	}
	if *quiz.Img == "" {
		return "", false
	}
	return *quiz.Img, true
}

func (qr *QuizRepository) Cheapest() ([]models.Quiz, error) {
	var cheapQuizzes []models.Quiz
	//SELECT "id", "title", "topic", "desc", "price" FROM quizzess ORDER BY price ASC
	err := qr.Db.Where("public = ?", true).Select("id", "title", "topic", "desc", "price").Find(&cheapQuizzes).Order("price ASC").Error
	return cheapQuizzes, err
}

func (qr *QuizRepository) FindTitle(title string) ([]models.Quiz, error) {
	var quiz []models.Quiz
	err := qr.Db.Where("title = ? AND public = ?", "%"+title+"%", true).Select("id", "title", "desc", "free").Find(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) FindTopic(topic string) ([]models.Quiz, error) {
	var quiz []models.Quiz
	err := qr.Db.Where("topic = ? AND public = ?", "%"+topic+"%", true).Select("id", "topic", "desc", "free").Find(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) Self(userID uint) ([]models.Quiz, error) {
	var quiz []models.Quiz
	err := qr.Db.Where("user_id = ?", userID).Select("id", "topic", "desc", "free").Find(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) Update(quiz models.Quiz, userID uint) error {
	tx := qr.Db.Begin()
	//UPDATE quizzes SET VALUE({quiz}) WHERE id = {quiz->id}
	err := tx.Model(&models.Quiz{}).Where("id = ? AND user_id = ?", quiz.ID, userID).Updates(&quiz).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qr *QuizRepository) UploadImageCover(id uint, userID uint, file string) error {
	tx := qr.Db.Begin()
	err := tx.Model(&models.Quiz{}).Where("id = ? AND user_id = ?", id, userID).Update("img", file).Error
	if tx.RowsAffected == 0 {
		return errors.New("content not found or hidden")
	}
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

/*set new Discount value to : <id> <discount>*/
func (qr *QuizRepository) SetDiscount(id uint, disc uint8) error {
	tx := qr.Db.Begin()
	err := tx.Model(&models.Quiz{}).Where("id = ? AND free = ?", id, false).Update("disc", disc).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qr *QuizRepository) Delete(id uint, userID uint) error {
	tx := qr.Db.Begin()
	err := tx.Model(&models.Quiz{}).Where("id = ? AND user_id = ?", id, userID).Update("deleted_at", time.Now().Unix()).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
