type t

type stored

type posted

(* POST request exercice to full exercice *)
val t_of_posted : posted -> t

(* Convert normal exercice to stored exercice *)
val stored_of_t : t -> string -> stored

(* Convert stored exercice to normal exercice *)
val t_of_stored : stored -> t

val of_yojson : Yojson.Safe.t -> (t, string) Result.result

val to_yojson : t -> Yojson.Safe.t

val stored_of_yojson : Yojson.Safe.t -> (stored, string) Result.result

val stored_to_yojson : stored -> Yojson.Safe.t

val posted_of_yojson : Yojson.Safe.t -> (posted, string) Result.result

val posted_to_yojson : posted -> Yojson.Safe.t

val name : t -> string

val group : t -> string

val image : t -> string

val exercice_id : t -> int

(* Query to insert a new exercice *)
val insert : stored -> (module Rapper_helper.CONNECTION) -> (unit, [> Caqti_error.call_or_retrieve ]) result Lwt.t
