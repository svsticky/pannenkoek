module Web.Controller.Pancakes where

import Mail.Hailgun
import Mail.Hailgun.Attachment

import Web.Controller.Prelude
import Web.View.Pancakes.Index
import Web.View.Pancakes.New

import Data.Char (ord)
import Text.Parsec (count, many1, parse)
import Text.Parsec.String (Parser)
import Text.ParserCombinators.Parsec.Char (digit, anyChar)

data IBAN = IBAN (Char, Char) (Int, Int) String [Int]

instance Controller PancakesController where
    action PancakesAction = do
        let pancake = (newRecord @Pancake)


        pancakes <- query @Pancake |> fetch

        render IndexView { .. }

    action CreatePancakeAction = do
        let pancake = newRecord @Pancake
        let files =
                filesByName "fileurls"
                |> debug


        pancake
            |> buildPancake
            |> ifValid \case
                Left pancake -> let pancakes = [] in render IndexView { .. } 
                Right pancake -> do
                    pancake <- pancake |> createRecord
                    setSuccessMessage (show files)
                    redirectTo PancakesAction

digitInt :: Parser Int
digitInt = ord <$> digit

parseIban :: Parser IBAN
parseIban = IBAN <$> ((,) <$> anyChar <*> anyChar) <*> ((,) <$> digitInt <*> digitInt) <*> count 4 anyChar <*> count 10 digitInt


validIban :: Text -> ValidatorResult
validIban input = case parse parseIban "" (cs input) of
                    Left err -> Failure "Cannot parse as IBAN"
                    Right (IBAN country smallnumber bank longnumber) -> Success

buildPancake pancake = pancake
    |> fill @'["recipient", "iban", "email", "amount", "description", "forwhat"]
    |> validateField #recipient nonEmpty
    |> validateField #email isEmail
    |> validateField #iban validIban
    |> validateField #amount (isInRange (1, 130000))
