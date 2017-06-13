/**
 * current time
 */

var date = new Date();

// yyyy-MM-ddThh:mm

var mon = (date.getMonth()+1);
var hour = date.getHours();
var min = date.getMinutes();

mon = parseInt(mon);
hour = parseInt(hour);
min = parseInt(min);

if(mon < 10){
	mon = mon.toString();
	mon = "0" + mon;
}

if(hour < 10){
	hour = hour.toString();
	hour = "0" + hour;
}

if(min < 10){
	min = min.toString();
	min = "0" + min;
}


var sysdate = date.getFullYear() + "-" 
				+ mon + "-" 
				+ date.getDate() + "T"
				+ hour + ":"
				+ min
				+ ":00";



