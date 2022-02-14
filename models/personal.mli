type t

type stored

type posted

val of_yojson : Yojson.Safe.t -> (t, string) Result.result

val to_yojson : t -> Yojson.Safe.t

val stored_of_yojson : Yojson.Safe.t -> (stored, string) Result.result

val stored_to_yojson : stored -> Yojson.Safe.t

val posted_of_yojson : Yojson.Safe.t -> (posted, string) Result.result

val posted_to_yojson : posted -> Yojson.Safe.t

(* POST request user to full user *)
val t_of_posted : posted -> t

(* Convert stored personal to normal personal *)
val t_of_stored : stored -> t

(* Convert normal personal to stored personal *)
val stored_of_t : t -> string -> stored

(* Retrieve name *)
val name : t -> string

(* Retrieve username *)
val username : t -> string

(* Retrieve age *)
val age : t -> int

(* Retrieve email *)
val email : t -> string

(* Retrieve password hash *)
val password : t -> string

(*val clients : t -> string list *)

(* Query to insert a new user *)
val insert : stored -> (module Rapper_helper.CONNECTION) -> (unit, [> Caqti_error.call_or_retrieve ]) result Lwt.t

(* Query to read all personals *)
val read_all : (module Rapper_helper.CONNECTION) -> (t list, [> Caqti_error.call_or_retrieve ]) result Lwt.t

(* Query to read one client *)
val read_one : username_id:string -> (module Rapper_helper.CONNECTION) -> (t, [> Caqti_error.call_or_retrieve ]) result Lwt.t
