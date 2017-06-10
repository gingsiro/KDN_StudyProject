<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Study Home</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<a href="studyList.do">전체 스터디</a><br/>
				<a href="studyList.do?key=empno&word=${ empno }">나의 스터디</a>
			</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${ !empty listform }">
						<jsp:include page="${ listform }" />
					</c:when>
					<c:otherwise>
				스터디 홈 입니다.
			</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>