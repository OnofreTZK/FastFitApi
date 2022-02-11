type t =
    {
        name : string;
        username : string;
        age : int;
        email : string;
        password : string;
        list_of_clients: Client.t list
    }


let name personal = personal.name

let username personal = personal.username

let age personal = personal.age

let email personal = personal.email

let password personal = personal.password

let clients personal = personal.list_of_clients




