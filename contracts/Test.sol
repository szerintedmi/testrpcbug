pragma solidity ^0.4.11;
import "./MathLib.sol";

contract Test {

    function roundedDivNonLib(uint a, uint b)  constant returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 z = a / b;
        if ( a % b >= b / 2) {
            z++;  // no need for safe add b/c it can happen only if we divided the input
        }
        return z;
    }

    event e_testLib(uint msgValue, uint roundedValue, uint nonRoundedValue);
    function test() payable returns(uint msgValue, uint roundedValue, uint nonRoundedValue ) {
        nonRoundedValue = MathLib.roundedDiv(msg.value,  10);
        roundedValue = msg.value / 2;
        e_testLib(msg.value, nonRoundedValue, roundedValue );
        return  (msg.value, nonRoundedValue, roundedValue);
    }

    event e_testNonLib(uint msgValue, uint roundedValue, uint nonRoundedValue);
    function testNonLib() payable returns(uint msgValue, uint roundedValue, uint nonRoundedValue ) {
        nonRoundedValue = roundedDivNonLib(msg.value,  10);
        roundedValue = msg.value / 2;
        e_testNonLib(msg.value, nonRoundedValue, roundedValue );
        return  (msg.value, nonRoundedValue, roundedValue);
    }

    function getBalance() constant returns (uint balance) {
        return this.balance;
    }
}
