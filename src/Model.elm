module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , data : Info
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "", data = Info "" "" "" "" "" 0 0 0 0 0 "" ""}
    , Cmd.none
    )