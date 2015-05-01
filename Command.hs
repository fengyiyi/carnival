module Command
    ( Command(..)
    , parseCommand
    ) where

import Import hiding ((<>))
import Options.Applicative

data Command = RunServer | DeleteStaleComments

parseCommand :: IO Command
parseCommand = execParser $ info (helper <*> commandParser) fullDesc

commandParser :: Parser Command
commandParser = subparser
    ( command "server"
        ( info
            (pure RunServer)
            (progDesc "Run the Carnival HTTP server (default)")
        )
    <> command "delete_stale_comments"
        ( info
            (pure DeleteStaleComments)
            (progDesc "Delete comments on the demo site older than one week")
        )
    ) <|> pure RunServer
