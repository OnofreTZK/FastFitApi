type periodization 

(*type group*)

type t

val of_yojson : Yojson.Safe.t -> (t, string) Result.result

val to_yojson : t -> Yojson.Safe.t

(* Create a periodization from a string *)
val periodization_of_str : string -> periodization

(* convert periodization to string e.g: ABC into in "ABC" *)
val string_of_periodization : periodization -> string

(* Create a new worksheet *)
val create_worksheet : initial_date:float -> expiration_date:float -> 
    type_of_periodization:periodization -> list_of_exercices:Exercice.t list -> t

(* Retrieve the type of the worksheet e.g: ABC into in string *)
val type_of_periodization : t -> periodization

(* Retrieve the duration in weeks *)
val duration_in_weeks : t -> int

(* Retrieve the muscular group of the day e.g: Leg day *)
val current_group : t -> char

(* Retrieve the worksheet of the day *)
val current_worksheet : t -> Exercice.t list 

