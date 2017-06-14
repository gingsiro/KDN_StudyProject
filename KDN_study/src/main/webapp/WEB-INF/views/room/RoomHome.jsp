<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/sidebar.js"></script>
<link href="css/sidebar.css" rel="stylesheet" type="text/css"/>
<script>
$(document).ready(function(){
	   $('button').click(function(){
	       $('.sidebar').toggleClass('fliph');
	   });
	});
</script>
</head>
<body>
	<div style="overflow:visible" class="container">
		<div class="row">
			<div class="col-sm-2">	
				<div class="sidebar left" id="side_bar">
			
					<ul class="list-sidebar bg-defoult">
					    <li> <a href="reservedRoom.do"><i class="fa fa-calendar"></i> <span class="nav-label">룸 예약하기</span></a></li>
					    <li> <a href="myRsvList.do"><i class="fa fa-sticky-note-o"></i> <span class="nav-label">나의 룸 예약</span></a></li>
    
					    <c:if test = "${ admin == 'Y'}">
					    	<li> <a href="roomList.do"><i class="fa fa-user-circle"></i> <span class="nav-label">룸 관리</span></a> </li>
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