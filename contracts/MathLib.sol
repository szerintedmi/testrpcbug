pragma solidity ^0.4.11;

library MathLib {

    function roundedDiv(uint a, uint b)  constant returns (uint256 z) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        z = a / b;
        if ( a % b >= b / 2) {
            z++;  // no need for safe add b/c it can happen only if we divided the input
        }
        return z;
    }
}
