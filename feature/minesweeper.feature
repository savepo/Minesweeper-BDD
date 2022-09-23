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

# Board

Scenario: Default board
Given the user loads the following mock data: "*o-*o"
Then all the cells should be displayed hidden
And the cell "1-1" should be enabled
And the cell "1-2" should be enabled
And the cell "2-1" should be enabled
And the cell "2-2" should be enabled

# Revealing cells

Scenario: Reveal a cell that contains a mine
Given the user loads the following mock data: "*oo-ooo-ooo"
When the user reveals the cell "1-1"
Then the game should be finished with the following result: "Game over"

Scenario: Revealing all the cells that not contains a mine
Given the user loads the following mock data: "***-ooo-***"
When the user reveals the cell "2-1"
And the user reveals the cell "2-2"
And the user reveals the the cell "2-3"
Then the game should be finished with the following result: "Win"

Scenario Outline: Reveal a cell that is hidden and showing how many mines are next to the clicked cell
Given the user loads the following mock data: <board>
When the cell "2-2" is revealed
Then the cell "2-2" should show <adjacentMines>

Examples:
    | board       | adjacentMines |
    | ooo-ooo-ooo |       0       | 
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
When the user marks the cell "1-1" as mined
Then the cell "1-1" should show "!"

Scenario: Mark a cell as you don't know what it contains (uncertain symbol)
When the user marks the cell "1-1" as uncertain
Then the cell "1-1" should show "?"

Scenario: Removing a mark from a cell
When the user marks the cell "1-1" as no-marked
Then the cell "1-1" should show ""

# Flag counter

Scenario: Flag Counter --> Number that shows how many flags you're able to mark on the board when you haven't marked any cell as a flag
Given the user loads the following mock data: "***-ooo-***"
Then the "FlagCounterDisplay" should show "6"

Scenario: Substract "-1" from the Flag Counter every time a cell is marked with a flag.
Given the user loads the following mock data: "***-ooo-***"
And the "FlagCounterDisplay" shows "6"
When the user marks the cell "1-1" as mined
Then the "FlagCounterDisplay" should show "5"

Scenario: Removing the Flag Mark from a cell
Given the user loads the following mock data: "***-ooo-***"
And the "FlagCounterDisplay" shows "6"
When the user marks the cell "2-3" as mined
And the user marks the cell "2-3" as uncertain
Then the "FlagCounterDisplay" should show "6"

# Time counter
@manual
Scenario: Time Counter --> Number that shows how many seconds have been passed since you clicked the first cell
Given the user loads the following mock data: "***-ooo-***"
And the "TimeCounter" shows ""
When the user reveals the cell "2-1"
Then the "TimeCounter" starts at "0"

@manual
Scenario: Stop the Time Counter when a mine is revealed
Given the "TimeCounter" shows "69"
When the user reveals a cell that contains "bomb"
Then the "TimeCounter" should stop at "69"

# Happy Face

Scenario: Default face image
Then the face image should be "serious"

Scenario: Face image displayed when the game has finished with a lose
Given the user loads the following mock data: "***-ooo-***"
When the user reveals the cell "1-2"
Then the "faceImg" should be "sad"

Scenario: Face image displayed when the game has finished with a win
Given the user loads the following mock data: "ooo-oo*-ooo"
When the user reveals the cell "2-3"
Then the "faceImg" should be "happy"

Scenario: Reset the game pressing the face image
When the user presses on the face image
Then the game should be reseted

# Reveal 0 cells

# Scenario: Reveal a cell that has 0 adjacent mines
# Given the user loads the following mock data: "ooo-ooo-ooo"
# When the user reveals the cell "2-2"
# Then the cell "2-2" should be "0"

Scenario: Reveal adjacents cells when a revealed cell is 0
Given the user loads the following mock data: "*****-*ooo*-*ooo*-*ooo*-*****"
When the user reveals the cell "3-3"
Then the cell "2-2" should be revealed
And the cell "2-3" should be revealed
And the cell "2-4" should be revealed
And the cell "3-2" should be revealed
And the cell "3-4" should be revealed
And the cell "4-2" should be revealed
And the cell "4-3" should be revealed
And the cell "4-4" should be revealed

# Disabled actions

Scenario: When the user reveals a cell that contains a bomb (loses), all the cells get disabled
Given the user loads the following mock data: "oo-*o"
When the user reveals the cell "2-1"
Then the cell "1-1" should be disabled
And the cell "1-2" should be disabled
And the cell "2-1" should be disabled
And the cell "2-2" should be disabled

Scenario: When the user reveals all the empty cells (wins), all the cells get disabled
Given the user loads the following mock data: "**-*o"
When the user reveals the cell "2-2"
Then the cell "1-1" should be disabled
And the cell "1-2" should be disabled
And the cell "2-1" should be disabled
And the cell "2-2" should be disabled

# Reveal bombs

Scenario: Reveal when game has finished with a lose
Given the user loads the following mock data: "**-*o"
When the user reveals the cell "1-1"
Then the cell "1-1" should display a "explodedBomb"
And the cell "1-2" should display a "explodedBomb"
And the cell "2-1" should display a "explodedBomb"

# Computer controls

Scenario: Revealing a cell with the mouse
Given the user loads the following mock data: "*o-o*"
When the user left-click on the cell "1-1"
Then the cell "1-1" should be revealed

Scenario: Mark a cell as if it has a mine (flag) with the mouse
Given the user opens the app
When the user right-click on the cell "1-1"
Then the cell "1-1" should show "!"

Scenario: Mark a cell as you don't know what it contains (uncertain symbol) with the mouse
Given a user opens the app
When the user right-click on the cell "1-1"
And the user right-click on the cell "1-1"
Then the cell "1-1" should show "?"

Scenario: Removing a mark from a cell
Given a user opens the app
When the user right-click on the cell "1-1"
And the user right-click on the cell "1-1"
And the user right-click on the cell "1-1"
Then the cell "1-1" should show ""

Scenario: Reset the game pressing the face image with a mouse
When the user left-click on the face image
Then the game should be reseted

