type periodization = ABC | ABCD | ABCDE | ABCDEF | UNK of string

(*type group = Arm | Chest | Shoulder | Back | Leg*)

type t =
    {
        initial_date : float;
        expiration_date : float;
        type_of_periodization : periodization;
        list_of_exercices : Exercice.t list
    }

let string_of_periodization prd = 
    match prd with
        | ABC -> "ABC"
        | ABCD -> "ABCD"
        | ABCDE -> "ABCDE"
        | ABCDEF -> "ABCDEF"
        | UNK msg -> msg

let periodization_of_str = function
    | "ABC" -> ABC
    | "ABCD" -> ABCD
    | "ABCDE" -> ABCDE
    | "ABCDEF" -> ABCDEF
    | _ -> UNK "Unknown periodization" 


let create_worksheet ~initial_date ~expiration_date ~type_of_periodization ~list_of_exercices =
    {initial_date=initial_date; expiration_date=expiration_date; type_of_periodization=type_of_periodization;
    list_of_exercices=list_of_exercices}

let type_of_periodization wst = wst.type_of_periodization

let duration_in_weeks wst =
    let duration_in_seconds = wst.expiration_date -. wst.initial_date
    in
    Float.to_int (duration_in_seconds /. 604800.)

(* I'll probably use some kind of map here(Hashtbl, Map, Set) *)
(* Need to determine how to control not only by time but for miss/rest days *)
let current_group wst = wst |> fun _ -> '-'
let current_worksheet wst = wst.list_of_exercices


