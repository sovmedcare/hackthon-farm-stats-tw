module Web exposing (..)

import Html exposing (Html, Attribute, div, text, input, button, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Http exposing (..)

type alias Model = {
    searchInput: String
}

type Msg = 
    NoOp |
    ChangeSearchInput String | 
    ClickSearch

fetchResult : String -> Cmd Msg
fetchResult : qs =
    let 
        url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ qs
        request = Http.get

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "a" } , Cmd.none )

view : Model -> Html Msg
view model = div [] 
    [ div [] [ text "果菜市價查詢" ]
    , input [ placeholder "請輸入蔬果名", onInput ChangeSearchInput ] []
    , button [ onClick ClickSearch ] [ text "搜索" ]
    ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> ( model, Cmd.none )
        ChangeSearchInput s -> ( { model | searchInput = s }, Cmd.none )
        ClickSearch -> ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }