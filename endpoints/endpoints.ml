open Models
open Opium


let create_user_client req =
    let open Lwt.Syntax 
    in
    let* json = Request.to_json req
    in
    let response =
        match json with
        | None -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check the fields!"])
                  |> Response.set_status `Bad_request
        | Some obj -> 
                match [%of_yojson: Client.posted] obj with
                      | Ok clt -> Client.t_of_posted clt
                                    |> Dbcontroller.insert_client
                                    |> fun _ -> Printf.printf "Inserted in database\n%!"
                                    |> fun () -> Response.of_json (`Assoc ["message", `String "Created"])
                                    |> Response.set_status `Created
                      | Error _ -> Response.of_json (`Assoc ["Error", `String "Parse error! Verify the client model!"]) 
                                   |> Response.set_status `Bad_request;
    in
    Lwt.return response         

let create_user_personal req =
    let open Lwt.Syntax 
    in
    let* json = Request.to_json req
    in
    let response =
        match json with
        | None -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check the fields!"])
                  |> Response.set_status `Bad_request
        | Some obj -> 
                match [%of_yojson: Personal.posted] obj with
                      | Ok clt -> Personal.t_of_posted clt
                                    |> Dbcontroller.insert_personal
                                    |> fun _ -> Printf.printf "Inserted in database\n%!"
                                    |> fun () -> Response.of_json (`Assoc ["message", `String "Created"])
                                    |> Response.set_status `Created
                      | Error _ -> Response.of_json (`Assoc ["Error", `String "Parse error! Verify the personal model!"]) 
                                   |> Response.set_status `Bad_request;
    in
    Lwt.return response         

let create_exercice req =
    let open Lwt.Syntax 
    in
    let* json = Request.to_json req
    in
    let response =
        match json with
        | None -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check the fields!"])
                  |> Response.set_status `Bad_request
        | Some obj -> 
                match [%of_yojson: Exercice.posted] obj with
                      | Ok clt -> Exercice.t_of_posted clt
                                    |> Dbcontroller.insert_exercice
                                    |> fun _ -> Printf.printf "Inserted in database\n%!"
                                    |> fun () -> Response.of_json (`Assoc ["message", `String "Created"])
                                    |> Response.set_status `Created
                      | Error _ -> Response.of_json (`Assoc ["Error", `String "Parse error! Verify the exercice model!"]) 
                                   |> Response.set_status `Bad_request;
    in
    Lwt.return response      


let read_all_clients req =
    req 
    |> fun _ -> let open Lwt.Syntax
    in
    let* clients = Dbcontroller.read_all_clients ()
    in
    let json = [%to_yojson: Client.t list] clients
    in
    Response.of_json json
    |> Response.set_status `OK
    |> Lwt.return

let read_all_personals req =
    req 
    |> fun _ -> let open Lwt.Syntax
    in
    let* personals = Dbcontroller.read_all_personals ()
    in
    let json = [%to_yojson: Personal.t list] personals
    in
    Response.of_json json
    |> Response.set_status `OK
    |> Lwt.return

let read_all_exercices req =
    req 
    |> fun _ -> let open Lwt.Syntax
    in
    let* exercices = Dbcontroller.read_all_exercices ()
    in
    let json = [%to_yojson: Exercice.t list] exercices
    in
    Response.of_json json
    |> Response.set_status `OK
    |> Lwt.return

type client_search = {username : string}[@@deriving yojson]
let read_one_client req =
    let open Lwt.Syntax 
    in
    let* input_json = Request.to_json req
    in
    let username = 
        match input_json with
        | None -> "Unknown"
        | Some obj -> 
                match [%of_yojson: client_search] obj with
                | Ok srch -> srch.username 
                | Error _ -> "Parse error"

    in
    let* client = Dbcontroller.read_one_client username 
    in
    let response =
        match username with
        | "Unknown" -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check the input json!"]) |> Response.set_status `Bad_request
        | "Parse error" -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check search model!"]) |> Response.set_status `Bad_request
        | _ -> [%to_yojson: Client.t] client |> Response.of_json |> Response.set_status `OK   
    in
    Lwt.return response

type personal_search = {username : string}[@@deriving yojson]
let read_one_personal req =
    let open Lwt.Syntax 
    in
    let* input_json = Request.to_json req
    in
    let username = 
        match input_json with
        | None -> "Unknown"
        | Some obj -> 
                match [%of_yojson: personal_search] obj with
                | Ok srch -> srch.username 
                | Error _ -> "Parse error"

    in
    let* personal = Dbcontroller.read_one_personal username 
    in
    let response =
        match username with
        | "Unknown" -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check the input json!"]) |> Response.set_status `Bad_request
        | "Parse error" -> Response.of_json (`Assoc ["Error", `String "Parse error! Please check search model!"]) |> Response.set_status `Bad_request
        | _ -> [%to_yojson: Personal.t] personal |> Response.of_json |> Response.set_status `OK   
    in
    Lwt.return response
