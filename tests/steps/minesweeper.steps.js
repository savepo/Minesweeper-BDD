/* eslint-disable no-undef */
const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');
const { get, find } = require('lodash');

const url = 'http://127.0.0.1:5500/index.html';

async function getBoardLength() {
    let board = await page.locator('[id="board"]');
    let
        length = $(board).length;


}

Given('the user opens the app', async () => {
    await page.goto(url);
});


Given('the user loads the following mock data: {string}', async (string) => {
    let url = 'http://127.0.0.1:5500/index.html?' + string;
    await page.goto(url);
});

Then('all the cells should be hidden', async () => {
    const hiddenClass = await page.$$('.hidden');
    const cellClass = await page.$$('.cell');
    expect(hiddenClass.length).toBe(cellClass.length);
});

Then('the number of rows in the board should be {string}', async function (string) {
    const rowClass = await page.$$('#column0 div');
    let rowNumber = rowClass.length;
    expect(rowNumber.toString()).toBe(string);
});

Then('the number of columns in the board should be {string}', async function (string) {
    const columnClass = await page.$$('[class="column"]');

    let columnNumber = columnClass.length;
    expect(columnNumber.toString()).toBe(string);
});

Then('all the cells should be enabled', async function () {
    const cellNum = await page.$$('.cell');
    let CellId = "";
    let Cell;
    for (let i = 0; i < cellNum.length; i++) {
        for (let j = 0; j < array.length; j++) {
            CellId = i.toString() + "-" + j.toString();
            Cell = await page.$$('#' + CellId);
            expect(Cell).toBeEnabled();
        }

    }
});

