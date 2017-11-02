module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , data : PriceData
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "", data = []}
    , Cmd.none
    )