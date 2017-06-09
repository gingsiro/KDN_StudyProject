<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="insertEmployee.do" >
<table  align='center' >
	<tr><td class="caption" colspan='2'>회원가입</td></tr>
	<tr><td class='tbasic'>사원번호</td>
	    <td class='tbasic'><input type='text' name='empno'  id='empno'></td>
	</tr>
	
	<tr><td class='tbasic'>부 &nbsp;서</td>
	    <td class='tbasic'><input type='text' name='dept'  id='dept'>
	</tr>
	
	<tr><td class='tbasic'>이 &nbsp;름</td>
	    <td class='tbasic'><input type='text' name='ename'  id='ename'></td>
	</tr>
	
	<tr><td class='tbasic'>성 &nbsp;별</td>
	   <td align='left'><input type="radio" name="gender" value="m">남자</td>
		<td align='left'><input type="radio" name="gender" value="f">여자</td>
	</tr>
	
	
	
	
	<tr><td class='tbasic'>비밀번호</td>
	    <td class='tbasic'><input type='password' name='password'  id='password'></td>
	</tr>
	
	<!-- <tr><td class='tbasic'>이메일</td>
	    <td class='tbasic'><input type='text' name='email'  id='email'>
	</tr> -->
	
	<!-- <tr><td class='tbasic'>주 &nbsp;소</td>
	    <td class='tbasic'><input type='text' name='address'  id='address'>
	</tr> -->
	
	<tr>
	   <td colspan='2' align='center' class='tfoot tspacial'>
	     <input type="submit" value='가입'>
		 <input type="reset" value='취소'>
	   </td>
	</tr>
</table>
</form>
</body>
</html>






