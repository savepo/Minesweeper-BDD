let boardSize = 8;
let rows = 8;
let columns = 8;
let mines = 10;
let board;

window.onload = function () {
    if (window.location.search.includes("?")){
        calculateDimensionsFromMockData();
    }
    createBoard();
    printBoard()
    
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
    console.log(MockData);
}

function createBoard() {
    board = new Array(rows);
    for (let i = 0; i < columns; i++) {
        board[i] = new Array(columns);
    }
}   

function printBoard() {
    let column;
    for (let i = 0; i < columns; i++) {
        column = document.createElement("div");
        column.id = "column" + i.toString();
        column.classList = "column";
        document.getElementById("board").append(column);
        for (let j = 0; j < rows; j++) {
            board[i][j] = document.createElement("div");
            board[i][j].id = i.toString() + "-" + j.toString();
            board[i][j].classList = "hidden";
            board[i][j].classList.add("cell");
            document.getElementById("column" + i.toString()).append(board[i][j]);
        }
    }
}



function calculateDimensionsFromMockData() {
    let ContentUrl = window.location.search.split("?");
    let MockData = ContentUrl[1].split("-");
    rows = MockData.length;
    columns = MockData[0].length;
    console.log(MockData);
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