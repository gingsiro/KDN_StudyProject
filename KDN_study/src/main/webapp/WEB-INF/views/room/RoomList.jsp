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
	<article>
		<aside>
			<nav id="menu" >
				<form method=post action="reserveCheckRoom.do" >
					<input type="date" id="roomdate" name="roomdate"> <input
						type="submit" value="전송">
				</form>
			</nav>
		</aside>
		<article id="mainContent">
				<jsp:include page="${ listcontent }" />
		</article>

	</article>


	<!-- 	<a href="reserveCheckRoom.do">예약확인</a>
	<a href="reserveRoomForm.do">예약하기</a> -->
</body>
</html>