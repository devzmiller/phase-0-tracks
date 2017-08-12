// Requirements: takes an array of words or phrases and returns the longest word or phrase in the array.

// Function definition.
// Parameter: array
function longestString(array) {

  // Initialize highest character count variable to 0
  // Initialize longest string variable to empty string
  var longestChars = 0;
  var longestString = '';

  // Loop through array
  for (var i = 0; i<array.length; i++) {
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


// Requirements: take two objects, check if they have at least one matching key-value pair, return true or false
//Parameters: object 1, object 2
function checkMatch(object1, object2) {

  // Loop through key-value pairs in object 1
  for (var key in object1) {
    // for each key-value pair, check if object 2 has a matching key
    if (key in object2) {
      // if key matches, check if the key's value matches
      if (object1[key] == object2[key]) {
        //if key's value matches, return true
        return true;
      }
    }
  }
  // return false (only should happen if a match not already found and returned true)
  return false;
}

// Requirements: takes an integer for length, builds an array of strings of the given length. Words have randomly varying length, min 1 letter max 10 letters. Words can be nonsense. Return the array.
// Parameter: array length
  
function createArray(arrayLength) {

  // Initialize array.
  var words = [];

  // Loop to create words and add to array.
  for (i = 0; i < arrayLength; i++) {

    // Generate a random number for each word length.
    var wordLength = Math.floor((Math.random() * 10) + 1);

    var currentWord = ''

    // Loop the length of the current word. Generate a random letter each time using unicode values (97 through 122 for lowercase letters) and converting to string. 
    for (var x=0; x < wordLength; x++) {
      var intLetter = Math.floor((Math.random() * 26) + 97);
      currentWord = currentWord + String.fromCharCode(intLetter);
    }

    // Add the word to the array.
    words.push(currentWord);
  }

  // Return the array.
  return words;
}
  
// DRIVER CODE

// Release 0
testArray = ["long", "longer", "longest", "super maximum long"];
testArray2 = ['fish', 'catfish', 'catfish in a hat shaped like a cheese', 'catfish in a hat'];
testArray3 = ['doooooom', 'gloom', 'dismay', 'oops'];
console.log(longestString(testArray));
console.log(longestString(testArray2));
console.log(longestString(testArray3));

// Release 1
console.log(checkMatch({name: "Bob", age: 12, hair: "black"}, {name: "Frances", age: 30, hair: "black"}));
console.log(checkMatch({name: "Wilfred", age: 34, hair: "blue"}, {name: "Marvin", age: 8, hair: "red"}));
console.log(checkMatch({name: "Melissa", age: 20, hair: "orange"}, {name: "Ethel", age: 20, hair: "blond"}));
console.log(checkMatch({name: "Melissa", age: 20, hair: "orange"}, {hat: "top", glasses: "sun"}))

// Release 2

for (n=0; n < 10; n++) {
  array = createArray(5);

  console.log(array);

  console.log(longestString(array));
}
