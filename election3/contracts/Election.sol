pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // The key to the mapping is an unsigned integer, and the value is a Candidate struct
    mapping(uint => Candidate) public candidates;
    // The name of the candidate should be 'public' because end users need to see it

    // Store Candidates Count
    uint public candidatesCount;

    event votedEvent (
        uint indexed _candidateId
    );

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // VOTE: Allows an existing voter to vote for an existing candidate
        // Takes in the candidate's ID to identify whom the voter is choosing
        // Visibility is public because it will be called externally
    function vote (uint _candidateId) public {
        
        // Makes sure that the voter hasn't voted yet
        require(!voters[msg.sender], "revert");

        // Makes sure that the voter is voting for a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // Records the vote by adding the voter to the voters 'registry'
        voters[msg.sender] = true;

        // Updates the correct candidate's vote count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }

}