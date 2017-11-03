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
            [ row [ "交易日期", "作物名稱", "市場名稱", "平均價" ] Nothing
            , div [] (content model.data)
            ]
        ]

row : List String -> Maybe Int -> Html Msg
row titles index =
    let
        index_ = Maybe.withDefault 0 index
    in
        div [style [("width", "800px"), ("display", "flex"), getBGColor index_]]
            (List.map (\title -> div [style [("flex", "1")]] [text title]) titles)

content : PriceData -> List (Html Msg)
content priceData = 
    if (List.length priceData) == 0 then
        (List.singleton emptyView)
    else
        let dataWithIndex = List.indexedMap (,) priceData
        in List.map (\(index, info) ->
            let titles = [info.tradeDate, info.cropName, info.marketName, toString (round (info.avgPrice * 0.6))]
            in row titles (Just index)
            ) dataWithIndex


emptyView : Html Msg
emptyView = div [] [text "查無資料"]

getBGColor : Int -> (String, String)
getBGColor index =
    if (index % 2) == 0
    then ("background-color", "white")
    else ("background-color", "#81dde8")

main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }