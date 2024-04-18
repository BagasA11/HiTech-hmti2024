package repository

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
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

func (qr *QuizRepository) Create(quiz models.Quiz) error {
	tx := qr.Db.Begin()
	err := tx.Create(&quiz).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return err
}

func (qr *QuizRepository) All() ([]models.Quiz, error) {
	var quizzes []models.Quiz
	err := qr.Db.Where("verified = ?", true).Select("id", "title", "topic", "desc", "free", "price").Order("created_at DESC").Find(&quizzes).Error
	return quizzes, err
}

func (qr *QuizRepository) FindID(id uint) (models.Quiz, error) {
	var quiz models.Quiz
	err := qr.Db.Where("id = ?", id).Where("verified = ?", true).First(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) Free() ([]models.Quiz, error) {
	var freeQuizzes []models.Quiz
	//SELECT * FROM quizzes WHERE free = true
	err := qr.Db.Where("free = ? AND verified = ?", true, true).Select("id", "title", "desc", "free").Find(&freeQuizzes).Error
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
	err := qr.Db.Where("verified = ?", true).Select("id", "title", "topic", "desc", "price").Find(&cheapQuizzes).Order("price ASC").Error
	return cheapQuizzes, err
}

func (qr *QuizRepository) FindTitle(title string) ([]models.Quiz, error) {
	var quiz []models.Quiz
	err := qr.Db.Where("title = ? AND verified = ?", "%"+title+"%", true).Select("id", "title", "desc", "free").Find(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) FindTopic(topic string) ([]models.Quiz, error) {
	var quiz []models.Quiz
	err := qr.Db.Where("topic = ? AND verified = ?", "%"+topic+"%", true).Select("id", "topic", "desc", "free").Find(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) NotVerified() ([]models.Quiz, error) {
	var quiz []models.Quiz
	err := qr.Db.Where("verified = ?", false).Find(&quiz).Error
	return quiz, err
}

func (qr *QuizRepository) Update(quiz models.Quiz) error {
	tx := qr.Db.Begin()
	//UPDATE quizzes SET VALUE({quiz}) WHERE id = {quiz->id}
	err := tx.Model(&models.Quiz{}).Where("id = ?", quiz.ID).Updates(&quiz).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qr *QuizRepository) Verify(id uint) error {
	tx := qr.Db.Begin()
	//update quiz set values Varified = true
	err := tx.Model(&models.Quiz{}).Where("id = ?", id).Update("verified", true).Error
	// error validation
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

func (qr *QuizRepository) UploadImageCover(id uint, file string) error {
	tx := qr.Db.Begin()
	err := tx.Model(&models.Quiz{}).Where("id = ?", id).Update("img", file).Error
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

func (qr *QuizRepository) Delete(id uint) error {
	tx := qr.Db.Begin()
	err := tx.Model(&models.Quiz{}).Where("id = ? AND verified = ?", id, false).Update("deleted_at", time.Now().Unix()).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
