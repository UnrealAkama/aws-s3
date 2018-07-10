open Core
module HeaderMap : Map.S with type Key.t = string
val hash_sha256 : string -> Digestif.SHA256.t
val hmac_sha256 : key:string -> string -> Digestif.SHA256.t
val to_hex : Digestif.SHA256.t -> string
val yyymmdd_of_time : Time.t -> Base.string
val iso8601_of_time : Time.t -> string

val make_signing_key :
  time:Time.t ->
  region:string -> secret_key:string -> service:string -> Digestif.SHA256.t

val string_to_sign :
  time:Time.t ->
  verb:string ->
  path:string ->
  query:string ->
  headers:string HeaderMap.t ->
  payload_sha:string -> region:string -> service:string -> string * string

val make_authorization :
  time:Time.t ->
  verb:string ->
  credentials:Credentials.t ->
  path:string ->
  headers:string HeaderMap.t ->
  query:string ->
  region:string -> service:string -> payload_sha:string -> string
