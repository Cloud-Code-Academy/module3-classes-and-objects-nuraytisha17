// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


/*
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
*/
    // Use Math class to generate number between 50 and 100
    Integer minNumber = 50;
    Integer maxNumber = 100;

    Integer randomNumber = (Integer)(Math.random()) * (maxNumber - minNumber) + minNumber;
    System.debug('Random number is: ' + randomNumber );
    // Return the random integer
    //retun randomNumber;