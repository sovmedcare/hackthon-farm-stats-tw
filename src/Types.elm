module Types exposing (..)

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
    , highPrice : Float
    , middlePrice : Float
    , lowPrice : Float
    , avgPrice : Float
    , tradeCount : Float
    , updated : String
    , created : String
    }

type alias PriceData = List Info