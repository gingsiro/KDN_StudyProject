<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/sidebar.js"></script>
<link href='css/sidebar.css' rel='stylesheet' type="text/css"/>
<title>Study Home</title>
<script>
$(document).ready(function(){
	   $('button').click(function(){
	       $('.sidebar').toggleClass('fliph');
	   });
	});
</script>
</head>
<body>
	<div style="overflow:hidden" class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="sidebar left" id="side_bar">
					<ul class="list-sidebar bg-defoult">	
						<li> <a href="studyList.do"><i class="fa fa-calendar"></i>전체 스터디</a> </li>
						<li> <a href="studyList.do?key=empno&word=${ empno }"><i class="fa fa-sticky-note-o"></i>나의 스터디</a> </li>
						<c:if test="${ admin == 'Y' }">
							<li> <a href="categoryList.do"><i class="fa fa-calendar"></i>카테고리 관리</a> </li> 
						</c:if>
					</ul>
  				</div>
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