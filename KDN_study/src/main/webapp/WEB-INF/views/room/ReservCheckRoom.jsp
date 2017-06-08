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
예약확인화면입니다.
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


</body>
</html>