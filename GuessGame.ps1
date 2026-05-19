$highScore = 999  # lower is better (fewer guesses)

function Play-Game {
    $target = Get-Random -Minimum 1 -Maximum 101  # random number 1-100
    $attempts = 0
    $won = $false

    Write-Host ""
    Write-Host "I'm thinking of a number between 1 and 100..." -ForegroundColor Cyan
    Write-Host "Type 'quit' at any time to exit." -ForegroundColor DarkGray
    Write-Host ""

    while (-not $won) {
        $input = Read-Host "Your guess"

        if ($input -eq "quit") {
            Write-Host "Quitting... the number was $target" -ForegroundColor Yellow
            return -1
        }

        # make sure its actually a number
        if ($input -notmatch '^\d+$') {
            Write-Host "Please enter a valid number!" -ForegroundColor Red
            continue
        }

        $guess = [int]$input
        $attempts++

        if ($guess -lt 1 -or $guess -gt 100) {
            Write-Host "Number must be between 1 and 100!" -ForegroundColor Red
            $attempts--  # dont count bad input as an attempt
            continue
        }

        if ($guess -lt $target) {
            Write-Host "Too low! Try higher." -ForegroundColor Yellow
        }
        elseif ($guess -gt $target) {
            Write-Host "Too high! Try lower." -ForegroundColor Yellow
        }
        else {
            $won = $true
            Write-Host ""
            Write-Host "Correct!! The number was $target" -ForegroundColor Green

            # little rating message based on how many guesses it took
            if ($attempts -le 3) {
                Write-Host "Wow, only $attempts guesses? That's amazing!!" -ForegroundColor Magenta
            }
            elseif ($attempts -le 6) {
                Write-Host "Nice! You got it in $attempts guesses." -ForegroundColor Green
            }
            elseif ($attempts -le 10) {
                Write-Host "Not bad - $attempts guesses." -ForegroundColor Cyan
            }
            else {
                Write-Host "You got there eventually... $attempts guesses lol" -ForegroundColor DarkYellow
            }
        }
    }

    return $attempts
}

# ---- main program ----

Write-Host "==============================" -ForegroundColor Cyan
Write-Host "   Number Guessing Game!      " -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan

$playAgain = $true

while ($playAgain) {
    $result = Play-Game

    if ($result -eq -1) {
        break  # player quit mid game
    }

    # update high score
    if ($result -lt $highScore) {
        $highScore = $result
        Write-Host "New best score: $highScore guesses!" -ForegroundColor Magenta
    }
    else {
        Write-Host "Your best so far: $highScore guesses" -ForegroundColor DarkGray
    }

    Write-Host ""
    $again = Read-Host "Play again? (y/n)"

    if ($again -ne "y" -and $again -ne "Y") {
        $playAgain = $false
    }
}

Write-Host ""
Write-Host "Thanks for playing! Final best score: $highScore guesses" -ForegroundColor Cyan
Write-Host ""
