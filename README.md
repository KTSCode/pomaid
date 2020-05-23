# Pomaid
The intention of this project is to be a terminal based task manager with first class pomodoro tracking support

## Inspiration
This project was inspired by two existing pieces of software. Both of these projects are fantastic and do more than Pomaid will ever do, I highly recommend checking them out.

### Taskell
  - [Taskell](https://github.com/smallhadroncollider/taskell): Command-line Kanban board/task manager with support for Trello boards and GitHub projects https://taskell.app
    - Awesome Terminal UI task manager that was almost everything I wanted(only missing the Pomodoro functionality)
    - I tried to pick up Haskell and add it myself, but Haskell just isn't as enjoyable to write as elixir and since this is a project I intent to use and modify a lot I wanted it to be in a language I really enjoy writing

### Kanban Flow
  - [Kanban Flow](https://kanbanflow.com/features): Great Web based task manager with pomodoro support
    - This has been my main task managing tool and is how I will track the beginning of building Pomaid.
    - Kanban Flow does everything that I want except:
      - Run in the terminal
      - First-class keyboard support(really hard to select a task with just the keyboard)
      - Run a script at the beginning and end of each pomodoro
        - Think turning off/on notifications and playing "lofi hip hop beats to study and relax to"
      - [todo.txt support](https://github.com/todotxt/todo.txt)

## Up and running
  - `mix deps.get`
  - `iex -S mix`

## To Do
  - [x] Create basic ratatouille TUI
  - [x] Get OTP app working and tests running
  - [x] Create Todo, Doing, and Done
  - [x] Read in todo.txt files
  - [x] Display tasks from todo.txt files
  - [x] Make 'r' reload todo file
  - [ ] Read in Done tasks
  - [ ] Use arrow keys to select tasks
  - [ ] Move tasks around and automatically reassign priority
  - [ ] Group by project
  - [ ] Allow easily switching between projects as different "boards"
  - [ ] Filtering by context
  - [ ] Allow marking tasks as done, updating the file
  - [ ] Allow creation of new tasks
  - [ ] Allow modification of existing tasks
  - [ ] Pomodoro timer start and stop
  - [ ] Pomodoro count tracking per task
  - [ ] Pomodoro start and end script
  - [ ] Additional Vim keybindings for movement
  - [ ] '?' opens keybindings list

## Misc.
  - [Potential Logo](https://www.istockphoto.com/ca/vector/man-hair-icon-with-text-space-for-your-slogan-tagline-vector-illustration-gm945507648-258245680)
