type t =
    {
        name : string;
        username : string;
        age : int;
        email : string;
        password : string;
        height : float;
        weight : float;
        worksheet: Worksheet.t
    }


let name client = client.name

let username client = client.username

let age client = client.age

let email client = client.email

let password client = client.password

let height client = client.height

let weight client = client.weight

let worksheet client = client.worksheet

