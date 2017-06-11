<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel='stylesheet' href='css/jquery-ui.min.css' />
	<link href='css/fullcalendar.min.css' rel='stylesheet' />
	<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<script src='js/sch/moment.min.js'></script>
	<script src='js/sch/jquery.min.js'></script>
	<script src='js/fullcalendar.min.js'></script>
	<script type="text/javascript" src="locale/ko.js"></script>
	<script type="text/javascript" src="js/modal.js"></script>
	

<style>
.fc-sat {color:blue;}
.fc-sun {color:red;}
#modal {display:none;background-color:#FFFFFF;position:absolute;top:300px;left:200px;padding:10px;border:2px solid #E2E2E2;z-Index:9999}
</style>

<script>
//모달창 인스턴트 생성
var myModal = new Example.Modal({
    id: "modal" // 모달창 아이디 지정
});
  
// 모달 창 여는 버튼에 이벤트 걸기
$("#button").click(function() {
    myModal.show(); // 모달창 보여주기
});
  
// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
$("#confirm_button").click(function() {
    alert("나는 모달창이다.");
    myModal.hide(); // 모달창 감추기
});
</script>


<script>
// 날짜 가져오기, json 생성
var ourSchedule = new Array() ;
<c:forEach items="${myScheduleOfStudyList}" var="item">
    // var data = {title:'${item.sctitle}', start: '${item.scdate}'}
    var data = new Object();
    console.log(">>>>>>>>>>" + '${empno}' );
    data.title='${item.sctitle}';
    data.start= '${item.scdate}';
    
    var a ='${item.scdate}';
    
    var front_date = a.substring(0,10);
    var rear_date = a.substring(13,15);
    

    var mid_date = a.substring(11,12);
    mid_date = Number(mid_date);
    
    console.log("mid>>>>>"+mid_date);
    
    mid_date = mid_date + 12;
    mid_date = String(mid_date);
    
    var s = front_date + "T" + mid_date +   rear_date + "0:00";
    
    data.start= s;
    console.log("front>>" + front_date);
    console.log("rear>>>" + rear_date);
    console.log("s>>>>" + s);
    
    console.log(data.start);
    
  <c:if test = "${item.sno == sno}">
  	ourSchedule.push(data);
   </c:if>
    
</c:forEach>

console.log(ourSchedule);

// 날짜
var date = new Date();
var sysdate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
document.write('현재 날짜: ' + sysdate);

// 시작
$(document).ready(function() {
		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month, agendaWeek, agendaDay, listMonth'
			},
			
		    eventClick: function(calEvent, jsEvent, view) {

		         alert('Event: ' + calEvent.title);
		         /*        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		        alert('View: ' + view.name); */
		        var myModal = new Example.Modal({
		            id: "modal" // 모달창 아이디 지정
		        });
		        
		        myModal.show();
		        // change the border color just for fun
		        $(this).css('border-color', 'red');

		    },
			
			eventBorderColor: '#E2583E',
	 		eventBackgroundColor: '#E2583E',
	 		lang : "ko",
	 		editable: true,
			defaultDate: sysdate,
			navLinks: true, // can click day/week names to navigate views
//			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events:  ourSchedule
			  /*  [
				{
					title: '오잉??',
					start: '2017-06-25'
				},
				{
					title: 'Long Event',
					start: '2017-05-07',
					end: '2017-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-05-11',
					end: '2017-05-13'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T10:30:00',
					end: '2017-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-05-13T07:00:00'
				}
			]    */
		});
		
	});

</script>


<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 5000px;
		margin: 0 auto;
	}
	
	.fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */

</style>
</head>
<body>

<div id="modal">
    <h3>Test Modal</h3>
    <p>이 창은 모달창입니다.</p>
    <button id="confirm_button">확인</button>
    <button class="js_close">닫기</button>
</div>


	<div id='calendar'></div>

</body>
</html>
