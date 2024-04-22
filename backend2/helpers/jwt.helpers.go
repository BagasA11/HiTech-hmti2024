package helpers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"BagasA11/GSC-quizHealthEdu-BE/api/repository"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"fmt"
	"log"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

func GenerateAccessToken(ID uint, username string, tokenType string) (string, error) {
	claims := &configs.JWTClaims{
		ID:        ID,
		Username:  username,
		TokenType: tokenType,
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour / 2)),
		},
	}
	accessToken, err := jwt.NewWithClaims(jwt.SigningMethodHS256, claims).SignedString(configs.JWT_KEY)
	if err != nil {
		log.Panic()
		return "", err
	}
	return accessToken, err
}

func ValidateToken(inputToken string) (*configs.JWTClaims, error) {
	//check token from blacklist token
	br := repository.NewBlacklistRepository()
	err := br.FindToken(inputToken)
	if err != nil {
		return nil, err
	}

	//get token from input token
	token, err := jwt.ParseWithClaims(inputToken, &configs.JWTClaims{}, func(t *jwt.Token) (interface{}, error) {
		return []byte(configs.JWT_KEY), nil
	})
	if err != nil {
		return nil, err
	}
	//get claims from token
	//if ok, then return claims, nil
	if claims, ok := token.Claims.(*configs.JWTClaims); ok && token.Valid {
		return claims, nil
	}
	//else: return nil, error
	return nil, fmt.Errorf("invalid token")
}

func UpdateToken(refreshToken string) (string, error) {
	claims, err := ValidateToken(refreshToken)
	if err != nil {
		return "", err
	}
	newToken, err := GenerateAccessToken(claims.ID, claims.Username, claims.TokenType)
	if err != nil {
		return "", err
	}
	return newToken, err
}

func BlacklistToken(token string) error {
	bt := models.BlacklistToken{
		Token: token,
	}
	if err := repository.NewBlacklistRepository().Create(bt); err != nil {
		return err
	}
	return nil
}
