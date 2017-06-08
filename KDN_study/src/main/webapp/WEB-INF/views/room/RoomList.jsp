<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	룸리스트입니다. </br></br></br></br></br>
	<form method=post action="reserveCheckRoom.do">
		<input type="date" id="roomdate" name="roomdate" >
		<input type="submit" value="전송">
	</form>
	
	<!-- <table> -->
	<%-- <c:forEach var=room items="${roomList} "> --%>
	<%-- <tr>
		<td>${ room.rno }</td>
		<td>${ room.rname }</td>
		<td>${ room.rmax }</td>
	</tr> --%>
	<%-- </c:forEach> --%>
	<!-- </table> -->
	
	
	<a href="reserveCheckRoom.do">예약확인</a>
	<a href="reserveRoomForm.do">예약하기</a>
</body>
</html>