<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>

<style>

.line1{
	display: inline-block;
	position: absolute;
	left: 400px;
	top: 600px;
}
  
.line2{
	position: absolute;
	left: 400px;
	top: 200px;
}
  
  
.login {
		position: absolute; left: 790px; top: 250px; height: 50px; width: 100px;
		/* width: 50px;
 	    margin-left: 500px;	
 	    top : 600px;
 	    height: 100px; */
	}  


.form-signin-heading
	{
	  margin-bottom: 30px;
	  margin-left: 0px; 
	  align: center;
	}

.form-group
{
left: 220px;
width: 310px;
}

.form-group1
{
left: 350px;
width: 400px;
}

.form-group2
{
margin-left: 20px; 
width: 300px;

}

.form-horizontal
{
width: 200px;
margin-left: 400px;
}

.btn btn-success
{
left: 150px;
}
</style>

<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>



<div class="line2">
		<img src="images/logline1.png" >
		</div>



<form method= "post" action="insertEmployee.do" class="form-horizontal">


<!-- <fieldset> -->

	
<h2 class="form-signin-heading" align="center" style= "width:300px"  >KDN 스터디 회원가입
<!-- <label class="col-md-6 control-label"></label> -->
</h2>
 


	
<div class="form-group">
  <!-- <label class="col-md-3 control-label" for="empno">사원번호</label> -->  
  <!-- <div class="col-md-2" > -->
  <input id="empno" name="empno" type="text" placeholder="사원번호			ex) 170001" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
<!--   </div> -->
</div>

<div class="form-group">
  <!-- <label class="col-md-3 control-label" for="dept">부서명</label>   -->
  <!-- <div class="col-md-2"> -->
  <input id="dept" name="dept" type="text" placeholder="부서명  			ex) 인재개발팀" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
 <!--  </div> -->
</div>

<div class="form-group">
 <!--  <label class="col-md-3 control-label" for="ename">이  름</label> -->  
  <!-- <div class="col-md-2"> -->
  <input id="ename" name="ename" type="text" placeholder="이름			ex) 홍길동" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
  <!-- </div> -->
</div> 



<div class="form-group">
  <!-- <label class="col-md-3 control-label" for="password">비밀번호 </label> -->
  	<!-- <div class="col-md-2"> -->
   		<input id="password" name="password" type="password" placeholder="비밀번호			ex) 123456" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
  	<!-- </div> -->
</div>

<div class="form-group1" >
  <!-- <label class="col-md-3 control-label" for="gender" >성  별</label> -->
  <!-- 	<div class="col-md-2"> -->
  		<div class="checkbox">
   			<label for="Gender-0" >
      			<input type="radio" name="gender" id="gender-0" value="M">남성
   			</label>
   			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			</span>
   			<label for="Gender-1" >
      			<input type="radio" name="gender" id="gender-1" value="F">여성 
    		</label>
		</div>
   </div><br/>



<div class="form-group2">
  	<!-- <label class="col-md-4 control-label" for="1"></label> -->
  		<!-- <div class="col-md-8"> -->
    		<button style= "width:250px; background-color: #c52d2f; border-color : #c52d2f" id="1" name="1" class="btn btn-success">회원가입 완료하기</button>
  		<!-- </div> -->
</div>
</form>

<div class="login">
	<img src="images/loginimage5.png" >
</div> 
<div class="line1">
	<img src="images/logline1.png" >
</div>


