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
<article id="mainContent">
			<jsp:include page="${ listcontent }" />
	</article>

<%-- 	<article>
		<aside>
			<nav id="menu" >
				<form style="text-align:center" method=get action="roomList.do" >
					<input type="date" id="roomdate" name="roomdate"> 
					<input type="submit" value="전송">
				</form>
			</nav>
		</aside>
		<article id="mainContent">
				<jsp:include page="${ listcontent }" />
		</article>

	</article> --%>

</body>
</html>