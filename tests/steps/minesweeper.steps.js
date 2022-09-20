/* eslint-disable no-undef */
const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');
const { get, find } = require('lodash');

const url = 'http://127.0.0.1:5500/index.html';
// const url = ' https://djraulito.github.io/MineSweeperBDD/';

async function getBoardLength() {
    let board = await page.locator('[id="board"]');
    let
    length = $(board).length;
    
    
}

Given('a user opens the app', async () => {
    await page.goto(url);
});

Given('on the board only shows {string} and the {string} will be placed on the board', function (string, string2) {
    // Write code here that turns the phrase above into concrete actions
  });

Then('the board should be a {int} x {int}', async (int, int2) => {
    getBoardLength();
    find()
	const board = await page.locator('[id="board"]');
	let boardLength = $(board).length;
    let length = Number(int * int2);
    console.log(length);
	expect(boardLength).toBe(length);
});