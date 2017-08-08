// function takes string as parameter
// loop through string
// for each character in string, add the negative-indexed version of the character's index to new string
// apparently negative indexing doesn't work in Javascript. Used length method instead.

function reverse(string) {
  var new_string = ""
  for (var i = 0; i < string.length; i++) {
    new_string = new_string + string.charAt(string.length-(i+1));
  }
  return new_string;
}

var backwards = reverse("hello");
if (1 == 1) {
  console.log(backwards);
}