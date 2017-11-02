module Message exposing (..)

import Types exposing (..)
import Http 

type Msg
    = NoOp
    | ChangeSearchInput String
    | ClickSearch
    | NewPriceData (Result Http.Error Response)