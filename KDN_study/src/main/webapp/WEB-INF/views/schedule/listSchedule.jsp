<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean 	id="pageBean"         class="com.kdn.study.domain.PageBean" 
				scope="request"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			#loadCalendar { witdth: 50px;
									margin-left: 5%;
									margin-right: 35%;
				}
			
			#loadBoard { text-align: center;
			}
		</style>
		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
		</script>
		
		<script type="text/javascript">
			$(function() {
				$("#popbutton").click(function() {
					$('div.modal').modal({});
				})
			})
		
			function updateForm(sname, cno, smax) {
				$('#updateSname').val(sname);
			}
		</script>

	
		<script type="text/javascript">
			//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
			function pagelist(cpage){
				//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
				document.getElementById("pageNo").value=cpage;
				var frm = document.getElementById("frm");
				frm.action="listSchedule.do";
				frm.submit();
			}
			//게시글 번호나 타이틀을 클릭하면 해당 게시글 요청을 위한 메서드 
			function getBoard(no){
				//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
				document.getElementById("scno").value = scno;
				var frm = document.getElementById("frm");
				frm.action="searchSchedule.do";
				frm.submit();
			}
		</script>
		
	</head>

<body>
	
	
	<div class="container">
		<!-- Modal -->
		<div style="overflow:hidden" id="createForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 style="color: blue;">
							<span class="glyphicon glyphicon-pencil"></span> 스케줄 입력
						</h4>
					</div>
					<div class="modal-body">
						<form role="form" method="POST" action="insertSchedule.do">
							<div class="form-group">
								<label for="inputScheduleName">스케줄 이름</label> <input type="text"
									class="form-control" id="sctitle" name="sctitle"
									placeholder="Schedule Name">
							</div>
						
						<!-- 
						value="2017-10-09T15:38:00" -->
						
						<input type="datetime-local" id="scdate" name="scdate" > 
						
						<div class="form-group">
								<label for="inputScheduleName">스터디 명(일단 번호로)</label> <input type="text"
									class="form-control" id="sno" name="sno"
									placeholder="Schedule Name">
							</div>
							
						<button type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 입력
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 취소
							</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<h2>니가 선택한 스터디의 메인 화면</h2>
			<p>니 스케줄이다. 그 밑에는 게시판</p>
			<div style="text-align: right">
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#createForm">스케줄 입력</button>
			</div>
		</div>
	</div>

	<section id='loadCalendar'>
		<jsp:include page="calendar.jsp"></jsp:include>
	</section>
	
	<div class="main">
		<form id="frm" >
			<input type="hidden" id="pageNo"  name="pageNo"  value="1"/>
			<input type="hidden" id="no"  name="no"/>
			<table align="center">
			<tr><th colspan="3"> 게시글 목록</th></tr>
	  	<tr align="center">
	  	</tr>
	  	<tr align="center">
	  	  <td width="100"> 일정번호</td><td width="200">제목</td><td  width="100">일시</td>
	  	  <c:forEach  var="schedule" items="${listschedule}">
	  	  <tr>
			 <td>${schedule.scno}</td>  	  
			 <td>${schedule.sctitle}</td>  	  
			 <td>${schedule.scdate}</td>  	
		  </tr>  
	  	  </c:forEach>
	  	  <td colspan="3" height="100" align="center">
	  	  <select  name="key" id="key">
	  		<option value="all"     >-----all-----</option>
	  		<option value="scno"      <%=pageBean.getKey("scno")%> >일정번호</option>
	  		<option value="sctitle"   <%=pageBean.getKey("sctitle")%>  >제목</option>
	  		<option value="sno" <%=pageBean.getKey("sno")%>  >스터디번호</option>
	  	  </select>
	  	  <input type="text" id="word" name="word" value="${pageBean.word}"/>
	  	  <a href="#" onclick="pagelist(1)">검색</a> &nbsp;&nbsp;&nbsp;
	  	 </td>
	  	</tr>
		</table>
			<div class="bottom"><center>${pageBean.pagelink } </center></div>
		</form>
	</div>
	
<div>
	<c:forEach var="studyList" items="${ studyList }">
		ggg${ studyList.sname }
	</c:forEach>
	
	
	<section id='loadBoard'>
	<br/><br/><br/>
		우하하하하하하<br/><br/><br/>		
		여기는 바로 게시판 자리이시다<br/><br/><br/>
		우하하하하하
		<br/><br/><br/>
	</section>
</div>


	<form method="get" action="searchSchedule.do">
		<table align='center'>
			<tr>
				<td class="caption" colspan='2'>가입하고파</td>
			</tr>
			<tr>
				<td class='tbasic'>검색할 스터디 선태크!</td>
				<td class='tbasic'><input type='text' name='id' id='id'></td>
			</tr>
			<tr>
				<td colspan='2' align='center' class='tfoot tspacial'><input
					type="submit" value='전송'> <input type="reset"
					value='취소'></td>
			</tr>
		</table>
	</form>

</body>
</html>