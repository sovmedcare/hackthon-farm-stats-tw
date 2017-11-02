module Subscription exposing (..)
import Model exposing (..)
import Message exposing (..)

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none