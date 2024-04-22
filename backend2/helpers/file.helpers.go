package helpers

import (
	"errors"
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

func RandomString() string {
	n := 10
	var letters = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
	s := make([]rune, n)
	for i := range s {
		s[i] = letters[rand.Intn(len(letters))]
	}
	return string(s)
}

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
