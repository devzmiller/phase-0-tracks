var background = document.getElementsByTagName('body')[0];

background.style.backgroundColor = '#0059B2';

function change_flag(event) {
	event.target.src = "flag2.png"
	
}

function change_flag2(event) {
	event.target.src = "flag.png"
}

function add_arrr(h1) {
	h1.style.display = "block";
}

function remove_arrr(h1) {
	h1.style.display = "none";
}


// Tried this first!
// function add_arrr(event) {
// 	var h1_exists = document.getElementsByTagName("h1");
// 	if (h1_exists.length == 0) {
// 		var h1 = document.createElement('h1');
// 		var h1text = document.createTextNode("Arrrrr!");
// 		h1.appendChild(h1text);
// 		document.body.appendChild(h1);
// 		h1.style.display = "block";
// 	} 
	
// }

var h1 = document.createElement('h1');
var h1text = document.createTextNode("Arrrrr!");
h1.appendChild(h1text);
document.body.appendChild(h1);
h1.style.display = "none";

var flag = document.getElementsByTagName('img')[0];

flag.addEventListener('mouseenter', change_flag);
flag.addEventListener('mouseenter', function(){add_arrr(h1)});

flag.addEventListener('mouseleave', change_flag2);
flag.addEventListener('mouseleave', function(){remove_arrr(h1)});