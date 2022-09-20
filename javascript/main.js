let boardSize = 8;

window.onload = function () {
    createBoard();
  }

function createBoard() {
    for (let i = 0; i < boardSize; i++) {
        let row = []; 
        for (let j = 0; j < boardSize; j++) {
            let cell = document.createElement("div");
            cell.id = i.toString() + "-" + j.toString();
            document.getElementById("board").append(cell);
            row.push(cell);
        }
    }
}
