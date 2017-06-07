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
	<section id="study-main">
		<c:choose>
			<c:when test="${ !empty list }">
				<jsp:include page="${ list }" />
			</c:when>
			<c:otherwise>
				스케줄홈 입니다.
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>