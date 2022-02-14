open Models

exception Query_failed of string

(* Setup of database pool *)
(* ********************************************************************************************* *)
let connection_url = "postgresql://localhost:5432/fastfit?user=admin&password=123456TX&
                      ssl=false"

(* Pool connection to the database *)
let pool =
    match Caqti_lwt.connect_pool ~max_size:10 (Uri.of_string connection_url) with
    | Ok pool -> pool
    | Error err -> failwith (Caqti_error.show err)

(* Execute the queries *)
let dispatch func =
    let open Lwt.Syntax
    in
    let* result = Caqti_lwt.Pool.use func pool 
    in
    match result with
    | Ok data -> Lwt.return data
    | Error error -> Lwt.fail (Query_failed (Caqti_error.show error))
(* ********************************************************************************************* *)


(* Running migrations *)
(* ********************************************************************************************* *)
(* CLIENT TABLE *)
let ensure_table_client_exists =
    [%rapper 
        execute
            {sql|
                CREATE TABLE IF NOT EXISTS clients (
                    id VARCHAR PRIMARY KEY NOT NULL,
                    name VARCHAR NOT NULL,
                    username VARCHAR NOT NULL,
                    age INT NULL,
                    email VARCHAR NOT NULL,
                    password VARCHAR NOT NULL,
                    height VARCHAR NULL,
                    weight VARCHAR NULL,
                    worksheet JSON NULL
                );
            |sql}]
            ()

(* PERSONAL TABLE *)
let ensure_table_personal_exists =
    [%rapper
        execute
            {sql|
                CREATE TABLE IF NOT EXISTS personal (
                    id VARCHAR PRIMARY KEY NOT NULL,
                    name VARCHAR NOT NULL,
                    username VARCHAR NOT NULL,
                    age INT NULL,
                    email VARCHAR NOT NULL,
                    password VARCHAR NOT NULL,
                    list_of_client VARCHAR[] NULL
                );
            |sql}]
            ()

(* EXERCICE TABLE *)
let ensure_table_exercice_exist = 
    [%rapper
        execute
            {sql|
                CREATE TABLE IF NOT EXISTS exercice (
                    id VARCHAR PRIMARY KEY NOT NULL,
                    name VARCHAR NOT NULL,
                    muscular_group VARCHAR NOT NULL,
                    image VARCHAR NULL,
                    exercice_id INT NOT NULL
                );
            |sql}]
            ()


(* Running *)
let migrate () = 
         dispatch ensure_table_client_exists 
         |> Lwt_main.run 
         |> fun () -> dispatch ensure_table_personal_exists
         |> Lwt_main.run 
         |> fun () -> dispatch ensure_table_exercice_exist
         |> Lwt_main.run
(* ********************************************************************************************* *)


(* Queries *)
(* ********************************************************************************************* *)
(* INSERT CLIENT *)
let insert_client usr =
    let stored_id = Uuidm.create `V4 |> Uuidm.to_string
    in
    let stored_usr = (Client.stored_of_t usr stored_id)
    in
    dispatch (Client.insert stored_usr)

(* INSERT personal *)
let insert_personal usr =
    let stored_id = Uuidm.create `V4 |> Uuidm.to_string
    in
    let stored_usr = (Personal.stored_of_t usr stored_id)
    in
    dispatch (Personal.insert stored_usr)

(* INSERT EXERCICE *)
let insert_exercice exc =
    let stored_id = Uuidm.create `V4 |> Uuidm.to_string
    in
    let stored_exc = (Exercice.stored_of_t exc stored_id)
    in
    dispatch (Exercice.insert stored_exc)

(* SELECT CLIENTS *)
let read_all_clients () =
    let open Lwt.Syntax
    in
    let* clients = dispatch Client.read_all
    in
    clients |> Lwt.return

(* SELECT PERSONALS *)
let read_all_personals () =
    let open Lwt.Syntax
    in
    let* personals = dispatch Personal.read_all
    in
    personals |> Lwt.return

(* SELECT EXERCICES *)
let read_all_exercices () =
    let open Lwt.Syntax
    in
    let* exercices = dispatch Exercice.read_all
    in
    exercices |> Lwt.return
