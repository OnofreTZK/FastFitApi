(*---------------------------------------------------------------------------
   Copyright (c) 2016 Daniel C. Bünzli. All rights reserved.
   Distributed under the ISC license, see terms at the end of the file.
   topkg v1.0.5
  ---------------------------------------------------------------------------*)

open Topkg_result

type artefact = [`Distrib | `Doc | `Alt of string]
type t = { artefacts : artefact list }

let v ?(artefacts = [`Doc; `Distrib]) () = { artefacts }
let artefacts p = p.artefacts
let codec_artefact =
  let tag = function `Distrib -> 0 | `Doc -> 1 | `Alt _ -> 2 in
  let codecs =
    let alt_case =
      ((function `Alt s -> s | _ -> assert false),
       (function s -> `Alt s))
    in
    Topkg_codec.([| const `Distrib; const `Doc; view alt_case string |])
  in
  Topkg_codec.alt ~kind:"artefact" tag codecs

let codec =
  let artefacts = Topkg_codec.(list codec_artefact) in
  let fields =
    (fun p -> p.artefacts),
    (fun artefacts -> { artefacts })
  in
  Topkg_codec.version 0 @@
  Topkg_codec.(view ~kind:"publish" fields artefacts)

(*---------------------------------------------------------------------------
   Copyright (c) 2016 Daniel C. Bünzli

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted, provided that the above
   copyright notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  ---------------------------------------------------------------------------*)
