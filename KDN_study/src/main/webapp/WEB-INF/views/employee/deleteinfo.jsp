<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<p align="center">
<font color = black>
탈퇴가 정상적으로 되었습니다.</br>
확인 버튼을 누르시기 바랍니다.
</font>
</p>


<form method="post" action="deletelogout.do" >
<p align="center"><input type="submit" value="확인"></p>
</form>

</body>
</html>
