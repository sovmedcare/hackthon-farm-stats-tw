module Types exposing (Post, Info)

type alias Post =
    { userId : Int
    , id : Int
    , title: String
    , body: String
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