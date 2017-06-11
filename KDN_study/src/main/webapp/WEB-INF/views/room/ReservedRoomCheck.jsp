<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
       <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#popbutton").click(function() {
		$('div.modal').modal({});
	})

});
		function deleteRsv(rsvno) {
			$('#rsvno').val(rsvno);
		}
	
	</script>
	
</head>

<body>

<%-- 예약확인화면입니다.
<table>
	<tr>
	<td>번호</td><td>일시</td><td>예약코드</td><td>호수</td><td>번호</td><td>사번</td>
	
	</tr>	
<c:forEach var="room" items="${rooms}" >
	<tr>
	<td>${room.rsvno} </td><td>${room.rsvdate}</td><td>${room.rsvcode}</td><td>${room.rno}</td><td>${room.sno}</td><td>${room.empno}</td>	
	</tr>	
</c:forEach>
</table> 
 --%>
 
 <div style="overflow:hidden" id="delRsv" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: blue">
						<span class="glyphicon glyphicon-exclamation-sign"></span><label id="checkContentTitle" >룸 예약 취소</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="rsvDelete" name="rsvDelete" role="form" method="POST" action="deleteRsvRoom.do">
						<label id="checkContent" for="checkContent">정말 예약을 취소하시겠습니까?</label><br/>
						<input type="hidden" id="rsvno" name="rsvno" />
						<div style="text-align:right">
							<button id="checkButtonName" name="checkButtonName" type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 예약 취소						
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 닫기							
							</button>
						</div>			
					</form>	
				</div>
			</div>			
		</div>
	</div>
	
  	<div class="container">
		<h2>나의 스터디룸 예약 정보</h2>
		<p>현재 나의 KDN Study 포털의 룸 예약 현황 목록입니다.</p>
		<table class="table">
			<thead>
				<tr>
					<th>예약 일시</th>
					<th>예약 시간</th>
					<th>호수</th>
					<th>룸을 예약한 스터디</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${ myRsvList }">
					<tr>
						<th scope="row">${room.rsvdate}</th>
						<td>
						<c:choose>
							<c:when test="${room.rsvcode == 1}">
								07-09시
							</c:when>
							<c:when test="${room.rsvcode == 2}">
								09-12시
							</c:when>
							<c:when test="${room.rsvcode == 3}">
								13-15시
							</c:when>
							<c:when test="${room.rsvcode == 4}">
								15-18시
							</c:when>
							<c:when test="${room.rsvcode == 5}">
							19-21시
							</c:when>
							<c:when test="${room.rsvcode == 6}">
							21-23시
							</c:when>
						</c:choose>
						</td>
						<td>${room.rno}</td>
						<td>${room.sname}</td>
						<td><a data-toggle="modal" data-target="#delRsv" class="red-text" onClick="deleteRsv('${room.rsvno}')"><i class="fa fa-times"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


  	
</body>
</html>