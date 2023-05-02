pragma solidity 0.5.16;

contract Election { // this declares the smart contract
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    } // declares a state variable for the candidate's name

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // The key to the mapping is an unsigned integer, and the value is a Candidate struct
    mapping(uint => Candidate) public candidates;
    // The name of the candidate should be 'public' because end users need to see it

    // Store Candidates Count
    // We need to use a counter cache because Solidity will populate basically an infinite number of structs to be default empty
    uint public candidatesCount;

    // voted event
    // event votedEvent (
    //     uint indexed _candidateId
    // );

    // Constructor-- gets called every time the smart contract is deployed on the blockchain
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private { // we store the string in memory
        candidatesCount ++; // increments our counter cache
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); // records the candidate
    }

    
    // VOTE: Allows an existing voter to vote for an existing candidate
        // Takes in the candidate's ID to identify whom the voter is choosing
        // Visibility is public because it will be called externally
    function vote (uint _candidateId) public {
        
        // Makes sure that the voter hasn't voted yet
        require(!voters[msg.sender]);

        // Makes sure that the voter is voting for a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // Records the vote by adding the voter to the voters 'registry'
        voters[msg.sender] = true;

        // Updates the correct candidate's vote count
        candidates[_candidateId].voteCount ++;
    }

}