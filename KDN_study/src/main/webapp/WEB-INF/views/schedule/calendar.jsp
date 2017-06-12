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
	<script src="js/sch/sysdate.js"></script>

<style>
.fc-sat {color:blue;}
.fc-sun {color:red;}
#modal {	display:none;
				background-color:#FFFFFF;
				position:absolute;
				top:300px;
				left:200px;
				padding:10px;
				border:2px solid #E2E2E2;
				z-Index:9999
			}
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
    
    data.title='${item.sctitle}';
    data.start= '${item.scdate}';
    data.id = '${item.scno}';
    
    // DB로부터 가져온 date를 calendar에 넣기 위해 문자열 재구성
    var a ='${item.scdate}';
    var front_date = a.substring(0,10);
    var mid_date = a.substring(11,13);
    var rear_date = a.substring(14,16);
    var s = front_date + "T" + mid_date + ":" +  rear_date + ":00";  // 연월일T시분
    
    data.start= s;
    
  <c:if test = "${item.sno == sno}">
  	ourSchedule.push(data);
   </c:if>
    
</c:forEach>
// 일시 넘어오나 검사
console.log("cal넘어옴>>>>"+sysdate)

// 시작
$(document).ready(function() {
		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month, agendaWeek, agendaDay, listMonth'
			},
			
			// 수정을 위해 스케줄의 특정 이벤트 항목이 선택되면 실행되는 함수
		    eventClick: function(calEvent, jsEvent, view) {

		    	$('#sch_scno').val(calEvent.id);
		    	$('#sch_title').val(calEvent.title);
		    	var sch_start = $.fullCalendar.formatDate(calEvent.start, 'YYYY-MM-DD HH:mm:ss');
		    	
		    	// 선택한 이벤트의 date를 모달창에 띄우기 위해 문자열 재구성
		    	var front_date = a.substring(0,10);
		        var rear_date = a.substring(13,15);
		        
		        var front_start = sch_start.substring(0,10);
		        var rear_start = sch_start.substring(11,16);
		        sch_start = front_start + "T" + rear_start;
		    	$('#sch_start').val(sch_start);
		      	$('#sch_sno').val("${sno}");
		      	
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
<div style="overflow:hidden" role="dialog" id="createForm" class="container">
	<div id="modal"  class="modal-dialog" >
   		<div class="modal-header">
			<button type="reset" class="close js_close" data-dismiss="modal" id="schedule_close_button">&times;</button>
			<h4 style="color: blue;">
				<span class="glyphicon glyphicon-pencil"></span> 스케줄 수정
			</h4>
		</div>
    
    	<div class="modal-body" id="modal-body">
   			<form role="form" method="GET" action="updateSchedule.do">
   				<input type="hidden" id="sch_scno"  name="scno" />
   				<input type="hidden" id="sch_sno"  name="sno" />
				<div class="form-group">
					<label for="inputScheduleName">스케줄 이름</label> 
					<input type="text" class="form-control" id="sch_title" name="sctitle" placeholder="Schedule Name" value = "">
				</div>
				
				<!-- 		value="2017-10-09T15:38:00" -->
				<div class="form-group">
					<label for="inputScheduleName">일시</label> 
					<input type="datetime-local" id="sch_start" name="scdate" class="form-control"> 
				</div>
				
				<div style="text-align:right">
					<button type="submit" class="btn btn-default btn-success">
						<span class="glyphicon glyphicon-ok"></span> 수정
					</button>
					
					<button type="submit" class="btn btn-default btn-success" data-dismiss="modal" formaction="deleteSchedule.do">
						<span class="glyphicon glyphicon-remove"></span> 삭제
					</button>
					
					<button type="reset" class="btn btn-default btn-success js_close" data-dismiss="modal" id="schedule_close_button">
						<span class="glyphicon glyphicon-remove"></span> 취소
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
		
<div id='calendar'></div>

</body>
</html>
