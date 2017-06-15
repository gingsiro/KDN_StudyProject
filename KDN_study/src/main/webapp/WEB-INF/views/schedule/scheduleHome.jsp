<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/sidebar.js"></script>
<link href="css/sidebar.css" rel="stylesheet" type="text/css"/>
<title>Schedule Home</title>
<script>
$(document).ready(function(){
	   $('button').click(function(){
	       $('.sidebar').toggleClass('fliph');
	   });
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="sidebar left" id="side_bar">
  					<ul class="list-sidebar bg-defoult">
					    <li style="overflow:hidden" id="study_name"><img src="images/logline1.png" ><br/><i class="fa fa-book"></i><span class="nav-label"><strong>${ joinMembers_list[0].sname }</strong></span><br/></li>
					    <li style="overflow:hidden" id="study_info"><img src="images/logline1.png" ><br/><span class="nav-label">${ joinMembers_list[0].sinfo }</span><br/><img src="images/logline1.png" ></li>
					    <li> <a href="listSchedule.do?sno=${sno}"><i class="fa fa-calendar"></i> <span class="nav-label">일정</span></a> </li>
					    <li> <a href="boardList.do?sno=${sno}"><i class="fa fa-sticky-note-o"></i> <span class="nav-label">게시판</span></a> </li>
					    <li> <a href="joinList.do?sno=${sno}"><i class="fa fa-user-circle"></i> <span class="nav-label">구성원</span></a> </li>
  					</ul>
				</div>
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
</body>
</html>
