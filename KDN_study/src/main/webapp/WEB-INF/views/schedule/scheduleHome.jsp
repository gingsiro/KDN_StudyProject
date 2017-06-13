<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Schedule Home</title>

<style>
	#study_name { font-size: 15pt;
							font-weight: bold;
	}
</style>

</head>
<body>
	<div style="overflow:hidden" class="container">
		<div class="row">
			<div class="col-sm-2">
				<p id="study_name">${ joinMembers_list[0].sname }</p>
				<p>${ joinMembers_list[0].sinfo }</p>
				<br/>
				<br/>
				<a href="listSchedule.do?sno=${sno}">일정</a><br/>
				<a href="boardList.do?sno=${sno}">게시판</a><br/>	
				<a href="joinList.do?sno=${sno}">구성원</a><br/>
			</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${ !empty listform }">
						<jsp:include page="${ listform }" />
					</c:when>
			<c:otherwise>
				스터디 스케줄/게시판 홈 입니다.
			</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

<%-- 	<section id="study-main">
		<c:choose>
			<c:when test="${ !empty list }">
				<jsp:include page="${ list }" />
			</c:when>
			<c:otherwise>
				스케줄홈 입니다.
			</c:otherwise>
		</c:choose>
	</section> --%>
</body>
</html>