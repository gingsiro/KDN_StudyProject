<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<% 
	String date = request.getParameter("roomResvDate").toString();
%>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').modal({});
		})
		
	})

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
		
		$('#rsvtime').val(timeString);
		$('#rsvTimeCode').val(time);
		
		
	}
</script>

</head>
<body>
	<div class="container">
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
								placeholder="Room NUMBER">
							</div>
							
							<div class="form-group">
							<label for="inputRoomName">예약 날짜</label> <input type="text"
								class="form-control" id="rsvdate" name="rsvdate"
								placeholder="Room RESERVE DATE" value=<%=date %>>
							</div>
						
							<div class="form-group">
							<label for="inputRoomName">예약 시간</label> <input type="text"
								class="form-control" id="rsvtime" name="rsvtime"
								placeholder="Room RESERVE TIME" >
							</div>
							
							<div class="form-group">
							<label for="inputRoomName">예약자 사번</label> <input type="text"
								class="form-control" id="rsvempno" name="rsvempno"
								placeholder="Room RESERVER" value="${empno}">
							</div>
							
							<div class="form-group">
							<label for="inputRoomName">룸을 예약할 스터디</label> <input type="text"
								class="form-control" id="rsvstudy" name="rsvstudy"
								placeholder="Room RESERVE STUDY" >
							</div>
			
						<button type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 예약
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 취소
							</button>
							
							<input type="hidden" id="rsvTimeCode" name="rsvTimeCode"  />
							
						</form>
					</div>
				</div>
			</div>
		</div>

		<h2>스터디룸 예약 정보</h2>
		<p>현재 KDN Study 포털의 룸 예약 현황 목록입니다.</p>
		<%= date %>
		<table class="table" style="text-align: center">
			<thead>
				<tr>
					<th>스터디룸 번호</th>
					<th>7-9시</th>
					<th>9-12시</th>
					<th>13-15시</th>
					<th>15-18시</th>
					<th>19-21시</th>
					<th>21-23시</th>
	
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${ dayRsvlist }">
					<tr>
						<th scope="row">${room.RNO}</th>
						<c:choose>
							<c:when test="${room.TIME07_09 == 0 }">
								<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',1)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>	
						<c:choose>
							<c:when test="${room.TIME09_12 == 0 }">
								<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',2)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${room.TIME13_15 == 0}">
									<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',3)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${room.TIME15_18 == 0}">
									<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',4)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${room.TIME19_21 == 0}">
								<td style="color: blue"><a data-toggle="modal" data-target="#roomRsvForm" onClick="reserveRoom('${room.RNO}',5)">가능</a></td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${room.TIME21_23 ==0}">
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
	</div>
</body>
</html>
