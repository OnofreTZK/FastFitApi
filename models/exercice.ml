type t =
    {
        name : string;
        group : string;
        image : string;
        exercice_id : int
    }[@@deriving yojson]


let name exc = exc.name

let group exc = exc.group

let image exc = exc.image

let exercice_id  exc = exc.exercice_id 
