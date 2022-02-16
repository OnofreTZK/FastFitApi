type t =
    {
        name : string;
        username : string;
        age : int;
        email : string;
        password : string;
        height : float;
        weight : float;
        (*worksheet: Worksheet.t *)
    }[@@deriving yojson]

type stored =
    {
        id : string;
        stored_name : string;
        stored_username : string;
        stored_age : int;
        stored_email : string;
        stored_password : string;
        stored_height : float;
        stored_weight : float;
        (*stored_worksheet: Worksheet.t*)
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
        height=0.0;
        weight=0.0;
        (*worksheet=Worksheet.empty () *)
    }

let stored_of_t usr id =
    {
        id=id; (* need to review this *)
        stored_name=usr.name;
        stored_username=usr.username;
        stored_age=usr.age;
        stored_email=usr.email;
        stored_password=usr.password;
        stored_height=usr.height;
        stored_weight=usr.weight;
        (*stored_worksheet=usr.worksheet*)
    }

let t_of_stored usr =
    {
        name=usr.stored_name;
        username=usr.stored_username;
        age=0;
        email=usr.stored_email;
        password=usr.stored_password;
        height=0.0;
        weight=0.0;
        (*worksheet=(Worksheet.empty ())*)
    }
    

let name client = client.name

let username client = client.username

let age client = client.age

let email client = client.email

let password client = client.password

let height client = client.height

let weight client = client.weight

(*let worksheet client = client.worksheet *)

(* Queries *)
(*************************************************************************************************)
(* INSERT *)
let insert =
    [%rapper
        execute
            {sql|
                INSERT INTO clients
                VALUES(%string{id}, %string{stored_name}, %string{stored_username}, %int{stored_age},
                %string{stored_email}, %string{stored_password}, %float{stored_height}, 
                %float{stored_weight});
            |sql}
            record_in]

(* INSERT *)
let read_all =
    [%rapper
        get_many
            {sql|
                SELECT @string{name}, @string{username}, @int{age},
                @string{email}, @string{password}, @float{height}, 
                @float{weight}
                FROM clients;
            |sql}
            record_out]
            ()

(* INSERT *)
let read_one =
    [%rapper
        get_one
            {sql|
                SELECT @string{name}, @string{username}, @int{age},
                @string{email}, @string{password}, @float{height}, 
                @float{weight}
                FROM clients
                WHERE username = %string{username_id};
            |sql}
            record_out]

