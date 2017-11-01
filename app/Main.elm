port module Main exposing (..)

import NativeUi
import NativeUi as Ui exposing (Node, Property)
import NativeUi.Style as Style exposing (..)
import NativeUi.Events exposing (..)
import NativeUi.Elements as Elements exposing (..)

type alias Model = {
  userInput: String
}
type Msg = NoOp | ChangeSearchInput String

init : ( Model, Cmd Msg) 
init = 
  ( { userInput = "香蕉" } , Cmd.none )

view : Model -> Node Msg
view model = 
  Elements.view [
    Ui.style [
      Style.paddingTop 30
    ]
  ] (mainView model)

mainView : Model -> List (Node Msg)
mainView model =
  [ Elements.view [] [
    text [
      Ui.style [
        Style.fontSize 30,
        Style.textAlign "center"
      ]
    ] [ Ui.string "水果價格搜索" ],
    text [
      Ui.style [
        Style.fontSize 30,
        Style.textAlign "center"
      ]
    ] [ Ui.string model.userInput ],
    Elements.textInput
      [ Ui.style 
          [ Style.height 28
          , Style.backgroundColor "#444444"
          , Style.marginTop 8
          , Style.color "white"
          , Style.padding 4
          , Style.borderRadius 4
          ] 
      , onChangeText ChangeSearchInput
      ]
      [] ,
    button NoOp "grey" "搜索"
  ] ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    NoOp -> ( model, Cmd.none )
    ChangeSearchInput input -> ( { model | userInput = input }, Cmd.none)

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
      , Style.width 100
      , Style.height 40
      , Style.fontSize 20
      , Style.paddingTop 10
      , Style.marginVertical 30
      , Style.marginHorizontal 160
      , Style.fontWeight "bold"
      ]
      , onPress msg
    ]
    [ Ui.string content ]