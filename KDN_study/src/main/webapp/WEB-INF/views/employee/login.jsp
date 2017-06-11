<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import "bourbon";

body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 0px;
  margin-bottom: 0px;
  margin-left: 140px;
  width: 400px;
} 

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

	
  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: 90px;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius:0;
	  border-bottom-right-radius: 0;
	}

	input[type="text"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}

</style>
</head>
<body>
 	<% String empno = (String) session.getAttribute("empno");
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
 	    <p  style="color:red"><%=msg %></p>
 	 <% } %>
 	 
 	 
 	 
 	 
 	 <form action="login.do" method="post"  id="frm">
		<div class="wrapper">
    	<form class="form-signin">       
      <h2 class="form-signin-heading" align="center">KDN 스터디에 오신것을 환영합니다.</h2><br/>
      <input type="text" class="form-control"   name="empno" placeholder="empno" required="" autofocus="" />
      <input type="text" class="form-control"   name="password" placeholder="Password" required=""/>      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
	</form>
	<%} %>
 	 
 	 
 	 
 	 
 	 
 	 
	<%-- <form action="login.do" method="post"  id="frm">
		사원번호 : <input type="text" name="empno" value='<%=empnoSave %>'  id="empno"/>
		<input type="checkbox" name='empnosave' value='t'
		 <%= empnoSave.length()>0? "checked='checked'" :"" %>
		>사원번호 저장<br/>
		비밀번호 : <input type="text" name="password"  id="password"/><br/>
		
		<input type="submit" value="Login"/>
	</form>
	<%} %> --%>
	
	
	
	
	
	<!--  <div class="wrapper">
    <form class="form-signin">       
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="e" placeholder="Email Address" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
      </label>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
	 -->
	
	
	
</body>
</html>

