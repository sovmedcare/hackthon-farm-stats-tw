module Model exposing (..)

import Message exposing (..)

type alias Model = {
    searchInput: String
}

init : ( Model, Cmd Msg ) 
init = ( { searchInput = "a" } , Cmd.none )