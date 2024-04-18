package service

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
	"errors"
	"strings"

	"golang.org/x/crypto/bcrypt"
)

type UserService struct {
	repository *repository.UserRepository
}

func NewUserService() *UserService {
	return &UserService{
		repository: repository.NewUserRepository(),
	}
}

func (service *UserService) CreateUser(req *dto.UserCreate) error {
	if strings.Compare(req.Password, req.C_password) != 0 {
		return errors.New("password & password confirmation not match")
	}
	u := models.User{
		Username: req.Username,
		Email:    req.Email,
		Password: req.Password,
	}
	err := service.repository.CreateUser(u)
	return err
}

func (service *UserService) CreateAdmin(req *dto.AdminCreate) error {
	if strings.Compare(req.Password, req.C_password) != 0 {
		return errors.New("password & password confirmation not match")
	}
	adm := models.User{
		Username: req.Username,
		Email:    req.Email,
		Password: req.Password,
		Admin:    true,
	}
	err := service.repository.CreateUser(adm)
	return err
}

func (service *UserService) GetAllUser() ([]models.User, error) {
	user, err := service.repository.AllUser()
	return user, err
}

func (service *UserService) GetUserByID(id uint) (models.User, error) {
	user, err := service.repository.FindUserId(id)
	return user, err
}

func (service *UserService) GetUserByUsername(uname string) (models.User, error) {
	user, err := service.repository.FindUsername(uname)
	return user, err
}

func (service *UserService) GetUserByEmail(email string) (models.User, error) {
	user, err := service.repository.FindEmail(email)
	return user, err
}

func (service *UserService) GetAllAdmin() ([]models.User, error) {
	admin, err := service.repository.AllAdmin()
	return admin, err
}

func (us *UserService) CheckAvatar(id uint) (string, bool) {
	file, err := us.repository.CheckAvatar(id)
	return file, err
}

func (service *UserService) GetAdminByUsername(uname string) (models.User, error) {
	admin, err := service.repository.AdminUsername(uname)
	return admin, err
}

func (service *UserService) GetAdminByEmail(email string) (models.User, error) {
	admin, err := service.repository.AdminEmail(email)
	return admin, err
}

func (service *UserService) GetAdminByID(id uint) (models.User, error) {
	admin, err := service.repository.AdminId(id)
	return admin, err
}

func (us *UserService) FindId(id uint) (models.User, error) {
	user, err := us.repository.FindId(id)
	return user, err
}

func (service *UserService) BlockUser(id uint) error {
	err := service.repository.BlockUser(id)
	return err
}

func (service *UserService) UpdateUsername(id uint, req dto.UpdateUsername) error {

	//ensure that password input is match
	match, err := service.isPasswordMatch(id, req.Password)
	if err != nil {
		return err
	}
	if !match {
		return errors.New("invalid password")
	}

	user := models.User{
		ID:       id,
		Username: req.Username,
	}
	err = service.repository.Updates(user)
	return err
}

func (service *UserService) UpdatePassword(id uint, req *dto.UpdatePassword) error {
	//validate passsword
	match, err := service.isPasswordMatch(id, req.OldPassword)
	if err != nil {
		return err
	}
	if !match {
		return errors.New("invalid password")
	}
	//GENERATE hashed password
	hash, err := bcrypt.GenerateFromPassword([]byte(req.Password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	u := models.User{
		ID:       id,
		Password: string(hash),
	}
	service.repository.Updates(u)
	return err
}

func (service *UserService) SetBio(id uint, bio string) error {
	err := service.repository.SetBio(id, bio)
	return err
}

func (us *UserService) SetAvatar(id uint, file string) error {
	err := us.repository.UploadAvatar(id, file)
	return err
}

func (service *UserService) isPasswordMatch(id uint, input string) (bool, error) {
	//SELECT * FROM users WHERE id = $id
	user, err := service.repository.FindId(id)
	if err != nil {
		return false, err
	}
	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(input))
	if err != nil {
		return false, err
	}
	return true, err
}

func (service *UserService) DeleteUser(id uint, req *dto.DeleteUser) error {
	match, err := service.isPasswordMatch(id, req.Password)
	if err != nil {
		return err
	}
	if !match {
		return errors.New("invalid password")
	}
	service.repository.Delete(id)
	return err
}
