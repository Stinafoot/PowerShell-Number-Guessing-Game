# PowerShell Number Guessing Game

A simple number guessing game I wrote in PowerShell while learning scripting for my systems class. 
---

## What It Does

The program picks a random number between 1 and 100 and you have to guess it. After each guess it tells you if you went too high or too low. It tracks how many guesses it took you and keeps a best score for the session.

- Random number generation with `Get-Random`
- Colored output using `-ForegroundColor` to make it easier to read
- Input validation (rejects non-numbers and out-of-range values)
- A rating message at the end depending on how many guesses you needed
- Keeps track of your best score across multiple rounds
- Type `quit` at any time to exit

---

## How to Run

You need PowerShell (comes with Windows, or install [PowerShell 7+](https://github.com/PowerShell/PowerShell) for Mac/Linux).

**1. Clone the repo or download the file**
```bash
git clone https://github.com/yourusername/GuessGame.git
cd GuessGame
```

**2. Run the script**
```powershell
.\GuessGame.ps1
```

If you get an error about execution policy, run this first (just allows local scripts to run):
```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

---

## Example Output

```
==============================
   Number Guessing Game!
==============================

I'm thinking of a number between 1 and 100...
Type 'quit' at any time to exit.

Your guess: 50
Too high! Try lower.
Your guess: 25
Too low! Try higher.
Your guess: 37
Too high! Try lower.
Your guess: 31
Correct!! The number was 31
Nice! You got it in 4 guesses.

Your best so far: 4 guesses

Play again? (y/n):
```

---

## Stuff I Learned

- How PowerShell handles user input with `Read-Host`
- Using `-match` and regex to validate input
- Casting strings to integers with `[int]`
- Colored terminal output with `Write-Host` and `-ForegroundColor`
- Basic function structure in PowerShell and returning values
- `Get-Random` for generating numbers in a range


## Requirements

- Windows PowerShell 5.1+ **or** [PowerShell 7+](https://github.com/PowerShell/PowerShell) (cross-platform)
- No external modules needed
