(*open Dbcontroller*)
open Opium

let () = Printf.printf "Initializing server\n%!";;

let () = Dbcontroller.migrate ()

let () =
    App.empty
    |> App.post "/user/client/create/" Endpoints.create_user_client
    |> App.post "/exercice/create/" Endpoints.create_exercice
    |> App.run_multicore
