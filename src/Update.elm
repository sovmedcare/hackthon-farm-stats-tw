module Update exposing (..)

import Http
import Json.Decode as Decode
import Model exposing (Model)
import Message exposing (Msg(..))
import Types exposing (..)

api : String
api = "https://jsonplaceholder.typicode.com/"

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> ( model, Cmd.none )
        ChangeSearchInput s -> ( { model | searchInput = s }, Cmd.none )
        ClickSearch -> ( model, sendRequest model.searchInput )
        NewPostDate (Ok data) -> ( { model | data = data }, Cmd.none )
        NewPostDate (Err _) -> ( model, Cmd.none )

getPostData : String -> Http.Request Post
getPostData query =
    Http.get (api ++ query) decodePostData

decodePostData: Decode.Decoder Post
decodePostData = 
    Decode.map4 Post
        (Decode.field "userId" Decode.int)
        (Decode.field "id" Decode.int)
        (Decode.field "title" Decode.string)
        (Decode.field "body" Decode.string)

sendRequest: String -> Cmd Msg
sendRequest query = Http.send NewPostDate (getPostData query)
