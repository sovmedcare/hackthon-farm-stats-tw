port module Main exposing (..)

import NativeUi
import NativeUi as Ui exposing (Node, Property)
import NativeUi.Style as Style exposing (..)
import NativeUi.Events exposing (..)
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
    [Elements.view [] [
        text [] [Ui.string "Hello World"],
        button NoOp "#666" "PressMe"
    ]]

--   [ text [] [ Ui.string "Hello World!" ]
--   , text [] [ Ui.string "Hello World! Again~" ]
--   ]

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

button : Msg -> String -> String -> Node Msg
button msg color content =
    text
        [ Ui.style
            [ Style.color "white"
            , Style.textAlign "center"
            , Style.backgroundColor color
            , Style.paddingTop 5
            , Style.paddingBottom 5
            , Style.width 30
            , Style.fontWeight "bold"
            , Style.shadowColor "#000"
            , Style.shadowOpacity 0.25
            , Style.shadowOffset 1 1
            , Style.shadowRadius 5
            , Style.transform { defaultTransform | rotate = Just "10deg" }
            ]
        , onPress msg
        ]
        [ Ui.string content ]