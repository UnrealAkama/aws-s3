(**/**)
type meth = [ `DELETE | `GET | `HEAD | `POST | `PUT ]

module Make : functor(Io: Types.Io) -> sig
  open Io

  val string_of_method : meth -> string

  val call:
    ?expect:bool ->
    ?connect_timeout_ms:int ->
    endpoint:Region.endpoint ->
    path:string ->
    ?query:(string * string) list ->
    headers:string Headers.t ->
    sink:string Io.Pipe.writer ->
    ?body:string Pipe.reader ->
    meth ->
    (int * string * string Headers.t * string) Deferred.Or_error.t
end
(**/**)
