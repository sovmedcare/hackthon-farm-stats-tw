module Update exposing (..)

import Http
import Json.Decode exposing (Decoder, int, string, float)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)
import Model exposing (Model)
import Message exposing (Msg(..))
import Types exposing (..)

api : String
api = "http://13.115.226.214:9999/api/trades?cropName=%E9%A6%99%E8%95%89"

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> ( model, Cmd.none )
        ChangeSearchInput s -> ( { model | searchInput = s }, Cmd.none )
        ClickSearch -> ( model, sendRequest model.searchInput )
        FetchData (Ok data) -> ( { model | data = data }, Cmd.none )
        FetchData (Err _) -> ( model, Cmd.none )

getPostData : String -> Http.Request Trade
getPostData query =
    Http.get (api ++ query) tradeDecoder

tradeDecoder : Decoder Trade
tradeDecoder =
    decode Trade
        |> required "tradeDate" string
        |> required "cropName" string
        |> required "cropCode" string
        |> required "marketCode" string
        |> required "marketName" string
        |> required "highPrice" float
        |> required "middlePrice" float
        |> required "lowPrice" float
        |> required "avgPrice" float
        |> required "tradeCount" int

sendRequest: String -> Cmd Msg
sendRequest query = Http.send FetchData (getPostData query)
