// link to example
// https://github.com/KPull/eth-guess-the-number-game/blob/master/GuessTheNumberGame.sol
pragma solidity ^0.5.5;

contract Gambling {

	event AnswerSubmitted(uint answer);
	event BetSubmitted(address player, uint bet, uint guessedNum);
	event DisplayResults(string winner);

	// enum State {
	// 	WAITING_BET, WAITING_RESULT, OWNER_WIN, PLAYER_WIN
	// }

	address public owner;
	address public player;
	uint casinoPot;
	// State public state;
	//the minimum bet a user has to make in order to participate
	//maybe do some calculates about how the minimum bet has to be greater than the transaction cost
	uint private minimumBet = .1;
	uint private totalBet = 0;
	uint private selected;
	uint private transactionCost = totalBet * .05;
	uint private answer;
	string private winner;
	//uint private currBet;
	//the total num of bets made so far
	//uint private numberOfBets = 0;
	//the max number of bets that each user can make
	// uint private constant maxAmountOfBets = 10;
	//constant var for the max amount of bets that cannot exceed this val
	// uint private constant LIMIT_AMOUNT_BETS = 100;
	//the number that the user presses
	//uint private betNum;
	//constant number of users - only 10 are allowed (maybe we need to use a hashmap or array)
	// uint private constant NUM_USERS = 10;
	// uint private userID;

	//METHODS

	//constructor??
	constructor() public {
		owner = msg.sender;
		//set player address
	}

	function generateRandom () private pure returns(uint _answer) {
		//random number generator (URL method - implement this last)
		answer = 0;

	}
	
	//grab inputs from what button they press
	function userBetNum (uint _amountBet, uint _buttonPress) public {
		player = msg.sender;
		totalBet = _amountBet;
		selected = _buttonPress;
		state = WAITING_RESULT;
		emit BetSubmitted(player, totalBet, selected);
	}

	//display whether the player won or lost, how much the player won
	function results () public payable {
		uint result = 0;
		if (result == selected) {
			winner = "You are the winner.";
			casinoPot = casinoPot - totalBet - transactionCost;
		} else {
			winner = "You are the loser.";
			player.transfer(totalBet - transactionCost);
		}

		emit DisplayResults(winner);
		resetGame();
	}

	// //distribute prizes/money
	// function distributePrize () address payable {

	// }

	//reset the game (reset all the variables) after someone wins the game
	function resetGame () private {
		totalBet = 0;
		numberOfBets = 0;
	}
/*
	function isValidPlayer (uint _playerID) private pure returns (bool) {
		return _playerID < NUM_USERS;
	}
	*/
}
