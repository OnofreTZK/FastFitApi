package main

import (
	"fmt"
	"models"
)

func main() {

	amanda := models.Client{
		Person: models.Person{
			Name:     "Amanda Albuquerque",
			Age:      25,
			Email:    "amanda@albuquerque.com",
			Password: "amanda",
		},
		Height: 1.59,
		Weight: 67.0,
	}

	fmt.Println(amanda.Email)
}
