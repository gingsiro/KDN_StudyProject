<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertBoard.do" >
		<div class="form-group">
   			<label for="btitle_ex">글 제목</label>
    		<input type="text" class="form-control" id="btitle" name="btitle" placeholder="제목을 입력하세요."  required>
  		</div>
		    	<input type ="hidden" name="sno"  id="sno" value="${sno}"/>
		    	<input type ="hidden" name="sbno"  id="sbno" value="${ maxsbno }"/>
		    
		
		<label for="empno">아이디  ${ empno }</label>
		<input type="hidden" class="form-control" id="btitle" value=${ empno } />
		<input type="hidden" name="empno" id="empno" value='${ empno }' />
		    
		
		<div class="form-group">
			<label for="exampleInputPassword1">글 내용</label>
			<textarea class="form-control" name="bcontents" id="bcontents"  rows="5" id="comment" placeholder="내용을 입력하세요."></textarea>
  		</div>
  		<button type="submit" class="btn btn-default">제출</button><button type="reset" class="btn btn-default">취소</button>
	</form>
</body>
</html>