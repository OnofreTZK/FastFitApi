type t

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

val clients : t -> Client.t list
