module Types exposing (..)

type alias Post =
    { userId : Int
    , id : Int
    , title: String
    , body: String
    }

type alias Response = 
    { docs : PriceData
    , total : Int
    , limit : Int
    , page : Int
    , pages : Int
    }

type alias Info =
    { tradeDate : String
    , cropCode : String
    , cropName : String
    , marketCode : String
    , marketName : String
    , highPrice : Int
    , middlePrice : Int
    , lowPrice : Int
    , avgPrice : Int
    , tradeCount : Int
    , updated : String
    , created : String
    }

type alias PriceData = List Info
