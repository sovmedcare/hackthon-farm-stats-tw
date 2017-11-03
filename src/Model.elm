module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , data : PriceData
    , loading : Bool
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "香蕉", data = [], loading = False }
    , Cmd.none
    )