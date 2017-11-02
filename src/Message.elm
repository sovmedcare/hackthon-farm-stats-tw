module Message exposing (..)

import Types exposing (..)
import Http 

type Msg
    = NoOp
    | ChangeSearchInput String
    | ClickSearch
    | NewInfoData (Result Http.Error Info)