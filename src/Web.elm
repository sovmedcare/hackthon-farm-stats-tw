module Web exposing (..)

import Html exposing (Html, Attribute, h1, div, text, input, button, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Model exposing (..)
import Update exposing (..)
import Message exposing (Msg(..))
import Subscription exposing (..)

-- VIEW
view : Model -> Html Msg
view model = div [] 
    [ div [] [ text "果菜市價查詢" ]
    , input [ placeholder "請輸入蔬果名", onInput ChangeSearchInput ] []
    , button [ onClick ClickSearch ] [ text "搜索" ]
    , div [] 
        [ h1 []
            [
            text "title"
            , div [] [text model.data.title]
            ]
        , h1 []
            [
            text "userId"
            , div [] [text (toString model.data.userId)]
            ]
        , h1 []
            [
            text "body"
            , div [] [text model.data.body]
            ]
        ]
    ]

main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
