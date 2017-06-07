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
	스케줄 리스트입니다.

	<form method="get" action="searchSchedule.do">
		<table align='center'>
			<tr>
				<td class="caption" colspan='2'>가입하고파</td>
			</tr>
			<tr>
				<td class='tbasic'>검색 ㄱㄱ</td>
				<td class='tbasic'><input type='text' name='id' id='id'></td>
			</tr>
			<tr>
				<td colspan='2' align='center' class='tfoot tspacial'><input
					type="submit" value='전송'> <input type="reset"
					value='취소'></td>
			</tr>
		</table>
	</form>



</body>
</html>