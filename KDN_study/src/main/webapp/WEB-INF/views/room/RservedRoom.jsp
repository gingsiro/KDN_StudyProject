<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$( "#roomResvDate" ).datepicker({minDate: 0});
		$( "#roomResvDate" ).datepicker({dateFormat: 'yy/mm/dd'});
	});
	</script>

</head>
<body>
	<article>
		<aside>
			<nav id="menu" >
				<form style="text-align:center" method="get" action="reservedRoom.do" >
					<input type="date" id="roomResvDate" name="roomResvDate">
					<input type="submit" value="전송">
				</form>
			</nav>
		</aside>
 		<article id="mainContent">
				<jsp:include page="${ listcontent }" />
		</article> 

	</article>
</body>
</html>