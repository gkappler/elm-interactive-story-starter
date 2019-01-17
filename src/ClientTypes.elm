module ClientTypes exposing (Msg(..), StorySnippet)


type Msg
    = Interact String
    | Loaded


type alias StorySnippet =
    { interactableName : String
    , interactableCssSelector : String
    , narrative : String
    }
