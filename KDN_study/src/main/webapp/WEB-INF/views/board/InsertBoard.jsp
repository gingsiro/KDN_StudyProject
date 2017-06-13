<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="insertBoard.do" >
	<table align="center" width="300">
			<tr><th colspan="2"> 게시글 작성 </th></tr>
			<tr height="50"><td><label for="btitle">제목</label></td>
			    <td><input type="text" name="btitle" id="btitle"/>
			    	<input type ="hidden" name="sno"  id="sno" value="${sno}"/>
			    	<input type ="hidden" name="sbno"  id="sbno" value="${ maxsbno }"/>
			    </td>
			</tr>
			<tr height="50"><td><label for="empno">아이디</label></td>
			    <td><input type="text" name="empno" id="empno" value='${ empno }' /></td>
			</tr>
			<tr><td colspan="2"><label for="bcontents">내용</label></td></tr>
			<tr><td colspan="2" align="center">
			    <textarea name="bcontents" id="bcontents" cols="30" rows="5"></textarea>
			</td></tr>
			<tr><td colspan="2" align="center">
				
				<input type="submit" value="작성"/>
				<input type="reset" value="취소"/>
			</td></tr>
	</table>
</form>
</body>
</html>