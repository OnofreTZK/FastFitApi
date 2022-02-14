open Opium

let () = Printf.printf "Initializing server\n%!";;

let () = Dbcontroller.migrate ()

let () =
    App.empty
    |> App.post "/user/client/create/" Endpoints.create_user_client
    |> App.post "/user/personal/create/" Endpoints.create_user_personal
    |> App.post "/exercice/create/" Endpoints.create_exercice
    |> App.get "/user/client/read/all/" Endpoints.read_all_clients
    |> App.get "/user/personal/read/all/" Endpoints.read_all_personals
    |> App.get "/exercice/read/all/" Endpoints.read_all_exercices
    |> App.run_multicore
