package models

type Person struct {
	Name     string `json: "name"`
	Age      int    `json: "age"`
	Email    string `json: "email"`
	Password string `json: "password"` // must be encrypted
}

// Exercice is the "class" that represents a unique exercice
type Exercice struct {
	Name  string    `json: "name"`
	Group string    `json: "group"`
	Image []float32 `json: "image_address"`
}

// Client is the "class" that represents the client
type Client struct {
	Person               // inherit all the attributes
	Height    float32    `json: "height"`
	Weight    float32    `json: "weight"`
	Worksheet []Exercice `json: "worksheet"`
}

// Personal is the "class" that represents the personal
type Personal struct {
	Person                 // inherit all the attributes
	ListOfClients []Client `json: "list_of_clients"`
}
