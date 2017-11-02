module Update exposing (..)

import Model exposing (..)
import Message exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> ( model, Cmd.none )
        ChangeSearchInput s -> ( { model | searchInput = s }, Cmd.none )
        ClickSearch -> ( model, Cmd.none )