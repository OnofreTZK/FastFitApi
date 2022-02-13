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
                      | Error _ -> Response.of_json (`Assoc ["Error", `String "Parse error! Verify the client model!"]) 
                                   |> Response.set_status `Bad_request;
    in
    Lwt.return response         
