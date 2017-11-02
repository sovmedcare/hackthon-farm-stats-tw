module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , data : List Trade
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "posts/3", data = [] }
    , Cmd.none
    )