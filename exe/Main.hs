module Main where

import System.IO
import Data.List

type Task = String
type TaskList = [Task]

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    loop []

loop :: TaskList -> IO ()
loop tasks = do
    putStrLn "Commands:"
    putStrLn "  add <task> - Add a task"
    putStrLn "  list - List all tasks"
    putStrLn "  complete <task> - Mark a task as complete"
    putStrLn "  exit - Exit the program"
    putStr "> "
    command <- getLine
    case words command of
        ["add", task] -> loop (task : tasks)
        ["list"] -> do
            putStrLn "Tasks:"
            mapM_ putStrLn (reverse tasks)
            loop tasks
        ["complete", task] -> loop (delete task tasks)
        ["exit"] -> return ()
        _ -> do
            putStrLn "Invalid command"
            loop tasks

