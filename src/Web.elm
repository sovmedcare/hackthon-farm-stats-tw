module Web exposing (..)

import Html exposing (Html, Attribute, h1, div, text, input, button, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
<<<<<<< HEAD
import Http
import Json.Decode as Decode

api : String
api = "https://jsonplaceholder.typicode.com/"

main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Post =
    { userId : Int
    , id : Int
    , title: String
    , body: String
    }

type alias Model =
    { searchInput : String
    , data : Post
    }

init : ( Model, Cmd Msg ) 
init = 
    ( { searchInput = "posts/3", data = Post 0 0 "" ""}
    , Cmd.none
    )
=======

import Model exposing (..)
import Update exposing (..)
import Message exposing (Msg(..))
import Subscription exposing (..)
>>>>>>> a248e179721184e1694bc82a0e0975617ef70567

-- UPDATE

type Msg
    = NoOp
    | ChangeSearchInput String
    | ClickSearch
    | NewPostDate (Result Http.Error Post)

<<<<<<< HEAD
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> ( model, Cmd.none )
        ChangeSearchInput s -> ( { model | searchInput = s }, Cmd.none )
        ClickSearch -> ( model, sendRequest model.searchInput )
        NewPostDate (Ok data) -> ( { model | data = data }, Cmd.none )
        NewPostDate (Err _) -> ( model, Cmd.none )

getPostData : String -> Http.Request Post
getPostData query =
    Http.get (api ++ query) decodePostData

decodePostData: Decode.Decoder Post
decodePostData = 
    Decode.map4 Post
        (Decode.field "userId" Decode.int)
        (Decode.field "id" Decode.int)
        (Decode.field "title" Decode.string)
        (Decode.field "body" Decode.string)

sendRequest: String -> Cmd Msg
sendRequest query = Http.send NewPostDate (getPostData query)

-- SUBSCRIPTION
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

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

=======
main : Program Never Model Msg
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
>>>>>>> a248e179721184e1694bc82a0e0975617ef70567
