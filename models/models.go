package models

type Person struct {
	Name     string
	Age      int
	Email    string
	Password string // must be encrypted
}

// Exercice is the "class" that represents a unique exercice
type Exercice struct {
	Name  string
	Group string
	Image []float32
}

// Client is the "class" that represents the client
type Client struct {
	Person    // inherit all the attributes
	Height    float32
	Weight    float32
	Worksheet []Exercice
}

// Personal is the "class" that represents the personal
type Personal struct {
	Person        // inherit all the attributes
	ListOfClients []Client
}
