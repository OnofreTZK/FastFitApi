type t =
    {
        name : string;
        muscular_group : string;
        image : string;
        exercice_id : int
    }[@@deriving yojson]

type stored =
    {
        id : string;
        stored_name : string;
        stored_group : string;
        stored_image : string;
        stored_exercice_id : int
    }[@@deriving yojson]

type posted =
    {
        posted_name : string [@key "name"];
        posted_group : string [@key "group"];
        (*posted_image : string;
        posted_exercice_id : int*)
    }[@@deriving yojson]

let t_of_posted exc =
    {
        name=exc.posted_name;
        muscular_group=exc.posted_group;
        image="";
        exercice_id=0
    }

let stored_of_t exc id =
    {
        id=id;
        stored_name=exc.name;
        stored_group=exc.muscular_group;
        stored_image=exc.image;
        stored_exercice_id=exc.exercice_id
    }

let t_of_stored exc =
    {
        name=exc.stored_name;
        muscular_group=exc.stored_group;
        image=exc.stored_image;
        exercice_id=int_of_string exc.id
    }

let name exc = exc.name

let group exc = exc.muscular_group

let image exc = exc.image

let exercice_id  exc = exc.exercice_id 

(* Queries *)
(*************************************************************************************************)
let insert =
    [%rapper
        execute
            {sql|
                INSERT INTO exercice
                VALUES(%string{id}, %string{stored_name}, %string{stored_group}, %string{stored_image},
                %int{stored_exercice_id});
            |sql}
            record_in]

let read_all =
    [%rapper
        get_many
            {sql|
                SELECT @string{name}, @string{muscular_group}, @string{image}, @int{exercice_id}
                FROM exercice;
            |sql}
            record_out]
            ()
