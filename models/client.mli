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

(* Retrieve height *)
val height : t -> float

(* Retrieve weight *)
val weight : t -> float

(* Retrieve the worksheet *)
val worksheet : t -> Worksheet.t
