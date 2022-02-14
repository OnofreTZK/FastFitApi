open Opium

(* POST to insert a new client *)
val create_user_client : Request.t -> Response.t Lwt.t

(* POST to insert a new personal *)
val create_user_personal : Request.t -> Response.t Lwt.t

(* POST to insert a new exercice *)
val create_exercice : Request.t -> Response.t Lwt.t

(* POST to insert a new worksheet *)
(*val create_worksheet : Request.t -> Response.t Lwt.t*)

(* GET all clients *)
val read_all_clients : Request.t -> Response.t Lwt.t

(* GET all personal *)
val read_all_personals : Request.t -> Response.t Lwt.t

(* GET all exercices *)
val read_all_exercices : Request.t -> Response.t Lwt.t
