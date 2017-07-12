import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Html.beginnerProgram { model = model, view = view,  update = update }

-- MODEL

type alias Model =
   { name: String
   , password: String
   , passwordAgain: String
   , reveal: Bool
   }

model : Model
model = Model "" "" "" False

-- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String
  | Reveal Bool


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    Password password ->
      { model | password = password }
    PasswordAgain password ->
      { model | passwordAgain = password }
    Reveal reveal ->
      { model | reveal = reveal }

-- VIEW

view : Model -> Html Msg
view model =
  Html.form []
    [ input [type_ "text", placeholder "Name", onInput Name] []
    , input [type_ "password", placeholder "Password", onInput Password] []
    , input [type_ "password", placeholder "Re-enter Password", onInput PasswordAgain] []
    , button [ type_ "button", onClick (Reveal True)] [ text "Save"]
    , button [ type_ "button", onClick (Reveal False)] [ text "Hide"]
    , if model.reveal then (showData model) else (div [] [])
    ]

-- Data

showData : Model -> Html Msg
showData model =
  p [] [ text ( model.name ++ " " ++ model.password )]
