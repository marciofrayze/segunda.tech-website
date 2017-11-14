module Main exposing (..)

import Html
    exposing
        ( div
        , form
        , input
        , label
        , text
        , header
        , section
        , span
        )
import Navigation exposing (Location)
import Styles
    exposing
        ( styles
        , titleAttribute
        , titleFont
        , headerStyle
        , headerRowStyle
        , sectionStyle
        )
import Router


type alias Model =
    { currentRoute : Router.Route
    }



-- Program


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


defaultModel : Model
defaultModel =
    Model Router.NotFoundRoute


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    stateBasedOnURL location defaultModel


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = UrlChange Navigation.Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange newLocation ->
            stateBasedOnURL newLocation model


stateBasedOnURL : Location -> Model -> ( Model, Cmd msg )
stateBasedOnURL location model =
    case (Router.parseLocation location) of
        Router.MainPageRoute ->
            ( { model
                | currentRoute = Router.MainPageRoute
              }
            , Cmd.none
            )

        Router.BlogRoute ->
            ( { model
                | currentRoute = Router.BlogRoute
              }
            , Cmd.none
            )

        Router.AboutAuthorRoute ->
            ( { model
                | currentRoute = Router.AboutAuthorRoute
              }
            , Cmd.none
            )

        Router.OtherProjectsRoute ->
            ( { model
                | currentRoute = Router.OtherProjectsRoute
              }
            , Cmd.none
            )

        Router.ExercisesRoutes exercise ->
            ( { model
                | currentRoute = Router.ExercisesRoutes exercise
              }
            , Cmd.none
            )

        _ ->
            ( { model
                | currentRoute = Router.NotFoundRoute
              }
            , Cmd.none
            )



-- View


view : Model -> Html.Html Msg
view model =
    case model.currentRoute of
        Router.MainPageRoute ->
            mainPageDiv

        Router.BlogRoute ->
            mainPageDiv

        Router.AboutAuthorRoute ->
            mainPageDiv

        Router.OtherProjectsRoute ->
            mainPageDiv

        Router.ExercisesRoutes exercise ->
            mainPageDiv

        Router.NotFoundRoute ->
            notFoundDiv


headerDiv : Html.Html msg
headerDiv =
    header
        [ headerStyle
        ]
        [ div
            [ headerRowStyle
            ]
            [ section
                [ sectionStyle
                ]
                [ span
                    [ styles titleFont
                    , titleAttribute
                    ]
                    [ Html.text "Segunda.tech"
                    ]
                ]
            ]
        ]


mainPageDiv : Html.Html msg
mainPageDiv =
    headerDiv


notFoundDiv : Html.Html msg
notFoundDiv =
    div []
        [ Html.text "404 - Página não encontrada."
        ]
