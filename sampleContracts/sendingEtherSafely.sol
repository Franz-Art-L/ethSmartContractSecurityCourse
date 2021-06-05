//Sending Ether safely

yourAddress.send(x);
//Safe against re-entrency
//2300 gas stipend, this means the gas is capped to fix amount in this line we fixed it in 2300 gas

yourAddress.transfer(x);
//Safe against re-entrency
//Same as send() but with a built in error handling function -> require()
//Revert on failure

yourAddress.call.value(x)()
//Unlimited gas to fallback