module Theme.Locations exposing (view)

import ClientTypes exposing (..)
import Components exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Tuple

render : Direction -> Html Msg
render direction =
    case direction of
        East ->
            text <| " is to the east."
        West ->
            text <| " is to the west."
        North ->
            text <| " is in the north."
        South ->
            text <| " is in the south."
    
         

view :
    List ( Direction, Entity )
    -> Entity
    -> Html Msg
view exits currentLocation =
    let
        exitsList =
            exits
                |> List.map
                    (\( direction, entity ) ->
                        p
                            []
                            [ span
                                [ class "CurrentSummary__StoryElement u-selectable"
                                , onClick <| Interact <| Tuple.first entity
                                ]
                                [ text <| .name <| getDisplayInfo entity ]
                            , render direction
                            ]
                    )
                |> div []
    in
    div [ class "Locations" ]
        [ h3 [] [ text "Connecting locations" ]
        , div [ class "Locations__list" ]
            [ exitsList ]
        ]
