//Calling external functions
//We are calling from Contract A -> Contract B

ContractB.call()
//Call function in External Contract
//Using Contract B scope
//Throws no error if it fails
//Returns true/false

ContracB.callcode()
//Call function in External Contract
//Using Contract A scope
//Throws no error if it fails
//Returns true/false

ContractB.delegatecall()
//Call function in External Contract
//Using Contract A scope
//Throws no error if it fails
//Returns true/false
//Exactly the same with the .callcode but the main difference is that this function fixes a bug on .callcode

ContractB.runFunction()
//Call function in External Contract
//Will throw if runFunction() throws

//Exanple of the line 23 function
ContractB.functionA()
//Call function in ContractB
//Using contract B scope
//Will throw if functionA() throws

//Contract Call example:

ContractB.call(bytes4(sha3("runFunction(uint256)")), 100)