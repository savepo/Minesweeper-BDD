Feature: Minesweeper

# Definir los datos que usaremos para el test
# "n" = cellNumber
# "o" = cell
# "0" = cell empty
# "." = hidden cell 
# "!" = flag
# "?" = Question Mark
# # Definir los datos que habra debajo del tablero
# "*" = mines
# "o" = cell


Background:
Given a user opens the app


Scenario: Default board
Then the board should be a <x> x <y>

Examples:
    | x | y |
    | 8 | 8 |
