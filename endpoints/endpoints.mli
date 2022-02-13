open Opium

(* POST to insert a new client *)
val create_user_client : Request.t -> Response.t Lwt.t

(* POST to insert a new personal *)
val create_user_personal : Request.t -> Response.t Lwt.t

(* POST to insert a new exercice *)
val create_exercice : Request.t -> Response.t Lwt.t

(* POST to insert a new worksheet *)
(*val create_worksheet : Request.t -> Response.t Lwt.t*)
