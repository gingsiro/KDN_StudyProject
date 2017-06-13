<%@ page language="java" contentType="text/str += 'html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Join List</title>
<meta charset="UTF-8">

</head>
<body>
	<div>
		<h2>스터디원 목록</h2>
		<ul>
			<c:forEach var="member" items="${ joinMembers_list }">
				<li>${ member.ename }</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
