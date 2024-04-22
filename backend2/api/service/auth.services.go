package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"BagasA11/GSC-quizHealthEdu-BE/helpers"
	"errors"

	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type AuthService struct {
	db *gorm.DB
}

func NewAuthService() *AuthService {
	return &AuthService{
		db: configs.GetDB(),
	}
}

func (as *AuthService) UserLogin(req *dto.UserLogin) (string, error) {
	var user models.User
	err := as.db.Where("username = ? AND admin = ?", req.Username, false).First(&user).Error
	if err != nil {
		return "", err
	}
	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.Password))
	if err != nil {
		return "", err
	}
	if user.Block {
		return "", errors.New("this user was blocked")
	}

	acessToken, err := helpers.GenerateAccessToken(user.ID, user.Username, "user")
	return acessToken, err
}

func (as *AuthService) AdmiLogin(req *dto.AdminLogin) (string, error) {
	var user models.User
	err := as.db.Where("username = ? AND admin = ?", req.Username, true).First(&user).Error
	if err != nil {
		return "", err
	}
	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.Password))
	if err != nil {
		return "", err
	}
	if user.Block {
		return "", errors.New("this user was blocked")
	}

	acessToken, err := helpers.GenerateAccessToken(user.ID, user.Username, "admin")
	return acessToken, err
}

// return error or nil error
func (as *AuthService) Logout(token string) error {
	return helpers.BlacklistToken(token)
}

func (as *AuthService) ListAllToken() ([]models.BlacklistToken, error) {
	bt, err := repository.NewBlacklistRepository().All()
	return bt, err
}
