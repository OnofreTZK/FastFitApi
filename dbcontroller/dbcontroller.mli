open Models

(* type error *)

(* Run all the migrations *)
val migrate : unit -> unit 

(* INSERT client *)
val insert_client : Client.t -> unit Lwt.t

(* INSERT personal *)
val insert_personal : Personal.t -> unit Lwt.t

(* INSERT exercice *)
val insert_exercice : Exercice.t -> unit Lwt.t

(* SELECT * FROM clients *)
val read_all_clients : unit -> Client.t list Lwt.t

(* SELECT * FROM exercice *)
val read_all_exercices : unit -> Exercice.t list Lwt.t
