package main

import (
	"fmt"
	"models"
)

func main() {

	amanda := models.Client{
		Person: models.Person{
			Name:     "Xuba Peituda",
			Age:      18,
			Email:    "xuba@rabuda.pqp",
			Password: "pirarucu",
		},
		Height: 10.0,
		Weight: 500.0,
	}

	fmt.Println(amanda.Email)
}
