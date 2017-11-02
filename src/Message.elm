module Message exposing (..)

import Types exposing (..)
import Http 

type Msg
    = NoOp
    | ChangeSearchInput String
    | ClickSearch
    | NewPostDate (Result Http.Error Post)