module Web exposing (..)

import Html exposing (Html, Attribute, h1, div, text, input, button, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Model exposing (..)
import Update exposing (..)
import Message exposing (Msg(..))
import Subscription exposing (..)
import Types exposing (..)
-- VIEW
view : Model -> Html Msg
view model = div [] 
        [ div [] [ text "果菜市價查詢" ]
        , input [ placeholder "請輸入蔬果名", onInput ChangeSearchInput ] []
        , button [ onClick ClickSearch ] [ text "搜索" ]
        , div [ style [( "width", "800px" ), ( "display", "flex" ), ( "flex-wrap", "wrap" )]]
            [ row [ "交易日期", "作物名稱", "市場名稱", "平均價" ]
            , div [] (content model.data)
            ]
        ]

row : List String -> Html Msg
row titles =
    div [style [("width", "800px"), ("display", "flex")]]
        (List.map (\title -> div [style [("flex", "1")]] [text title]) titles)

content : PriceData -> List (Html Msg)
content priceData = 
    if (List.length priceData) == 0 then
        (List.singleton empty)
    else
        List.map (\info -> row [info.tradeDate, info.cropName, info.marketName, toString (round (info.avgPrice * 0.6))]) priceData

empty : Html Msg
empty = div [] [text "查無資料"]


main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }