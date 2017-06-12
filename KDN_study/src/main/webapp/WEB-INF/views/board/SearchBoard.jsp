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
	 	    <input type ="hidden" name="sno"  id="sno" />
	 	    <input type ="hidden" name="query"  id="query" />
			<table border="1" align="center">
				<tbody>
					<tr><td><label for="title">제목</label></td>
					    <td>${board.btitle}</td>
					</tr>
					<tr><td colspan="2">내용 &nbsp;&nbsp;글쓴이:${board.empno}
										&nbsp;&nbsp; 게시일:${board.regdate}</td></tr>
					<tr><td colspan="2"  valign="top" height="200">
						<pre>${board.bcontents }</pre>							
						</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="2" align="center">
							<a href="#" onclick="listBoard('frm')">목록</a>
	 					<<c:if test="${board.empno == empno }">
							<a href="#" onclick="updateForm()">수정</a>
							<a href="#" onclick="deleteBoard()">삭제</a>
						</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<div class="main" id="writeBoard" style="display:none">
	 	<form  id="updatefrm">
	 	    <input type ="hidden" name="bno"  id="bno"  value="${board.bno}"/>
	 	    <input type ="hidden" name="sbno"  id="sbno"  value="${board.sbno}"/>
	 	    <input type ="hidden" name="sno"  id="sno"  value="${board.bno}"/>
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
						<textarea name="bcontents" id="bcontents" cols="30" rows="10">
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
	
	
</body>
</html>