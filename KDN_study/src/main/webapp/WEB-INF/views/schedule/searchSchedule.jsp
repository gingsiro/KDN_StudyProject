<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<table  align='center' >
	<tr><td class="caption" colspan='2'>너는가입한다</td></tr>
	<tr><td class='tbasic'>번호</td>
	    <td class='tbasic'>${ schedule.scno }</td>
	</tr>
	<tr><td class='tbasic'>스터디이름</td>
	    <td class='tbasic'>${ schedule.sctitle }</td>
	</tr>
	<tr><td class='tbasic'>스케줄</td>
	    <td class='tbasic'>${ schedule.scdate }</td>
	</tr>
	<tr><td class='tbasic'>스터디번호</td>
	    <td class='tbasic'>${ schedule.sno }</td>
	</tr>
</table>
	
	


</body>
</html>