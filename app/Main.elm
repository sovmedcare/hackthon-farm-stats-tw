port module Main exposing (..)

import NativeUi
import NativeUi as Ui exposing (Node, Property)
import NativeUi.Elements as Elements exposing (..)

type alias Model = String
type Msg = NoOp

init : ( Model, Cmd Msg) 
init = 
  ( "hello", Cmd.none )

view : Model -> Node Msg
view model = Elements.view [] (mainView model)

mainView : Model -> List (Node Msg)
mainView model = 
  [ text [] [ Ui.string "Hello World!" ]
  , text [] [ Ui.string "Hello World! Again~" ]
  ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    NoOp -> ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main = 
  NativeUi.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }