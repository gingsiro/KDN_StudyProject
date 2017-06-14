<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | KDN Study</title>	
	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png"> 
    
</head><!--/head-->
 
<body class="homepage">
 
    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                        <div class="top-number"><p><i class="fa fa-phone-square"></i> 　061 - 931 - 7114</p></div>
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                            	<c:choose>
		   							<c:when test="${empty empno}">
                               		 	<a href="loginForm.do" title="로그인">로그인&nbsp;<!-- <i class="fa fa-linkedin"></i> --></a>&nbsp;&nbsp;&nbsp;&nbsp;
                               		 	<a href="insertEmployeeForm.do" title="회원가입">회원가입&nbsp;<!-- <i class="fa fa-pencil"></i> --></a><br/> 
                                	</c:when>
		   							<c:otherwise>
		   								<font size="2em" color="white">${dept}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="employeeUpdateForm.do" title="정보수정">${ename}</a><c:if test="${admin eq 'Y'}">(관리자)</c:if>님&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환영합니다!&nbsp;&nbsp;&nbsp;</font>
		   								<a href="logout.do" title="로그아웃"><!-- <i class="fa fa-unlock-alt"></i> -->로그아웃</a>
		     							<!-- <li><a href="employeeUpdateForm.do" title="정보수정"><i class="fa fa-pencil"></i></a></li> -->
		   							</c:otherwise>
								</c:choose>
                            </ul>
                            <!-- <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div> -->
                           <nav id="menu">		
		 						<!-- <a href="insertEmployeeForm.do">회원가입</a><br/> -->
		 					</nav>             
                       </div>
                    </div>
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->
 
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/study"><img src="images/KDNStudy_ci(orange).png" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="/study">메인</a></li>
                        <li class="dropdown">
                            <a href="studyList.do" class="dropdown-toggle" data-toggle="dropdown">스터디 <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="studyList.do">전체 스터디</a></li>
                                <li><a href="studyList.do?key=empno&word=${ empno }">나의 스터디</a></li>
                                <c:if test="${ admin == 'Y' }">
									<li><a href="categoryList.do">카테고리 관리</a></li>
								</c:if>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="studyList.do" class="dropdown-toggle" data-toggle="dropdown">스터디 룸 <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="reservedRoom.do">룸 예약하기</a></li>
                                <li><a href="myRsvList.do">나의 룸예약</a></li>
                                <c:if test="${ admin == 'Y' }">
									<li><a href="roomList.do">룸 관리</a></li>
								</c:if>
                            </ul>
                        </li>
                        <li><a href="contact.do">About Us</a></li>
                        <!-- <li><a href="contact-us.html">Contact</a></li>  -->                       
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
	<c:choose>
	<c:when test="${ !empty content }">
		<section id="main-content" class="disabled">
			<jsp:include page="${ content }"/>
		</section>
	</c:when>
	<c:otherwise>
	
    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
 
                <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">KDN 사내 스터디를 위한 최고의 서비스 !</h1>
                                    <h2 class="animation animated-item-2">스터디 운영, 스터디룸 예약, 스케줄 관리와 같은 모든 서비스를 지원해드립니다.</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">소개 페이지</a>
                                </div>
                            </div>
 
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/onthejaesung2.png" class="img-responsive"> 
                                </div>
                            </div>
 
                        </div>
                    </div>
                </div><!--/.item-->
 
                <div class="item" style="background-image: url(images/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Lorem ipsum dolor sit amet consectetur adipisicing elit</h1>
                                    <h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>
 
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/hae_hyun.png" class="img-responsive">
                                </div>
                            </div>
 
                        </div>
                    </div>
                </div><!--/.item-->
 
                <div class="item" style="background-image: url(images/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Lorem ipsum dolor sit amet consectetur adipisicing elit</h1>
                                    <h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img3.png" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section><!--/#main-slider-->
 
    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
           <p>
                <h2>KDN 스터디 맞춤 기능</h2>
                <p class="lead">우리 회사 스터디 룸과 사내 스터디를 관리하는<br>최고의 스터디 관리 시스템</p>
            </div>
 
            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-user"></i>
                            <h2>자기 계발</h2>
                            <h3>자기 능력 계발을 위해 다양한 스터디 활동을 지원합니다.</h3>
                        </div>
                    </div><!--/.col-md-4-->
 
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-comments"></i>
                            <h2>스터디 게시판</h2>
                            <h3>스터디별로 개인적인 게시판<br/>공간을 제공합니다.</h3>
                        </div>
                    </div><!--/.col-md-4-->
 
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-calendar"></i>
                            <h2>스터디 일정관리</h2>
                            <h3>스터디별로 달력형태의<br/>일정 관리를 제공합니다.</h3>
                        </div>
                    </div><!--/.col-md-4-->
                
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-tags"></i>
                            <h2>스터디룸 대여</h2>
                            <h3>KDN 나주 본사 사옥 교육관의 룸을 대여할 수 있습니다.</h3>
                        </div>
                    </div><!--/.col-md-4--> 
 
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-key"></i>
                            <h2>편리한 접근과 사용</h2>
                            <h3>사원번호를 통해 간편하게<br/>이용하실 수 있습니다.</h3>
                        </div>
                    </div><!--/.col-md-4-->
 
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-cogs"></i>
                            <h2>관리에 용이</h2>
                            <h3>관리자 입장에서도 편리하게<br/>시스템을 관리할 수 있습니다.</h3>
                        </div>
                    </div><!--/.col-md-4-->
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#feature-->
 
    <section id="portfolio">
        <div class="container">
            <div class="center">
               <h2>우리의 작업 모습</h2>
               <p class="lead">지난 2주간 열정을 바쳐 KDN 사내 스터디 구축을 위한 작업에 매진하였습니다.<br>그 결과로 이 시스템을 완성할 수 있었습니다.</p>
            </div>
        

            <ul class="portfolio-filter text-center">
                <li><a class="btn btn-default active" href="#" data-filter="*">모든사진</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".hyun">남궁현</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".hae">정해성</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".choo">강추영</a></li>             
                <li><a class="btn btn-default" href="#" data-filter=".jae">안재성</a></li>
            </ul><!--/#portfolio-filter-->

            <div class="row">
                <div class="portfolio-items">
                	<div class="portfolio-item choo jae col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/choo_fact.JPG" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">팩트폭력</a></h3>
                                    <p>당해버린 팩트폭력... 무시무시하네 ㅋㅋ </p>
                                    <a class="preview" href="images/portfolio/full/choo_fact.JPG" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->
                    <div class="portfolio-item hyun col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/item11.png" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">애증의 노트북</a></h3>
                                    <p>이번 프로젝트 시작과 동시에 뻗어버리신 노트북입니다. ㅠㅠ 슬프네요.</p>
                                    <a class="preview" href="images/portfolio/full/item11.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item choo col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/frustrate_choo.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">좌절중인 추영이</a></h3>
                                    <p>DB가 어려워서 일도 많아서 스트레스 많이 받았던 추영이 ㅋㅋ </p>
                                    <a class="preview" href="images/portfolio/full/frustrate_choo.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item hae col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/frustrate_haesung.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">열정적인 해성이</a></h3>
                                    <p>무슨 일이든 적극적이고 책임감있게 마무리 잘 해내죠. 멋진 해성이 ㅋ</p>
                                    <a class="preview" href="images/portfolio/full/frustrate_haesung.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>        
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item jae col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/frustrate_jaesung.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">노력하는 재성이</a></h3>
                                    <p>교육 초반부터 힘들어했는데 잘 따라와 프로젝트 까지 같이 하게된 재성이</p>
                                    <a class="preview" href="images/portfolio/full/frustrate_jaesung.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>           
                    </div><!--/.portfolio-item-->
          
                    <div class="portfolio-item hyun col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/frustrate_hyun.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">좌절하는 현이</a></h3>
                                    <p>404...... 진짜 ㅋㅋㅋ 웹은 너무 어렵고 화가나는것 같습니다.</p>
                                    <a class="preview" href="images/portfolio/full/frustrate_hyun.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>      
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item hae col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/ghost_haesung.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">제보받은 해성이</a></h3>
                                    <p>ㅋㅋㅋㅋㅋㅋㅋ 순간포착 <br/>feat.수창</p>
                                    <a class="preview" href="images/portfolio/full/ghost_haesung.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>         
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item hyun col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/sleep_hyun.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">자고있는 현이</a></h3>
                                    <p>잠에 빠져들었습니다. 이날 힘들었죠.. 사실 매일이 .. ㅋㅋㅋ </p>
                                    <a class="preview" href="images/portfolio/full/sleep_hyun.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item wordpress hae hyun choo jae bootstrap col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/all_ng1.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">자 시작합니다.</a></h3>
                                    <p>인사를 잘하는 추영이입니다.</p>
                                    <a class="preview" href="images/portfolio/full/all_ng1.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->
                    <div class="portfolio-item wordpress hae hyun choo jae bootstrap col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/all_ng3.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">보세요 어디까지 접어지나</a></h3>
                                    <p>기인 열전입니다 짝짝짝</p>
                                    <a class="preview" href="images/portfolio/full/all_ng3.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->
                    <div class="portfolio-item wordpress hae hyun bootstrap col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/hae_hyun_ng.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">어느각도가좋아보여 ? </a></h3>
                                    <p>각도 바꿔 여러장 찍은거 실화냐 ㅋ</p>
                                    <a class="preview" href="images/portfolio/full/hae_hyun_ng.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->
                    <div class="portfolio-item wordpress jae bootstrap col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/jae_deep.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">잠은 이렇게</a></h3>
                                    <p>세상이 뭐라하든 난 내잠을 잔다.</p>
                                    <a class="preview" href="images/portfolio/full/jae_deep.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->
                    <div class="portfolio-item wordpress choo jae bootstrap col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/jae_choo.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">다정하게 뭔가 논의중</a></h3>
                                    <p>오늘 저녁 구내식당 메뉴 실화냐?</p>
                                    <a class="preview" href="images/portfolio/full/jae_choo.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->
                    <div class="portfolio-item wordpress choo col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/choo_nametag.jpg" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">추영이의 인기</a></h3>
                                    <p>도전 케덴벨 나간다는거 실화냐</p>
                                    <a class="preview" href="images/portfolio/full/choo_nametag.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                                </div> 
                            </div>
                        </div>          
                    </div><!--/.portfolio-item-->
                </div>
            </div>
        </div>
    </section><!--/#portfolio-item-->
 
    <section id="services" class="service-item">
	   <div class="container">
            <div class="center wow fadeInDown">
                <h2>작업 분야</h2>
                <p class="lead">프로젝트를 진행하며 다양한 지식과 교육받은 내용을 활용하여 구축하였습니다.<br>지난 3개월동안 배운 강의와 활용한 기술입니다.</p>
            </div>
 
            <div class="row">
 
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="images/services/services3.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Architecture</h3>
                            <p>소프트웨어 프로젝트의 시작에 아키텍처를 설계 하여 프로젝트의 완성도를 높였습니다.</p>
                        </div>
                    </div>
                </div>
 
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="images/services/network.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Network</h3>
                            <p>시스템 구조에서 <br/>네트워크가 미치는 <br/>영향을 이해합니다.</p>
                        </div>
                    </div>
                </div>
 
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="images/services/oracle.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Oracle</h3>
                            <p>데이터베이스 구조를<br/>이해하고 각종 쿼리를 <br/>작성하였습니다.</p>
                        </div>
                    </div>
                </div>  
 
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="images/services/java.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Java</h3>
                            <p>객체지향 프로그래밍 언어<br/>자바 기반 지식을 활용하여<br/>프로그래밍을 했습니다.</p>
                        </div>
                    </div>
                </div>
 
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="images/services/spring.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Spring</h3>
                            <p>스프링 프레임워크를 사용,<br/>웹 개발에 필요한 기술을<br/>활용하였습니다.</p>
                        </div>
                    </div>
                </div>
 
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="images/services/sts.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Spring Tools Suite</h3>
                            <p>스프링의 각종툴이 모인<br/>스프링 전용 개발툴을<br/>활용하였습니다.</p>
                        </div>
                    </div>
                </div>                                                
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#services-->
 
    <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInDown">
                    <div class="skill">
                        <h2>우리의 기술 능력 향상</h2>
                        <p>웹의 ㅇ자도 모르던 우리가 설계-구축-개발-테스트 단계를 거쳐 완성하며<br/> 기술 능력 향상을 이루었습니다.</p>
 
                        <div class="progress-wrap">
                            <h3>Database</h3>
                            <div class="progress">
                              <div class="progress-bar  color1" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="bar-width">80%</span>
                              </div>
                            </div>
                        </div>
 
                        <div class="progress-wrap">
                            <h3>HTML, CSS</h3>
                            <div class="progress">
                              <div class="progress-bar color2" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                               <span class="bar-width">90%</span>
                              </div>
                            </div>
                        </div>
 
                        <div class="progress-wrap">
                            <h3>Spring, Java</h3>
                            <div class="progress">
                              <div class="progress-bar color3" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
                                <span class="bar-width">95%</span>
                              </div>
                            </div>
                        </div>
 
                        <div class="progress-wrap">
                            <h3>Project Achivement</h3>
                            <div class="progress">
                              <div class="progress-bar color4" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                <span class="bar-width">100%</span>
                              </div>
                            </div>
                        </div>
                    </div>
 
                </div><!--/.col-sm-6-->
 
                <div class="col-sm-6 wow fadeInDown">
                    <div class="accordion">
                        <h2>어려웠던 점이 있나요?</h2>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                  공포의 404
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
 
                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="images/face/frustrate_hyun.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>남궁현</h4>
                                             <p>작업중에 404가 터졌어요.<br/>뭐가 문젠지 어디서 에러인지 알수 없었죠.<br/>머리가 터지는줄 알았어요.</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
 
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                  달력? 달력... 달력!!!!!!!
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
 
                            <div id="collapseTwo1" class="panel-collapse collapse">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="images/face/frustrate_haesung.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>정해성</h4>
                                             <p>달력을 작업해볼까?<br/>달력을 작업 해보자...<br/>달력때문에 머리 다 빠지겠다!!!!!</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
 
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                  DB 란 무엇인가
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="images/face/frustrate_choo.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>강추영</h4>
                                             <p>DB란 무엇일까?<br/>DB는 고생문이다.<br/>DB 너무 어려워힝 ㅠㅠㅠ</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
 
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                  로그인 폼 장인
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFour1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="images/face/frustrate_jaesung.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>안재성</h4>
                                             <p>로그인폼을 최고 멋지게 꾸밀꺼야<br/>역시 웹은 한땀한땀이지<br/>직접 찍은 사진으로 멋지게 고고 !! </p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
                        </div><!--/#accordion1-->
                    </div>
                </div>
 
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#middle-->
 
    <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-8 wow fadeInDown">
                   <div class="tab-wrap"> 
                        <div class="media">
                            <div class="parrent pull-left">
                                <ul class="nav nav-tabs nav-stacked">
                                    <li class="active"><a href="#tab1" data-toggle="tab" class="analistic-01">일정관리 제작</a></li>
                                    <li class=""><a href="#tab2" data-toggle="tab" class="analistic-02">스터디 제작</a></li>
                                    <li class=""><a href="#tab3" data-toggle="tab" class="tehnical">로그인, 카테고리, 게시판</a></li>
                                    <li class=""><a href="#tab4" data-toggle="tab" class="tehnical">스터디룸 예약 제작</a></li>
                                    <li class=""><a href="#tab5" data-toggle="tab" class="tehnical">모든 기능을 취합</a></li>
                                </ul>
                            </div>
 
                            <div class="parrent media-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="tab1">
                                        <div class="media">
                                           <div class="pull-left">
                                                <img class="img-responsive" src="images/face/picture_haesung.png">
                                            </div>
                                            <div class="media-body">
                                                 <h2>일정관리를 제작</h2>
                                                 <p>스터디원들이 한눈에 볼 수 있도록 <br/>달력 형태로 일정을 등록하여 직관적으로<br/>구성했습니다. <br/>이를 통해 사용자들이 쉽게 <br/>스터디 일정을 관리할 수 있겠죠?</p>
                                            </div>
                                        </div>
                                    </div>
 
                                     <div class="tab-pane fade" id="tab2">
                                        <div class="media">
                                           <div class="pull-left">
                                                <img class="img-responsive" src="images/face/picture_hyun.png">
                                            </div>
                                            <div class="media-body">
                                                 <h2>스터디 제작</h2>
                                                 <p>사용자들이 들어와 새로운 스터디에 가입하고<br/>자신의 스터디에 들어가 활동할 수 있도록<br/>보기 편한 디자인을 채택하여<br/>개발을 진행했습니다.</p>
                                            </div>
                                        </div>
                                     </div>
 
                                     <div class="tab-pane fade" id="tab3">
                                        <div class="media">
                                           <div class="pull-left">
                                                <img class="img-responsive" src="images/face/picture_jaesung.png">
                                            </div>
                                            <div class="media-body">
                                                <h2>로그인, 카테고리, 게시판 제작</h2>
                                                <p>우리 시스템에 접근하기 위해서는<br/>제 로그인창을 통하지 않고선 불가능하죠.<br/>스터디에 사용될 카테고리와 게시판도<br/>제작하여 프로젝트에 붙였습니다!</p> 
                                            </div>
                                        </div>
                                     </div>
                                     
                                     <div class="tab-pane fade" id="tab4">
                                        <div class="media">
                                           <div class="pull-left">
                                                <img class="img-responsive" src="images/face/picture_choo.png">
                                            </div>
                                            <div class="media-body">
                                            	<h2>스터디룸 예약 제작</h2>
                                                <p>나날이 변경되는 스터디룸 예약의<br/>가능, 불가능 여부를 표시하기 위해<br/>테이블 형태를 활용했어요 !<br/>덕분에 이쁘고 사용하기 편하지 뭐에요 ?<br/>하하하하하하</p>
                                                
                                            </div>
                                        </div>
                                     </div>
 
                                     <div class="tab-pane fade" id="tab5">
                                        <!-- <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures,</p> -->
                                        <div class="media">
                                           <div class="pull-left">
                                                <img class="img-responsive" src="images/face/picture_all.jpg">
                                            </div>
                                            <div class="media-body">
                                                 <h2>다같이 Git을 활용했죠 !</h2>
                                                 <p>Git 이 없었다면 몇시간씩 데이터 취합하느라<br/>시간을 보냈을 것 같습니다.<br/>각자 기능을 개발한뒤 취합하고<br/>기능을 붙여보는데<br/>아 이래서 객체지향 객체지향 하는구나라고 느꼈습니다. </p>
                                            </div>
                                        </div>
                                     </div>
                                </div> <!--/.tab-content-->  
                            </div> <!--/.media-body--> 
                        </div> <!--/.media-->     
                    </div><!--/.tab-wrap-->               
                </div><!--/.col-sm-6-->
 
                <div class="col-xs-12 col-sm-4 wow fadeInDown">
                    <div class="testimonial">
                        <h2>후기</h2>
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                                <img class="img-responsive img-circle" src="images/face/jhs.jpg">
                            </div>
                            <div class="media-body">
                                <p>달력이 스터디의 시작과 끝<br/>스터디에 감성이 더해지면?<br/>최고의 결과물 ! ㅋㅋ</p>
                                <span><strong>-hsgoon/</strong> 감성담당<br/>of KDN_Study</span>
                            </div>
                         </div>
 
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                                <img class="img-responsive img-circle" src="images/face/nkh.jpg">
                            </div> 
                            <div class="media-body">
                                <p>프로젝트중 맥북이 사망했다.<br/>7년간 고생했어 <br/>나는 새 맥북으로 갈아탈게</p>
                                <span><strong>-gingsiro/</strong> 징징담당<br/>of KDN_Study</span>
                            </div>
                         </div>
                         
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                                <img class="img-responsive img-circle" src="images/face/ajs.jpg">
                            </div>
                            <div class="media-body">
                                <p>자신을 되돌아보게 되었다.<br/>고생했다.</p>
                                <span><strong>-ulalla/</strong> 로그인담당<br/>of KDN_Study</span>
                            </div>
                         </div>
                         
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                                <img class="img-responsive img-circle" src="images/face/kcy.jpg">
                            </div>
                            <div class="media-body">
                                <p>프로젝트 다 끝난거<br/> 실화냐?</p>
                                <span><strong>-choo/</strong> 실화담당<br/>of KDN_Study</span>
                            </div>
                         </div>
                    </div>
                </div>
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#content-->
 
    <section id="partner">
        <div class="container"> 
            <div class="center wow fadeInDown">
                <h2>우리 동료들</h2>
                <p class="lead">인턴 사원으로 시작하여 3달간 어렵게 달려왔습니다. 매일 시험에 퀴즈에 과제에 시달리느라 새벽까지도 고생했습니다.<br/>앞으로 더 나은 하루하루가 계속될 것입니다.</p>
            </div>    
 
            <div class="partners">
                <ul>	
                    <li style="width:380px; text-align:center"> <a href="#"><img style="display:inline-block" class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="images/partners/kdn_certificate.png"></a></li>
                    <li style="width:380px; text-align:center"> <a href="#"><img style="display:inline-block" class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" src="images/partners/kdn_food.png"></a></li>
                    <li style="width:380px; text-align:center"> <a href="#"><img style="display:inline-block" class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" src="images/partners/kdn_intern.png"></a></li>
                    <li style="width:380px; text-align:center"> <a href="#"><img style="display:inline-block" class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" src="images/partners/kdn_kids.png"></a></li>
                    <li style="width:380px; text-align:center"> <a href="#"><img style="display:inline-block" class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1500ms" src="images/partners/kdn_rental.png"></a></li>
                    <li style="width:380px; text-align:center"> <a href="#"><img style="display:inline-block" class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1800ms" src="images/partners/kdn_joonggo.png"></a></li>
                </ul>
            </div>        
        </div><!--/.container-->
    </section><!--/#partner-->
 
    <!-- <section id="conatcat-info">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="media contact-info wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="pull-left">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="media-body">
                            <h2>질문이 있으신가요 ? </h2>
                            <p>질문이 있으시다면 지금 궁금한 사항에 답변 드리겠습니다.<br/> 질문 주시기 바랍니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>/.container    
    </section>/#conatcat-info -->
 
    <!-- <section id="bottom">
        <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">We are hiring</a></li>
                            <li><a href="#">Meet the team</a></li>
                            <li><a href="#">Copyright</a></li>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>    
                </div>/.col-md-3
 
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Faq</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Forum</a></li>
                            <li><a href="#">Documentation</a></li>
                            <li><a href="#">Refund policy</a></li>
                            <li><a href="#">Ticket system</a></li>
                            <li><a href="#">Billing system</a></li>
                        </ul>
                    </div>    
                </div>/.col-md-3
 
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Developers</h3>
                        <ul>
                            <li><a href="#">Web Development</a></li>
                            <li><a href="#">SEO Marketing</a></li>
                            <li><a href="#">Theme</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Email Marketing</a></li>
                            <li><a href="#">Plugin Development</a></li>
                            <li><a href="#">Article Writing</a></li>
                        </ul>
                    </div>    
                </div>/.col-md-3
 
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Our Partners</h3>
                        <ul>
                            <li><a href="#">Adipisicing Elit</a></li>
                            <li><a href="#">Eiusmod</a></li>
                            <li><a href="#">Tempor</a></li>
                            <li><a href="#">Veniam</a></li>
                            <li><a href="#">Exercitation</a></li>
                            <li><a href="#">Ullamco</a></li>
                            <li><a href="#">Laboris</a></li>
                        </ul>
                    </div>    
                </div>/.col-md-3
            </div>
        </div>
    </section>/#bottom -->
    </c:otherwise>
    </c:choose>
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    © 2017 <a target="_blank" href="#" title="최고의 프로젝트 팀">KDN Study Project</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>