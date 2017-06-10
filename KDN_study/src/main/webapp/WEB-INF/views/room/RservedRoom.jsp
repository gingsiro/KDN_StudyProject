<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker 한국어로 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>


	<script type="text/javascript">

	$(function() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$( "#roomResvDate" ).datepicker({minDate: +1 , dateFormat: 'yy-mm-dd'
		});
	});
	
	</script>

</head>
<body>
	<article>
		<aside>
			<nav id="menu" >
				<form style="text-align:center" method="get" action="reservedRoom.do" >
					<input type="text" id="roomResvDate" name="roomResvDate">
					<input type="submit" value="예약 조회">
				</form>
			</nav>
		</aside>
 		<article id="mainContent">
				<jsp:include page="${ listcontent }" />
		</article> 
	</article>
</body>
</html>