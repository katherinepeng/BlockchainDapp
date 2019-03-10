pragma solidity 0.4.20;

contact Gambling {
	address owner;

	//the minimum bet a user has to make in order to participate 
	//maybe do some calculates about how the minimum bet has to be greater than the transaction cost
	uint public minimumBet = 1;

	//the total amount of etherum/money in this pool
	uint public totalBet;

	//the amount of the current bet
	unit public currBet;

	//the total num of bets made so far
	unit public numberOfBets;

	//the max number of bets that each user can make
	uint public maxAmountOfBets = 10;

	//constant var for the max amount of bets that cannot exceed this val
	uint public constant LIMIT_AMOUNT_BETS = 100;

	//the number that the user presses
	unit public betNum;

	//constant number of users - only 10 are allowed (maybe we need to use a hashmap or array)
	unit public constant NUM_USERS = 10;


	//METHODS

	//constructor??
	function Gambling () public {

	}

	//random number generator (URL method - implement this last)

	//setting the values of the player
	function setVal (uint player) public {

	}

	//grab inputs from what button they press
	function userBetNum (uint buttonPress) public {

	}

	//display whether the player won or lost, how much the player won
	function results () public {

	}

	//distribute prizes/money
	function distributePrize () {

	}

	//reset the game (reset all the variables) after someone wins the game
	function resetGame () {
		
	}



}