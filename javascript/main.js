let boardSize = 8;
let rows = 8;
let columns = 8;
let mines = 10;
let boardArray;
let columnsArray;
window.onload = function () {
    if (window.location.search.includes("?")) {
        calculateDimensionsFromMockData();
    }
    createBoardArrays();
    createBoardElements();
    printBoard();

}

// function createBoard() {
//     for (let i = 0; i < boardSize; i++) {
//         let row = []; 
//         for (let j = 0; j < boardSize; j++) {
//             let cell = document.createElement("div");
//             cell.id = i.toString() + "-" + j.toString();
//             document.getElementById("board").append(cell);
//             row.push(cell);
//         }
//     }
// }

function getMockData() {
    let MockData = window.location.search.split("?");
}

function createBoardArrays() {
    boardArray = new Array(rows);
    columnsArray = new Array(columns);
    for (let i = 0; i < columns; i++) {
        boardArray[i] = new Array(columns);
    }
}

function createBoardElements() {
    for (let i = 0; i < columns; i++) {
        columnsArray[i] = document.createElement("div");
        columnsArray[i].id = "column" + i.toString();
        columnsArray[i].classList = "column";
        document.getElementById("board").append(columnsArray[i]);
        for (let j = 0; j < rows; j++) {
            boardArray[i][j] = document.createElement("div");
            boardArray[i][j].id = i.toString() + "-" + j.toString();
            boardArray[i][j].classList = "hidden";
            boardArray[i][j].classList.add("cell");
        }
    }
}

function printBoard() {
    for (let i = 0; i < columns; i++) {
        for (let j = 0; j < rows; j++) {
            document.getElementById("column" + i.toString()).append(boardArray[i][j]);
        }
    }
}


function calculateDimensionsFromMockData() {
    let ContentUrl = window.location.search.split("?");
    let MockData = ContentUrl[1].split("-");
    rows = MockData.length;
    columns = MockData[0].length;
}


function setRandomMines() {
    for (let i = 0; i < mines; i++) {

    }
}

function checkAllCellsHidden() {
    for (let i = 0; i < columns; i++) {

        for (let j = 0; j < rows; j++) {

        }
    }
}