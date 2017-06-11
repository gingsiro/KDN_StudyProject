<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
						
						<td><a class="blue-text"><i class="fa fa-user"></i></a> <a
							class="teal-text"><i class="fa fa-pencil"></i></a> <a
							class="red-text"><i class="fa fa-times"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>