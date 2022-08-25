//SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.9;
 
contract Lotterycontract{
    //Lottery contract that allows forthe deposits of funds in ether...
    // Pick random winners
    // Generate random numbers..
    // check Lottery balance
    // check players..
    uint time;
    uint public amount = 0.1 ether;
    address public Potowner; //address of the person that deploys the contract..
    address payable[] public Potplayers; //dynamic array of type address payable

    event participants (address _participants, uint256 _value);
    
    // declaring the constructor
    constructor(uint _time){
        Potowner= msg.sender;
        time = _time + block.timestamp; 

    }
    modifier onlyOwner(){
        require(msg.sender == Potowner, "you ain't the owner!");
        _;
    }


    function enterLotteryPot()external payable{
         require(msg.value == amount, "Not enough fund!");
         require(block.timestamp > time, "Chief! you can't place a bet...");
         Potplayers.push(payable(msg.sender)); //addresses of players entering the lottery...
         emit participants(msg.sender, msg.value);
    }
    

    function GenerateRandomNumber() private view returns(uint){
      // return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, Potplayers.length)));
       return uint(keccak256(abi.encodePacked(Potowner, block.timestamp)));
    }


     function getPotBalance() public view onlyOwner returns (uint){
        return address(this).balance;
    }

    
    function LotteryPotWinner() public { // function that select the winner
        require(msg.sender == Potowner, "Not an owner");
        require (Potplayers.length >= 2, "potwinners not up to 2");
        uint random = GenerateRandomNumber();
        uint _index = random % Potplayers.length;
        //address payable LotteryWinner;
        Potplayers[_index].transfer(getPotBalance());
        Potplayers = new address payable[](0); //reset the state of the contract........
    }
    

    function checkPlayers() external view returns(address payable[] memory){
        return Potplayers;
    }

   
    receive () payable external{

     }
}