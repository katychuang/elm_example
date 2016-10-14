-- Example elm app
-- Author: @katychuang

import Html exposing (Html, button, div, input, text, p)
import Html.App as App
import Html.Attributes exposing (style, placeholder)
import Html.Events exposing (onClick, onInput)
import String

main =
  App.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = 
 { val : Int
 , content : String 
 }

model : Model
model =
  Model 1 ""


-- UPDATE

type Msg
    = Increment
    | Decrement
    | Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | val = model.val + 1 }

    Decrement ->
      if model.val < 1 then
        { model | val = 10 }
      else
        { model | val = model.val - 1 }
    
    Change newContent ->
      { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
  div [ style [("padding", "20px")] ]
    [ div [] [
        input [ placeholder "Text to reverse", onInput Change ] []
        , p [] [ text (String.reverse model.content) ]
    ]
    , button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.val) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

