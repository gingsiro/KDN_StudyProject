<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 	<% String empno = (String) session.getAttribute("empno");
 	  /* String dept = (String) session.getAttribute("dept");
 	 String ename = (String) session.getAttribute("ename");  */
 	if(empno == null){    //로긴을 하지 않은 경우   로그인 화면 출력
 	  Cookie[] cookies = request.getCookies();
 		String empnoSave ="";
 	    for(Cookie cookie: cookies){
 	    	if(cookie.getName().equals("empnosave")){
 	    		empnoSave = cookie.getValue();
 	    	}
 	    }
 	    String msg = (String)request.getAttribute("msg");
 	    if(msg!=null && !msg.equals("")){ %>
 	    	<p style="color:red"><%=msg %></p>
		<% } %>
 	  <div class="line2">
		<img src="images/logline1.png" >
		</div>
	<form action="login.do" method="post"  id="frm">
    	<form class="form-signin">   
			<div class="wrapper">    
      			<h2 class="form-signin-heading" align="center">KDN 스터디 방문을 환영합니다.</h2><br/>
      			<input type="text" class="form-control"   name="empno" placeholder="사원번호" required="" autofocus="" /><br/>
	      		<input type="password" class="form-control"   name="password" placeholder="비밀번호" required=""/><br/>      
      			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    		</div>
    	</form>
	</form>
	
	 <div class="login">
		<img src="images/loginimage3.png" >
	</div>
	 <div class="line1">
		<img src="images/logline1.png" >
	</div>
	
	<%} %>
	
	
</body>
</html>

