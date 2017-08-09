// Ex. 7.2 Exercise
// Coded by Miguel A. Ibarra, Jr. with Devin Miller as navigator

var colors = ["brown","black","mystic mountain blue", "white"];
var names = ["Mildred","Ed","Storm","Apollo"];
var horses = new Object;
colors.push("green");
names.push("Alien");
for (i = 0; i < colors.length; i++) {
    horses[names[i]] = colors[i];
}
console.log(horses);

// Release 2: Building Cars
function Car(components, isFast, color) {
    this.components = components;
    this.isFast = isFast;
    this.color = color
    this.beep = function() { console.log("BEEP!!!") };
    console.log("CAR INITIALIZATION COMPLETE!");
}

var newCar = new Car(["engine","chassis","tires"], true, "red");
console.log(newCar);
newCar.beep();

var oldCar = new Car(["engine","rusty bolts","flat tires"], false, "brown");
console.log(oldCar);

for (var key in oldCar) {
  if (oldCar.hasOwnProperty(key)) {
    console.log(key + " -> " + oldCar[key]);
  }
}