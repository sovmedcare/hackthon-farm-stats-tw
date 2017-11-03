port module Main exposing (..)

import NativeUi
import NativeUi as Ui exposing (Node, Property)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Events exposing (..)

import Types exposing (..)
import Model exposing (..)
import Update exposing (..)
import Message exposing (Msg(..))
import Subscription exposing (..)

-- VIEW
view : Model -> Node Msg
view model = 
  Elements.view 
    [ Ui.style 
      [ Style.paddingTop 32
      , Style.paddingLeft 16
      ]
    ] 
    [
      text [ Ui.style 
        [ Style.fontSize 30]
      ] [ Ui.string "即時果菜市價查詢" ],
      Elements.view 
        [ Ui.style 
          [ Style.flex 1
          , Style.flexDirection "row"
          , Style.marginTop 12
          ]
        ] 
        [
          textInput 
          [ 
            Ui.style 
            [ Style.width 300
            , Style.height 30
            , Style.backgroundColor "#444444"
            , Style.color "white"
            , Style.padding 5
            ] 
            , onChangeText ChangeSearchInput
          ] [],
          button ClickSearch "grey" "搜索"
        ],    
      Elements.view 
        [ Ui.style 
          [ Style.width 300
          , Style.height 500
          , Style.marginTop 42
          ] 
          , onChangeText ChangeSearchInput
        ]
        [
          case model.searched of
            True -> text [] [ Ui.string "搜索中 ..." ]
            False -> Elements.view [] [table model.data ] 
        ]
    ]

table : PriceData -> Node Msg
table data = 
  Elements.view 
    [ Ui.style [] ]
    ( List.concat [
      [ header () ],
      ( List.take 30 ( List.map (\x -> row x) data ) )
    ] )
    
header : () -> Node Msg  
header () =
  let 
    rowStyle = [ Ui.style [ Style.flex 1 , Style.flexDirection "row"]]
    colStyle = [ Ui.style [ Style.width 90, Style.height 30 ] ]
  in
    Elements.view rowStyle
      [ Elements.view colStyle [text [] [ Ui.string "時間" ]]
      , Elements.view colStyle [text []  [ Ui.string "名稱" ]]
      , Elements.view colStyle [text []  [ Ui.string "市場" ]]
      , Elements.view colStyle [text []  [ Ui.string "均價(台斤)" ]]
      ]

row : Info -> Node Msg
row info = 
  let 
    rowStyle = [ Ui.style [ Style.flex 1 , Style.flexDirection "row", Style.marginTop 16]]
    colStyle = [ Ui.style [ Style.width 90, Style.height 30 ] ]
  in
    Elements.view rowStyle
      [ Elements.view colStyle [text [] [ Ui.string info.tradeDate ]]
      , Elements.view colStyle [text [] [ Ui.string info.cropName ]]
      , Elements.view colStyle [text [] [ Ui.string info.marketName ]]
      , Elements.view colStyle [text [] [ Ui.string (toString (round (info.avgPrice * 0.6)))]]
      ]

button : Msg -> String -> String -> Node Msg
button msg color content =
  text
  [ Ui.style
    [ Style.color "white"
    , Style.textAlign "center"
    , Style.backgroundColor color 
    , Style.width 60
    , Style.height 30
    , Style.fontSize 20
    , Style.paddingTop 5
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