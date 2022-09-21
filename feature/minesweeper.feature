Feature: Minesweeper

# Definir los datos que usaremos para el test
# "n" = cellNumber
# "c" = cell
# "o" = cell empty
# "." = hidden cell 
# "!" = flag
# "?" = Question Mark
# # Definir los datos que habra debajo del tablero
# "*" = mines
# "o" = cell


Background:
Given the user opens the app


Scenario: Default board
Then all the cells should be hidden

Scenario: Reveal a cell that contains a mine
Given the user loads the following mock data: "*oo-ooo-ooo"
When the user clicks on the cell "1-1"
Then the game should be finished with the following result: "Game over"

Scenario: Revealing all the cells that not contains a mine
Given the user loads the following mock data: "***-ooo-***"
When the user reveals the cell "2-1"
And the user reveals the cell "2-2"
And the user reveals the the cell "2-3"
Then the game should be finished with the following result: "Win"

Scenario Outline: Reveal a cell that contains empty and showing how many mines are next to the clicked cell
Given the user loads the following mock data: <board>
When the user clicks on the cell "2-2"
Then the cell "2-2" should show <adjacentMines>

Examples:
    | board       | adjacentMines |
    | ooo-ooo-ooo |               | 
    | *oo-ooo-ooo |       1       |
    | **o-ooo-ooo |       2       |
    | ***-ooo-ooo |       3       |
    | ***-*oo-ooo |       4       |
    | ***-*o*-ooo |       5       |
    | ***-*o*-*oo |       6       |
    | ***-*o*-**o |       7       |
    | ***-*o*-*** |       8       |

# Marking cells as something 

Scenario: Mark a cell as if it has a mine (flag)
When the user right-click on the cell "1-1"
Then the cell "1-1" should show "!"

Scenario: Mark a cell as you don't know what it contains (question mark)
Given the cell "1-1" shows "!"
When the user right-click on the cell "1-1"
Then the cell "1-1" should show "?"

Scenario: Removing the question mark from a cell
Given the cell "1-1" shows "?"
When the user right-click on the cell "1-1"
Then the cell "1-1" should show ""

# Flag counter

Scenario: Flag Counter --> Number that shows how many flags you're able to mark on the board when you haven't marked any cell as a flag
Given the user loads the following mock data: "***-ooo-***"
Then the "FlagCounterDisplay" should show "6"

Scenario: Substract "-1" from the Flag Counter every time a cell is marked with a flag.
Given the user loads the following mock data: "***-ooo-***"
And the "FlagCounterDisplay" shows "6"
When the user right-click on the cell "1-1"
Then the "FlagCounterDisplay" should show "5"

Scenario: Removing the Flag Mark from a cell
Given the user loads the following mock data: "***-ooo-***"
And the "FlagCounterDisplay" shows "6"
When the user right-click on the cell "2-3"
And the user right-click on the cell "2-3"
Then the "FlagCounterDisplay" should show "6"

# Time counter

Scenario: Time Counter --> Number that shows how many seconds have been passed since you clicked the first cell
Given the user loads the following mock data: "***-ooo-***"
And the "TimeCounter" shows ""
When the user reveals the cell "2-1"
Then the "TimeCounter" starts at "0"

Scenario: Stop the Time Counter when a mine is revealed
Given the "TimeCounter" shows "69"
When the user reveals a cell that contains "bomb"
Then the "TimeCounter" should stop at "69"





