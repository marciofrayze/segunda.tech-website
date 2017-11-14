module Router exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = MainPageRoute
    | BlogRoute
    | AboutAuthorRoute
    | OtherProjectsRoute
    | ExercisesRoutes String
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MainPageRoute top
        , map BlogRoute (s "blog")
        , map AboutAuthorRoute (s "sobre")
        , map OtherProjectsRoute (s "projetos")
        , map ExercisesRoutes (s "exercicios" </> string)
        ]


parseLocation : Location -> Route
parseLocation location =
    case parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
