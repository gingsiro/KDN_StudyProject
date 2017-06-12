/**
 * current time
 */

var date = new Date();

// yyyy-MM-ddThh:mm

var mon = (date.getMonth()+1);
var min = date.getMinutes();

if(mon < 9){
	mon = "0" + mon;
}

if(min < 9){
	  min = "0" + min;
}

var sysdate = date.getFullYear() + "-" 
				+ mon + "-" 
				+ date.getDate() + "T"
				+ date.getHours() + ":"
				+ min
				+ ":00";