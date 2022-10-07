let boardSize = 8;
let rows = 8;
let columns = 8;
let numOfMines = 10;
let boardArray;
let columnsArray;
let boardInformation;
window.onload = function () {
    if (window.location.search.includes("?")) {
        calculateDimensionsFromMockData();
        setBoardSize(rows, columns)
    }
    createBoardElements();
    createBoardInformation();
    setRandomMines();
    console.log(boardInformation);
}

function getMockData() {
    let MockData = window.location.search.split("?");
}



function createBoardElements() {
    let element;
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < columns; j++) {
            element = document.createElement("div");
            element.id = i.toString() + "-" + j.toString();
            element.classList.add("hidden");
            element.setAttribute("data-testid", i.toString() + "-" + j.toString());
            document.getElementById("board").append(element)
        }
    }
}

function createBoardInformation() {
    boardInformation = [rows];
    for (let i = 0; i < rows; i++) {
        boardInformation[i] = [columns];
    }

    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < columns; j++) {
            boardInformation[i][j] = "o";
        }
    }
    console.log(boardInformation);
}



function calculateDimensionsFromMockData() {
    let ContentUrl = window.location.search.split("?");
    let MockData = ContentUrl[1].split("-");
    rows = MockData.length;
    columns = MockData[0].length;
}


function setRandomMines() {
    for (let i = 0; i < numOfMines; i++) {
        boardInformation[generateRandomInt(0, rows)][generateRandomInt(0, columns)];
    }
}

function checkAllCellsHidden() {
    for (let i = 0; i < columns; i++) {

        for (let j = 0; j < rows; j++) {

        }
    }
}

function setBoardSize(rows, columns) {
    let widthpx = 50 * columns;
    let heightpx = 50 * rows;

    document.getElementById("board").style.width = widthpx + "px";
    document.getElementById("board").style.height = heightpx + "px";
}

function setMinesFromMockData() {

}

function setRandomMines() {
    for (let i = 0; i < array.length; i++) {


    }
}

function generateRandomInt(min, max) {
    return Math.random() * (max - min) + min;
}

