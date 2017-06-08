<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	룸 예약하는 폼을 띄워주는 화면입니다.
		<article>
		<aside>
			<nav id="menu" >
				<form method=get action="reservRoom.do" >
					<input type="date" id="roomResvDate" name="roomResvDate"> <input
						type="submit" value="전송">
				</form>
			</nav>
		</aside>
<%-- 		<article id="mainContent">
				<jsp:include page="${ listcontent }" />
		</article> --%>

	</article>
</body>
</html>