module Update exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Model exposing (Model)
import Message exposing (..)
import Types exposing (Info, PriceData, Response)
import Api exposing (baseUrl)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> ( model, Cmd.none )
        ChangeSearchInput s -> ( { model | searchInput = s }, Cmd.none )
        ClickSearch -> ( model, sendRequest model.searchInput )
        NewPriceData (Ok data) -> ( { model | data = data.docs }, Cmd.none )
        NewPriceData (Err _) -> ( model, Cmd.none )

getPriceData : String -> Http.Request Response
getPriceData query =
    Http.get (baseUrl ++ "cropName=" ++ query) decodeResponse

decodeResponse : Decode.Decoder Response
decodeResponse =
    decode Response
        |> required "docs" (Decode.list decodePriceData)
        |> required "total" (Decode.int)
        |> required "limit" (Decode.int)
        |> required "page" (Decode.int)
        |> required "pages" (Decode.int)

decodePriceData : Decode.Decoder Info
decodePriceData = 
    decode Info
        |> required "tradeDate" (Decode.string)
        |> required "cropCode" (Decode.string)
        |> required "cropName" (Decode.string)
        |> required "marketCode" (Decode.string)
        |> required "marketName" (Decode.string)
        |> required "highPrice" (Decode.float)
        |> required "middlePrice" (Decode.float)
        |> required "lowPrice" (Decode.float)
        |> required "avgPrice" (Decode.float)
        |> required "tradeCount" (Decode.float)
        |> required "updated" (Decode.string)
        |> required "created" (Decode.string)

sendRequest : String -> Cmd Msg
sendRequest query = Http.send NewPriceData (getPriceData query)
