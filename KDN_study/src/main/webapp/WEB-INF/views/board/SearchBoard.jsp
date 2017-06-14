<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function init(){
		var writeBoard = document.getElementById("writeBoard");
		writeBoard.style.display="none";
		var viewBoard = document.getElementById("viewBoard");
		viewBoard.style.display="";
	}
	function updateForm(){
		var writeBoard = document.getElementById("writeBoard");
		writeBoard.style.display="";
		document.getElementById("viewBoard").style.display="none";
	}
	function updateBoard(){
		var frm = document.getElementById("updatefrm");
		frm.action="updateBoard.do";
		frm.submit();
	}
	function deleteBoard(){
		var frm = document.getElementById("frm");
		frm.action="deleteBoard.do";
		frm.submit();
	}
	function listBoard(){
		location.href="boardList.do?<%=request.getQueryString()%>";
	}
	function resetBoard(){
		var frm = document.getElementById("updatefrm");
		frm.btitle.value="";
		frm.bcontents.value="";
	}
</script>
</head>
<body onload="init()">   
	<c:if test="${msg != null }"> 
    	<script type="text/javascript">  alert('${msg}');</script>
    </c:if>
	<div class="main" id="viewBoard" style="display:none">
	 	<form id="frm"  >
	 	    <input type ="hidden" name="bno"  id="bno" value="${board.bno}"/>
	 	    <input type ="hidden" name="sno"  id="sno" value="${board.sno}"/>
	 	    <input type ="hidden" name="query"  id="query" />
			
				<label for="btitle">제&nbsp;&nbsp;&nbsp;&nbsp;목 :&nbsp;</label>${board.btitle}<br/>
				<label for="empno">글쓴이 :&nbsp;</label>${board.ename}<br/>
				<label for="regdate">게시일 :&nbsp;</label>${board.regdate}<br/>
				<label for="bcontents">내&nbsp;&nbsp;&nbsp;&nbsp;용</label> 
				<pre>${board.bcontents}</pre><br/>
				
				<a href="#" onclick="listBoard('frm')">목록</a>
				
				<c:if test="${board.empno == empno }">
					<a href="#" onclick="updateForm()">수정</a>
					<a href="#" onclick="deleteBoard()">삭제</a>
				</c:if>
		</form>
	</div>
	
	<div class="main" id="writeBoard_" style="display:none">
	 	<form  id="updatefrm_">
	 	    <input type ="hidden" name="bno"  id="bno"  value="${board.bno}"/>
	 	    <input type ="hidden" name="sbno"  id="sbno"  value="${board.sbno}"/>
	 	    <input type ="hidden" name="sno"  id="sno"  value="${board.sno}"/>
<input type ="hidden" name="empno"  id="empno"  value="${board.empno}"/>
	 	   <input type ="hidden" name="regdate"  id="regdate"  value="${board.regdate}"/>
	 	    
	 	    
	 	    
	 	    
	 	    
			<table border="1" align="center">
				<caption>게시글 작성</caption>
				<tbody>
					<tr><td><label for="title">제목</label></td>
					    <td><input type="text" name="btitle" id="btitle" value="${board.btitle}"/></td>
					</tr>
					<tr><td colspan="2">내용</td></tr>
					<tr><td colspan="2">
						<textarea name="bcontents" id="bcontents" cols="30" rows="10" value="${board.bcontents }">
							${board.bcontents}
						</textarea>
						</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="2" align="center">
						<a href="#" onclick="updateBoard()"> 수정 </a> 
						<a href="#" onclick="resetBoard()"> 다시 쓰기</a> 
						<a href="#" onclick="listBoard()">목 록</a>
						</td>
					</tr>
				</tfoot>
			</table>			
		</form>
	</div>
	
	<div id="writeBoard" style="display:none">
		<form id="updatefrm">
			<input type ="hidden" name="bno"  id="bno"  value="${board.bno}"/>
	 	    <input type ="hidden" name="sbno"  id="sbno"  value="${board.sbno}"/>
	 	    <input type ="hidden" name="sno"  id="sno"  value="${board.sno}"/>
	 	    <input type ="hidden" name="empno"  id="empno"  value="${board.empno}"/>
	 	   	<input type ="hidden" name="regdate"  id="regdate"  value="${board.regdate}"/>
	 	   	
			<div class="form-group">
   				<label for="btitle_ex">글 제목</label>
    			<input type="text" class="form-control" id="btitle" name="btitle" placeholder="제목을 입력하세요." value="${ board.btitle }" required>
  			</div>
		    
		    
		
			<div class="form-group">
				<label for="exampleInputPassword1">글 내용</label>
				<textarea class="form-control" name="bcontents" id="bcontents"  rows="5" id="comment" placeholder="내용을 입력하세요." value="${ board.bcontents }">${board.bcontents}
						</textarea>
  			</div>
  			<button onclick="updateBoard()" class="btn btn-default">제출</button><button onclick="resetBoard()" class="btn btn-default">다시쓰기</button><button onclick="listBoard()" class="btn btn-default">목록</button>
		</form>
	</div>
	
</body>
</html>