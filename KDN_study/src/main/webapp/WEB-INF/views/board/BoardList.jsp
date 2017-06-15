<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <jsp:useBean 	id="pageBean"         class="com.kdn.study.domain.PageBean" 
				scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
	function pagelist(cpage){
		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
		document.getElementById("pageNo").value=cpage;
		var frm = document.getElementById("frm");
		frm.action="boardList.do";
		frm.submit();
	}
	//게시글 번호나 타이틀을 클릭하면 해당 게시글 요청을 위한 메서드 
	function getBoard(no){
		//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
		document.getElementById("no").value = no;
		var frm = document.getElementById("frm");
		frm.action="searchBoard.do";
		frm.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>스터디 게시판</h2>
		<p>스터디 게시판 입니다.</p>
		<form id="frm">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
		 	<input type="hidden" id="sno" name="sno" value='${sno}' />
		 	<input type="hidden" id="bno" name="bno" value='${sno}' />
		 	<input type="hidden" id="ename" name="ename" value='${ename}' />
		 	<input type="hidden" id="no" name="no"  />
		<table class="table">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>글 제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${ boardList }">
					<tr>
						<th scope="row">${board.sbno}</th>
						<td><a href="#" onclick="getBoard(${board.bno})">${board.btitle}</a></td>
						<td>${board.ename}</td>
						<td>${board.regdate}</td>
					</tr>
				</c:forEach>
				<tr align="center">
					<td colspan="3" height="100" align="center"><select name="key"
						id="key">
							<option value="all">전체</option>
							<option value="empno" <%=pageBean.getKey("empno")%>>글쓴이</option>
							<option value="btitle" <%=pageBean.getKey("btitle")%>>제목</option>
							<option value="bcontents" <%=pageBean.getKey("bcontents")%>>내용</option>
					</select> <input type="text" id="word" name="word" value="${pageBean.word}" />
						<a href="#" onclick="pagelist(1)">검색</a> &nbsp;&nbsp;&nbsp; <a
						href="insertBoardForm.do?sno=${sno}">글쓰기</a></td>
				</tr>
			</tbody>
		</table>
		<div class="bottom">
			<center>${pageBean.pagelink }</center>
		</div>
	</form>
	</div>

</body>
</html>