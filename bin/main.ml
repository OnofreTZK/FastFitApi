(*open Dbcontroller*)
open Opium

let () = Printf.printf "Starting here...\n%!";;

let () = Dbcontroller.migrate ()

let () =
    App.empty 
    |> App.run_multicore
