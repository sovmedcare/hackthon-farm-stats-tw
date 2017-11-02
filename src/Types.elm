module Types exposing (..)

type alias Post =
    { userId : Int
    , id : Int
    , title: String
    , body: String
    }

type alias Trade = 
    { tradeDate: String
    , cropCode: String
    , cropName: String
    , marketCode: String
    , marketName: String
    , highPrice: Float
    , middlePrice: Float
    , lowPrice: Float
    , avgPrice: Float
    , tradeCount: Int
    }