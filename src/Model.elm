module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , data : Post
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "posts/3", data = Post 0 0 "" ""}
    , Cmd.none
    )