port module Main exposing (..)

import NativeUi
import NativeUi as Ui exposing (Node, Property)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Style as Style exposing (..)
import NativeUi.Events exposing (..)

import Model exposing (..)
import Update exposing (..)
import Message exposing (Msg(..))
import Subscription exposing (..)

-- VIEW
view : Model -> Node Msg
view model = Elements.view 
    [ Ui.style 
        [ Style.paddingTop 30 ]
    ] 
    [ Elements.view [] [
        text [
            Ui.style 
            [ Style.fontSize 30
            , Style.textAlign "center"
            ]
        ] [ Ui.string "果菜市價查詢" ],
        textInput [ 
            Ui.style 
            [ Style.height 28
            , Style.backgroundColor "#444444"
            , Style.marginTop 8
            , Style.color "white"
            , Style.padding 4
            , Style.borderRadius 4
            ] 
            , onChangeText ChangeSearchInput
        ] [],
        button ClickSearch "grey" "搜索",
        Elements.view [
            
        ] 
        [ text [] [ Ui.string model.data.title ]
        , text [] [ Ui.string (toString model.data.userId) ] 
        , text [] [ Ui.string model.data.body ]  
        ]
  ] ]

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

main : Program Never Model Msg
main = 
  NativeUi.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }