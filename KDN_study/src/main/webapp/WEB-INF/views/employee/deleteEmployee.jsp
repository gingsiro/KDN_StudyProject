<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

@import "bourbon";

body {
	background: #eee !important;	
}

.line1{
	display: inline-block;
	position: absolute;
	left: 400px;
	top: 480px;
}
  
.line2{
	position: absolute;
	left: 400px;
	top: 200px;
}
  
.login {
		position: absolute; left: 790px; top: 240px; height: 50px; width: 100px;
		/* width: 50px;
 	    margin-left: 500px;	
 	    top : 600px;
 	    height: 100px; */
	}  

.wrapper {	
	margin-top: 0px;
  margin-bottom: 0px;
  margin-left: 400px;
  width: 300px;
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


<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="deleteEmployee.do" >

<div class="line2">
		<img src="images/logline1.png" >
</div>
<!-- <form class="form-signin">  -->  
			<div class="wrapper">    
      			<h2 class="form-signin-heading" align="center">회원탈퇴</h2>
      			<!-- <input type="text" class="form-control"   name="empno" placeholder="사원번호" required="" autofocus="" /><br/> -->
	      		
	      		<h3 class='form-control'>사원번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.empno }</h3>
	    		<td class='tbasic'><input type='hidden' name='empno'  id='empno' value = '${employee.empno }' ></td>
	      		
	      		<input type="password" class="form-control"   name="password" placeholder="비밀번호를 입력하시오" required=""/><br/>
	      		<p>※탈퇴시 스터디에 관한 정보는 모두 삭제됩니다.</p>      
      			<button class="btn btn-lg btn-primary btn-block" type="submit">탈퇴하기</button>   
    		
    			<!-- <tr>
	  		 		<td colspan='2' align='center' class='tfoot tspacial'>
	     				<input type="submit" value='전송'>
		 				<input type="reset" value='취소'>
	   				</td>
				</tr> -->
    			
    		</div>
    	<!-- </form> -->
</form>
	
	 <div class="login">
		<img src="images/deleteimage3.png" >
	</div>
	 <div class="line1">
		<img src="images/logline1.png" >
	</div>
</body>
</html>






