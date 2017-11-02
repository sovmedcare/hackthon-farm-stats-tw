module Message exposing (..)

import Types exposing (..)
import Http 

type Msg
    = NoOp
    | ChangeSearchInput String
    | ClickSearch
    | FetchData (Result Http.Error Trade)