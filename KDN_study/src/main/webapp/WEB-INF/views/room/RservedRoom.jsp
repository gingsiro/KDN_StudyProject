<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker 한국어로 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<% 
	String date = null;
	if(request.getQueryString() != null){
		date = request.getParameter("roomResvDate").toString();
	}else{
	}
%>
<script type="text/javascript">
	$.noConflict();
	jQuery( document ).ready(function( $ ) {
		$(function() {
			$.datepicker.setDefaults($.datepicker.regional['ko']);
			$( "#roomResvDate" ).datepicker({minDate: 0 , dateFormat: 'yy-mm-dd'});
	});

	$("#popbutton").click(function() {
		$('div.modal').modal({});
	})
		
	$("input[type='submit']").attr("disabled", true);//비활성화
		if (<%=date != null%>) {
			$("#rsvtable").attr("style", "display");
		}
		else{
		}
	});
function textBoxNull(){
	if ( $('#roomResvDate').val() != null) {
		$("input[type='submit']").attr("disabled", false); //활성화
	} else {
		$("input[type='submit']").attr("disabled", true); //비활성화
	}
}

function reserveRoom(rno, time) {
	//location.href = "createStudy.do"
	//alart(rno);
	$('#rno').val(rno);
	var timeString;
	
	if(time == 1) {
		timeString = "7-9시";
	} else if(time == 2) {
		timeString = "9-12시";
	} else if(time == 3) {
		timeString = "13-15시";
	} else if(time == 4) {
		timeString = "15-18시";
	} else if(time == 5) {
		timeString = "19-21시";
	} else if(time == 6) {
		timeString = "21-23시";
	} 
	
	$('#rsvTimeString').val(timeString);
	$('#rsvcode').val(time);
	
	<%-- $('#empno').val(<%= request.getSession().getAttribute("empno") %>); --%>
}
	</script>
</head>
<body>
		<nav id="menu" >
			<form style="text-align:center" method="get" action="reservedRoom.do" >
				<input type="text" onchange="textBoxNull()" id="roomResvDate" name="roomResvDate" placeholder="날짜를 입력하세요." required="required">
				<input type="submit" value="예약 조회" id="rsvbtn">
			</form>
		</nav>
 		<article id="mainContent">
		<!-- Modal -->
		<div id="roomRsvForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 style="color: blue;">
							<span class="glyphicon glyphicon-pencil"></span> 스터디룸 예약
						</h4>
					</div>
					<div class="modal-body">
						<form role="form" method="POST" action="reserveRoom.do">
							<div class="form-group">
							<label for="inputRoomName">룸 번호</label> <input type="text"
								class="form-control" id="rno" name="rno"
								placeholder="Room NUMBER" readonly="readonly">
							</div>
							
							<div class="form-group">
							<label for="inputRsvDate">예약 날짜</label><input type="text"
								class="form-control" id="rsvdate" name="rsvdate" value=<%= date %>
								placeholder="Room RESERVE DATE" readonly="readonly">
							</div>
						
							<div class="form-group">
							<label for="inputRsvTime">예약 시간</label> <input type="text"
								class="form-control" id="rsvTimeString" name="rsvTimeString" 
								placeholder="Room RESERVE TIME" readonly="readonly">
							</div>
							
							<div class="form-group">
							<label for="inputRsvEmpno">예약자 사번</label> <input type="text"
								class="form-control" id="empno" name="empno" value='${ empno }'
								placeholder="Room RESERVER" readonly="readonly">
							</div>
							
							 <div class="form-group">
								<label for="inputRsvStudy">룸을 예약할 스터디</label> 
								<select id="sno" name="sno" class="form-control">
									 <c:forEach var="mystudy" items="${ myStudyList }">
										<option value="${ mystudy.sno}">${ mystudy.sname }</option>
									</c:forEach> 
								</select>
							</div> 
							
					
							<input type="hidden" id="rsvcode" name="rsvcode"  />
							
						<button type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 예약
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 취소
							</button>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<% 
			if(date != null) {
		%>
		<h2>스터디룸 예약 정보</h2>
		<p><font color="red"><%= date %></font> 의 KDN Study 포털의 룸 예약 현황 목록입니다.<br/>가능한 시간대를 클릭하시면 예약을 진행하실 수 있습니다.</p>
		
		<% 
			}
		%>
		<table style="visibility:hidden" class="table" style="text-align: center" id="rsvtable" >
			<thead>
				<tr>
					<th>스터디룸[ 룸 이름 / 룸 정원 ]</th>
					<th>07-09시</th>
					<th>09-12시</th>
					<th>13-15시</th>
					<th>15-18시</th>
					<th>19-21시</th>
					<th>21-23시</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${ dayRsvlist }">
					<tr>
						<th scope="row">${room.RNO}호 [ ${room.RNAME} / ${room.RMAX} ]</th>
						<c:choose>
							<c:when test="${(room.TIME07_09 == 0) && ((rsvcode == 0) ||(rsvcode == 1))}">
								<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',1)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray" >불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(room.TIME09_12 == 0) && ((rsvcode == 0) ||(rsvcode == 2))}">
								<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',2)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(room.TIME13_15 == 0) && ((rsvcode == 0) ||(rsvcode == 3))}">
									<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',3)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(room.TIME15_18 == 0) && ((rsvcode == 0) ||(rsvcode == 4))}">
									<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',4)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${ (room.TIME19_21 == 0) && ((rsvcode == 0) ||(rsvcode == 5))}">
								<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',5)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${(room.TIME21_23 ==0) && ((rsvcode == 0) ||(rsvcode == 6))}">
									<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',6)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
	
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<p>
</article>
</body>
</html>