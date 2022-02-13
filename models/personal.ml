type t =
    {
        name : string;
        username : string;
        age : int;
        email : string;
        password : string;
        (*list_of_clients: string list *)
    }[@@deriving yojson]

type stored =
    {
        id : string;
        stored_name : string;
        stored_username : string;
        stored_age : int;
        stored_email : string;
        stored_password : string;
        (*stored_list_of_clients : string list*)
    }[@@deriving yojson]

type posted =
    {
        posted_name : string [@key "name"];
        posted_username : string [@key "username"];
        posted_email : string [@key "email"];
        posted_password : string [@key "password"]
    }[@@deriving yojson]

let t_of_posted usr =
    {
        name=usr.posted_name;
        username=usr.posted_username;
        age=0;
        email=usr.posted_email;
        password=usr.posted_password;
        (*list_of_clients=[]*)
    }

let stored_of_t usr id =
    {
        id=id; (* need to review this *)
        stored_name=usr.name;
        stored_username=usr.username;
        stored_age=usr.age;
        stored_email=usr.email;
        stored_password=usr.password;
        (*stored_list_of_clients=usr.list_of_clients *)
    }

let t_of_stored usr =
    {
        name=usr.stored_name;
        username=usr.stored_username;
        age=0;
        email=usr.stored_email;
        password=usr.stored_password;
        (*list_of_clients=usr.stored_list_of_clients *)
    }


let name personal = personal.name

let username personal = personal.username

let age personal = personal.age

let email personal = personal.email

let password personal = personal.password

(* let clients personal = personal.list_of_clients *)

(* Queries *)
(*************************************************************************************************)
let insert =
    [%rapper
        execute
            {sql|
                INSERT INTO personal
                VALUES(%string{id}, %string{stored_name}, %string{stored_username}, %int{stored_age},
                %string{stored_email}, %string{stored_password});
            |sql}
            record_in]


