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
<div id="head">
  	스 터 디 룸
</div>
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
</body>
</html>