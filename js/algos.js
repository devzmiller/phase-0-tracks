// Requirements: takes an array of words or phrases and returns the longest word or phrase in the array.

// Function definition.
// Parameter: array
function longestString(array) {

  // Initialize highest character count variable to 0
  // Initialize longest string variable to empty string
  var longestChars = 0;
  var longestString = '';

  // Loop through array
  for (i = 0; i<array.length; i++) {
    // Count each string in array
    charCount = array[i].length;

    // if string's character count is higher than highest character count variable, reset highest character count to the current string's length and reassign longest string variable to current string.
    if (charCount > longestChars) {
      longestChars = charCount;
      longestString = array[i];
    }
  }

  // Return longest string variable. 
  return longestString;
}




  
  



// DRIVER CODE

// Release 1
testArray = ["long", "longer", "longest", "super maximum long"];
testArray2 = ['fish', 'catfish', 'catfish in a hat shaped like a cheese', 'catfish in a hat'];
testArray3 = ['doooooom', 'gloom', 'dismay', 'oops'];
console.log(longestString(testArray));
console.log(longestString(testArray2));
console.log(longestString(testArray3));