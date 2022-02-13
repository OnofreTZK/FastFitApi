open Models

(* type error *)

(* Run all the migrations *)
val migrate : unit -> unit 

(* INSERT client *)
val insert_client : Client.t -> unit Lwt.t
