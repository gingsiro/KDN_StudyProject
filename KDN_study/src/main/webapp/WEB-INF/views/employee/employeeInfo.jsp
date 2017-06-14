<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.line1{
	display: inline-block;
	position: absolute;
	left: 400px;
	top: 510px;
}
  
.line2
{
	position: absolute;
	left: 400px;
	top: 210px;
}

.form-signin-heading
{
	margin-bottom: 30px;
	margin-left: 0px; 
	align: center;
}

.form-group1
{
	left: 200px; 
	width: 200px;
}

.form-horizontal
{
	width: 200px;
	margin-left: 400px;
}

</style>


<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="line2">
		<img src="images/logline1.png" >
	</div>

	<form method= "post" action="updateEmployee.do" class="form-horizontal">

	<h2 class="form-signin-heading" align="center" style= "width:300px"  >회원정보 수정완료</h2>

	<h3 class='form-group' style="left: 240px; width: 310px; border: 1px solid #ff0000;">&nbsp; [사원번호] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.empno }</h3>
	    <td><input type='hidden' name='empno'  id='empno' value = '${employee.empno }' ></td>

	<h3 class='form-group' style="left: 240px; width: 310px; border: 1px solid #ff0000;">&nbsp; [이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.ename }</h3>
	    <td><input type='hidden' name='ename'  id='ename' value = '${employee.ename }' ></td>

	<h3 class='form-group' style="left: 240px; width: 310px; border: 1px solid #ff0000;">&nbsp; [부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.dept }</h3>
	    <td><input type='hidden' name='dept'  id='dept' value = '${employee.dept }' ></td>

	<h3 class='form-group' style="left: 240px; width: 310px; border: 1px solid #ff0000;">&nbsp; [비밀번호] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${employee.password }</h3>
	    <td><input type='hidden' name='password'  id='password' value = '${employee.password }' ></td><br/>
	<h4 style=width:300px;  align="center" >${employee.ename }님의 정보가 수정되었습니다.</h4>
	    

</form>


<div style= "position: absolute; left: 800px; top: 225px; height: 50px; width: 100px;">
	<img src="images/employeeupdateinfoimage1.png" >
</div> 
<div class="line1">
	<img src="images/logline1.png" >
</div>



</table>
</form>
</body>
</html>



