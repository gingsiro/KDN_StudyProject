<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 	<% String empno = (String) session.getAttribute("empno");
 	if(empno == null){    //�α��� ���� ���� ���   �α��� ȭ�� ���
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
		�����ȣ: <input type="text" name="empno" value='<%=empnoSave %>'  id="empno"/><br/>
		��й�ȣ : <input type="text" name="password"  id="password"/><br/>
		<input type="checkbox" name='empnosave' value='t'
		 <%= empnoSave.length()>0? "checked='checked'" :"" %>
		>�����ȣ ����
		<input type="submit" value="Login"/>
	</form>
	<%} %>
</body>
</html>















