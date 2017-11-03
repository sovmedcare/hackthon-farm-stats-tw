module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , searched: Bool
    , data : PriceData
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "", searched = False, data = []}
    , Cmd.none
    )