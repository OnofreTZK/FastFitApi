(*open Dbcontroller*)
open Opium

let () = Printf.printf "Initializing server\n%!";;

let () = Dbcontroller.migrate ()

let () =
    App.empty
    |> App.post "/user/client/create/" Endpoints.create_user_client
    |> App.run_multicore
