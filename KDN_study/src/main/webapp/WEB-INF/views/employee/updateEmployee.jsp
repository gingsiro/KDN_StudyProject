<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

.line1{
	display: inline-block;
	position: absolute;
	left: 400px;
	top: 545px;
}
  
.line2{
	position: absolute;
	left: 400px;
	top: 210px;
}
  
  
.login {
		position: absolute;
		left: 790px;
		top: 230px;
		height: 50px;
		width: 100px;
	}  


.form-signin-heading
	{
	  margin-bottom: 30px;
	  margin-left: 0px; 
	  align: center;
	}

.form-group
{
left: 230px;
width: 310px;
}

/* .form-group1
{
left: 350px;
width: 400px;
} */

.form-group2
{
margin-left: 10px; 
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

.tbasic 
{
margin-right: 420px;
width: 310px;
}
</style>
<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>


<body>
<div class="line2">
	<img src="images/logline1.png" >
</div>


<form method= "post" action="updateEmployee.do" class="form-horizontal">

	
<h2 class="form-signin-heading" align="center" style= "width:300px"  >회원정보 및 수정</h2>
 


	


<h3 class='form-group' style="border: 1px solid #ff0000;">&nbsp; [사원번호] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.empno }</h3>
	    <td class='tbasic'><input type='hidden' name='empno'  id='empno' value = '${employee.empno }' ></td>

<h3 class='form-group' style="border: 1px solid #ff0000;">&nbsp; [이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.ename }</h3>
	    <td class='tbasic'><input type='hidden' name='ename'  id='ename' value = '${employee.ename }' ></td>
	
<div class="form-group">
  <input id="dept" name="dept" type="text" placeholder="[부서 : ${employee.dept} ]	변경할 데이타 입력" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
</div>

<div class="form-group">
   	<input id="password" name="password" type="password" placeholder="[비밀번호]    			변경할 데이타 입력" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
</div>

<div class="form-group">
   	<input id="password" name="passwordcheck" type="password" placeholder="[비밀번호 확인]		변경할 데이타 입력" class="form-control input-md"  style="border: 1px solid #ff0000;" required>
</div>

<!-- <tr>
	   <td colspan='2' align='center' class='tfoot tspacial'>
	     <input type="submit" value='전송'>
		 <input type="reset" value='취소'>
	   </td>
	</tr> -->

<div class="form-group">
  	<button  "width:250px; background-color: #c52d2f; border-color : #c52d2f" id="1" name="1" class="btn btn-success">회원정보 수정 완료하기</button>	
	<a href="employeeDeleteForm.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a>
</div>
</form>


<div class="login">
	<img src="images/employeeinfoimage1.png" >
</div> 
<div class="line1">
	<img src="images/logline1.png" >
</div>



</table>
</form>
</body>
</html>
