type t

val of_yojson : Yojson.Safe.t -> (t, string) Result.result

val to_yojson : t -> Yojson.Safe.t

val name : t -> string

val group : t -> string

val image : t -> string

val exercice_id : t -> int
