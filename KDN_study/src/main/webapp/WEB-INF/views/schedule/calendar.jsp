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
<script src='js/sch/jquery.min.js'></script>
<script src='js/sch/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script type="text/javascript" src="locale/ko.js"></script>
<!-- <script type="text/javascript" src="js/modal.js"></script> -->
<script src="js/sch/sysdate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
$.noConflict();
jQuery( document ).ready(function( $ ) {
// 모달 창 여는 버튼에 이벤트 걸기
$("#button").click(function() {
    myModal.show(); // 모달창 보여주기
});

// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
$("#confirm_button").click(function() {
    alert("나는 모달창이다.");
    myModal.hide(); // 모달창 감추기
});

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
		    	$('#sctitle').val(calEvent.title);
		    	var sch_start = $.fullCalendar.formatDate(calEvent.start, 'YYYY-MM-DD HH:mm:ss');
		    	
		    	// 선택한 이벤트의 date를 모달창에 띄우기 위해 문자열 재구성
		    	var front_date = a.substring(0,10);
		        var rear_date = a.substring(13,15);
		        
		        var front_start = sch_start.substring(0,10);
		        var rear_start = sch_start.substring(11,16);
		        sch_start = front_start + "T" + rear_start;
		    	$('#sch_start').val(sch_start);
		      	$('#sch_sno').val("${sno}");
		      	$('#sysdate_').val(sch_start);
				$('#sch_title_main').html("<span class='glyphicon glyphicon-pencil'></span> 일정 수정");

				$("#insertsche_form").attr("action", "updateSchedule.do");
				$("#insertsche_form").attr("method", "GET");
				$('#createFormButtons').html('<button type="submit" class="btn btn-default btn-success"><span class="glyphicon glyphicon-ok"></span> 수정</button><button type="submit" class="btn btn-default btn-success" data-dismiss="modal" onClick="modalDeleteClick()"><span class="glyphicon glyphicon-remove"></span> 삭제</button><button type="reset" class="btn btn-default btn-success" data-dismiss="modal" id="schedule_close_button"><span class="glyphicon glyphicon-remove"></span> 취소</button>');
		        $("#createForm").modal();
		        
		        //myModal.show();
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
		});
	});
});
</script>
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
.fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
.fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */
	</style>
</head>

<body>

<div id='calendar'></div>

</body>
</html>
