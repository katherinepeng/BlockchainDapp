// link to example
// https://github.com/KPull/eth-guess-the-number-game/blob/master/GuessTheNumberGame.sol
pragma solidity ^0.5.5;

contract Gambling {

	event GameBegins(uint bet);
	event SubmitGuess(address player, uint guess);
	event PlayerWins(address player);
	event PlayerLoses(address owner);

	address public owner;
	//the minimum bet a user has to make in order to participate 
	//maybe do some calculates about how the minimum bet has to be greater than the transaction cost
	uint private minimumBet = .1;
	uint private totalBet = 0;
	//uint private currBet;
	//the total num of bets made so far
	uint private numberOfBets = 0;
	//the max number of bets that each user can make
	uint private constant maxAmountOfBets = 10;
	//constant var for the max amount of bets that cannot exceed this val
	uint private constant LIMIT_AMOUNT_BETS = 100;
	//the number that the user presses
	//uint private betNum;
	//constant number of users - only 10 are allowed (maybe we need to use a hashmap or array)
	uint private constant NUM_USERS = 10;
	uint private playerID = 0;

	struct Player {
		uint id;
		uint amountBet;
		uint betNum;
	}
	
	Player[] public players;

	//METHODS

	//constructor??
	constructor() public {
		owner = msg.sender;
	}

	//random number generator (URL method - implement this last)

//not sure what this method is for?
	//setting the values of the player
	function setVal (uint _player) public {

	}

	//grab inputs from what button they press
	function userBetNum (uint _amountBet, uint _buttonPress) public {
		require (playerID < NUM_USERS, "Too many players.");
		players.push(Player(playerID, _amountBet, _buttonPress));
		playerID += 1;
	}

	//display whether the player won or lost, how much the player won
	function results () public {

	}

	//distribute prizes/money
	function distributePrize () {

	}

	//reset the game (reset all the variables) after someone wins the game
	function resetGame () {
		totalBet = 0;
		numberOfBets = 0;
	}
/*
	function isValidPlayer (uint _playerID) private pure returns (bool) {
		return _playerID < NUM_USERS;
	}
	*/
}
