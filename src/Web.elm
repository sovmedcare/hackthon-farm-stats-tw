module Web exposing (..)

import Html exposing (Html, Attribute, div, text, input, button, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

import Model exposing (..)
import Update exposing (..)
import Message exposing (Msg(..))
import Subscription exposing (..)

view : Model -> Html Msg
view model = div [] 
    [ div [] [ text "果菜市價查詢" ]
    , input [ placeholder "請輸入蔬果名", onInput ChangeSearchInput ] []
    , button [ onClick ClickSearch ] [ text "搜索" ]
    ]

main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }