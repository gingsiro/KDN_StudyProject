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
@import "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css";
html {

	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}
body {
	margin: 0;
}

html, body {
	width: 100%;
	height: 100%
}
article, aside, details, figcaption, figure, footer, header, main, menu, nav, section, summary {
	display: block;
}
audio, canvas, progress, video {
	display: inline-block;
	vertical-align: baseline;
}
audio:not([controls]) {
	display: none;
	height: 0;
}

a {
	background-color: transparent;
	text-decoration: none;
}
a:active, a:hover {
	outline: 0;
}

h1,h2,h3,h4,h5,h6,p,ul,ol{ margin:0px; padding:0px;}


/***********************  TOP Bar ********************/
.sidebar{width: 100%;
		    height: 100%;
		    background-color: #fff;
		    transition: all 0.5s ease-in-out;
				 }
				 
.bg-defoult{
    background-color: #fff;
}
.sidebar ul{ list-style:none; margin:0px; padding:0px; }

.sidebar li a,.sidebar li a.collapsed.active{      display: block;
    padding: 20px 30px;
    color: #2779aa;
    border-left: 0px solid #dedede;
    text-decoration: none;
    font-size: 15px;
    font-weight: bold;
    padding-left: 60px;
}

.sidebar li a.active{background-color:#000;border-left:5px solid #dedede; transition: all 0.5s  ease-in-out}
.sidebar li a:hover{background-color:#000 !important;}
.sidebar li a i{ padding-right:5px;}
.sidebar ul li .sub-menu li a{ position:relative}
.sidebar ul li .sub-menu li a:before{
    font-family: FontAwesome;
    content: "\f105";
    display: inline-block;
    padding-left: 0px;
    padding-right: 10px;
    vertical-align: middle;
}
.sidebar ul li .sub-menu li a:hover:after {
    content: "";
    position: absolute;
    left: -5px;
    top: 0;
    width: 5px;
    background-color: #111;
    height: 100%;
}
.sidebar ul li .sub-menu li a:hover{ background-color:#222; padding-left:20px; transition: all 0.5s  ease-in-out}
.sub-menu{ border-left:5px solid #dedede;}
	.sidebar li a .nav-label,.sidebar li a .nav-label+span{ transition: all 0.5s  ease-in-out}
	

	.sidebar.fliph li a .nav-label,.sidebar.fliph li a .nav-label+span{ display:none;transition: all 0.5s  ease-in-out}
	.sidebar.fliph {
    width: 42px;transition: all 0.5s  ease-in-out;
   
}
	
.sidebar.fliph li{ position:relative}
.sidebar.fliph .sub-menu {
    position: absolute;
    left: 39px;
    top: 0;
    background-color: #222;
    width: 150px;
    z-index: 100;
}
	
</style>


<script>
$(document).ready(function(){
	   $('button').click(function(){
	       $('.sidebar').toggleClass('fliph');
	   });
	});
</script>

<style>
	#study_name {	font-size: 20pt;
    font-weight: bold;
    padding-left: 40px;
    padding-bottom: 20px;
    color: #151515;
    background-color: #ffffff;
	}
	
	#study_info { font-size: 17pt;
    padding-left: 30px;
    padding-bottom: 20px;
    color: #151515;
    background-color: #ffffff;
	}
	
	#side_container {
			margin-bottom: 0;
			margin-left: 0;
			margin-top: 0;
			padding-left: 0;
			height: 100%;
	}
	
	#side_row {
			height: 100%;
	}
	
	#side_sm2 {
			padding-right: 0;
			width: 30%;
			height: 100%;
			overflow: visible;
	}
	
	#side_sm10 {
			width: 65%;
		    height: 100%;
		    margin-top: 10px;
		    margin-left: 30px;
		    margin-bottom: 10px;
	}
	
</style>

</head>
<body>
	<div style="overflow:visible" class="container" id="side_container">
		<div class="row" id="side_row">
			<div class="col-sm-2" id="side_sm2">
				<div class="sidebar left" id="side_bar">
  
  					<ul class="list-sidebar bg-defoult">
					    <li id="study_name"> <i class="fa fa-book"></i> <span class="nav-label">${ joinMembers_list[0].sname }</span></li>
					    <li id="study_info"> <!-- <i class="fa fa-diamond"></i>  --><span class="nav-label">&nbsp &nbsp${ joinMembers_list[0].sinfo }</span></li>
					    <li> <a href="listSchedule.do?sno=${sno}"><i class="fa fa-calendar"></i> <span class="nav-label">일정</span></a> </li>
					    <li> <a href="boardList.do?sno=${sno}"><i class="fa fa-sticky-note-o"></i> <span class="nav-label">게시판</span></a> </li>
					    <li> <a href="joinList.do?sno=${sno}"><i class="fa fa-user-circle"></i> <span class="nav-label">구성원</span></a> </li>
  					</ul>
				</div>
			</div>
			
			<div class="col-sm-10" id="side_sm10">
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