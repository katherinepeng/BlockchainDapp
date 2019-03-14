// link to example
// https://github.com/KPull/eth-guess-the-number-game/blob/master/GuessTheNumberGame.sol
pragma solidity ^0.5.1;

contract Gambling {

	event AnswerSubmitted(uint answer);
	event BetSubmitted(address player, uint bet, uint guessedNum);
	event DisplayResults(string winner);

	// enum State {
	// 	WAITING_BET, WAITING_RESULT, OWNER_WIN, PLAYER_WIN
	// }

	address payable public owner;
	address payable public player;
	uint casinoPot;
	// State public state;
	//the minimum bet a user has to make in order to participate
	//maybe do some calculates about how the minimum bet has to be greater than the transaction cost
	uint private minimumBet = 100 finney;
	uint private totalBet = 0;
	uint private selected;
	uint private transactionCost = totalBet * 1/20;
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
	function _generateRandomNum (string memory _str) private pure returns (uint x) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % 10;
    }
	// function generateRandom () private pure returns(uint _answer) {
	// 	//random number generator (URL method - implement this last)
	// 	answer = 0;

	// }
	
	//grab inputs from what button they press
	function userBetNum (uint _amountBet, uint _buttonPress) public {
		player = msg.sender;
		totalBet = _amountBet;
		selected = _buttonPress;
		//state = WAITING_RESULT;
		emit BetSubmitted(player, totalBet, selected);
	}
	function toString(address x) private pure returns (string memory playerString) {
	    bytes memory b = new bytes(20);
	    for (uint i = 0; i < 20; i++)
	        b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
	    return string(b);
	}
	//display whether the player won or lost, how much the player won
	function results () public payable {
		answer = _generateRandomNum(toString(player));
		if (answer == selected) {
			winner = "You are the winner.";
			player.transfer((totalBet - transactionCost) * 2);
			// casinoPot = casinoPot - totalBet - transactionCost;
		} else {
			winner = "You are the loser.";
			owner.transfer(totalBet);
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
		totalBet = 0;
	}
/*
	function isValidPlayer (uint _playerID) private pure returns (bool) {
		return _playerID < NUM_USERS;
	}
	*/
}
