module Styles exposing (..)

import Css exposing (..)
import Html exposing (body, button, div, header, input, li, nav, node)
import Html.Attributes exposing (attribute, placeholder, type_)


-- Helpers


styles : List Style -> Html.Attribute msg
styles =
    Css.asPairs >> Html.Attributes.style



-- Colors


primaryColor : Color
primaryColor =
    hex "F04F5E"



-- Styles


titleAttribute : Html.Attribute msg
titleAttribute =
    Html.Attributes.class "mdc-toolbar__title"


titleFont : List Style
titleFont =
    [ fontFamilies [ "'Press Start 2P'", "serif" ]
    ]


headerStyle : Html.Attribute msg
headerStyle =
    Html.Attributes.class "mdc-toolbar mdc-toolbar--fixed mdc-toolbar--waterfall"


sectionStyle : Html.Attribute msg
sectionStyle =
    Html.Attributes.class "mdc-toolbar__section mdc-toolbar__section--align-start"


headerRowStyle : Html.Attribute msg
headerRowStyle =
    Html.Attributes.class "mdc-toolbar__row"
