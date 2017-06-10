<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="deleteEmployee.do" >

<%-- <input type = 'hidden' name='empno' id='empno' value = "${session.employee.empno }">
 --%>
<table  align='center' >
	<tr><td class="caption" colspan='2'>회원 탈퇴</td></tr>
	
	
	<tr><td class='tbasic'>사원번호</td>
		<td>${employee.empno }</td>
	    <td class='tbasic'><input type='hidden' name='empno'  id='empno' value = '${employee.empno }' ></td>
	</tr>

	
	<tr><td class='tbasic'>비밀번호</td>
	    <td class='tbasic'><input type='text' name='password'  id='password'></td>
	</tr>
	
	
	<tr>
	   <td colspan='2' align='center' class='tfoot tspacial'>
	     <input type="submit" value='전송'>
		 <input type="reset" value='취소'>
	   </td>
	</tr>
</table>
</form>
</body>
</html>






