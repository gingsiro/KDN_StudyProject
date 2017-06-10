<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<a href="">나의 룸 예약</a><br/>
			</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${ !empty listform }">
						<jsp:include page="${ listform }" />
					</c:when>
					<c:otherwise>
				스터디룸 홈 입니다.
			</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
<%-- <body>
	<section id="room-main">
	<c:choose>
		<c:when test="${ !empty listform }">
				<jsp:include page="${ listform }" />
			</c:when>
		<c:otherwise>
			스터디룸 홈 입니다.
		</c:otherwise>
	</c:choose>
	</section>
	</br>
 	<a href="reservedRoomForm.do">예약 하기</a>
</body> --%>
</html>