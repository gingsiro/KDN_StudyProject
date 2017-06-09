<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
		<caption>사원 정보</caption>
		<tr><td>사원번호</td><td> ${employee.empno } </td></tr>
		<tr><td>부 서</td><td> ${ employee.dept } </td></tr>
		<tr><td>이 름</td><td> ${ employee.ename }</td></tr>
		<tr><td>비밀번호</td><td> ${employee.password } </td></tr>
	</table>
</body>
</html>






