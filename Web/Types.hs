module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data Pannekoek = Pannekoek 
     {
     } deriving (Eq, Show)

data PannekoekController
    = PannekoekAction
    | NewPannekoekAction
    deriving (Eq, Show, Data)

data PancakesController
    = PancakesAction
    | CreatePancakeAction
    deriving (Eq, Show, Data)
