package helpers

import (
	"errors"
	"fmt"
	"math/rand"
	"os"
	"slices"
	"strings"
)

// Check file in directory
// Delete file in directory

// package
//
// fmt
// strings

/*check if file in directory: true if exist, false is not exist*/
func FileExist(filename string, e string) bool {
	//entity check
	s := []string{"quiz", "user", "question"}
	if !slices.Contains(s, strings.ToLower(e)) {
		return false
	}
	path := "asset/img/" + strings.ToLower(e) + "/"
	file, err := os.Open(path + filename)
	if err != nil {
		return false
	}
	defer file.Close()
	return true
}

func RemoveFile(filename string, ety string) error {
	//filename check
	//entity check
	s := []string{"quiz", "user", "question"}
	if !slices.Contains(s, strings.ToLower(ety)) {
		return errors.New("entity must be in: " + strings.Join(s, ", "))
	}
	pathToFile := "asset/img/" + strings.ToLower(ety) + "/" + filename
	err := os.Remove(pathToFile)
	if err != nil {
		return err
	}
	return nil
	// path := "asset/img/" + strings.ToLower(ety) + "/"
}

func Rename(filename string, typ string, ext string, id uint) (string, error) {
	tys := []string{"user", "quiz", "questions"}
	if !slices.Contains(tys, strings.ToLower(typ)) {
		return "", fmt.Errorf("type must be in %s", strings.Join(tys, ","))
	}

	if !slices.Contains([]string{"jpg", "jpeg", "png", "webp"}, strings.ToLower(ext)) {
		return "", errors.New("not image file")
	}

	return fmt.Sprintf("%s_%s.%s", typ, random(), ext), nil
}

func random() string {
	var letters = []rune("asfddhd46789")
	s := make([]rune, 5)
	for i := range s {
		s[i] = letters[rand.Intn(len(letters))]
	}
	return string(s)
}
