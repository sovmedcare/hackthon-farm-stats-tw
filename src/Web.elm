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
    , div [style [("width", "500px"), ("display", "flex"), ("flex-wrap", "wrap"), ("justify-content", "space-between")]]
        [ row ["交易日期", "作物名稱", "市場名稱", "平均價"]
        , row ["2017/11/01", "香蕉", "ＸＸＸ", "12.6"]
        ]
    ]

row : List String -> Html Msg
row titles =
    div [style [("width", "100%"), ("display", "flex"), ("justify-content", "space-between")]]
        (List.map (\title -> div [] [text title]) titles)

-- listPrice : PriceData -> List (Html Msg)
-- listPrice priceData =
--     List.Map (\data)

main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }