module Model exposing (Model, init)
import Message exposing (Msg)
import Types exposing (..)

type alias Model =
    { searchInput : String
    , loading: Bool
    , data : PriceData
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "香蕉", loading = False, data = []}
    , Cmd.none
    )