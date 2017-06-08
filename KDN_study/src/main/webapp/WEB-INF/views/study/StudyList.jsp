<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

<!-- <link href="css/StudyCSS.css" rel="stylesheet"> -->

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').modal({
				remote : 'CreateStudy.jsp'
			});
		})
	})
</script>


</head>
<body>

	<div class="container">
	
	<div style="text-align:right" >
		<button style="display:inline-block" class="btn btn-default" id="popbutton">스터디 생성</button>
	</div>
	<br />
	<div style="overflow : hidden" class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">스터디 생성</h4>
				</div>
				<form method="post" action="createStudy.do" enctype="multipart/form-data" >
					<!-- body -->
					<div class="modal-body">
					
						<div class="form-group"> 
							<label for="inputStudyName">스터디 이름</label> 
							<input type="text" class="form-control" id="studyName" placeholder="Study Name"> 
						</div>
						<div class="form-group">
							<label for="inputCategory">카테고리</label> 
							<select class="form-control">
								<c:forEach var="category" items="${ categoryList }">
									<option id="categoryName" value="${ category.cname }">${ category.cname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="inputMax">정원</label> 
							<select class="form-control">
								<c:forEach var="i" begin="2" end="12" step="1">
									<option id="max" value="${ i }">${ i }</option>
								</c:forEach>
							</select>
						</div> 
						<!-- <div class="form-group"> 
							<label for="exampleInputFile">File input</label> 
							<input type="file" id="exampleInputFile"> 
							<p class="help-block">Example block-level help text here.</p> 
						</div> 
						<div class="checkbox"> 
							<label> 
								<input type="checkbox"> Check me out 
							</label> 
						</div>  -->
					</div>
					<!-- Footer -->
					<div class="modal-footer"> 내용을 확인하신 후 확인버튼을 눌러주세요.
					<button type="submit" class="btn btn-default" data-dismiss="modal">생성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
		<h2>스터디 목록</h2>
		<p>현재 KDN Study 포털에 등록된 전체 스터디 목록입니다.</p>
		<table class="table">
			<thead>
				<tr>
					<th>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
								카테고리<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="studyList.do">전체</a></li>
								<c:forEach var="category" items="${ categoryList }">
									<li><a href="studyList.do?key=cno&word=${ category.cno }">${ category.cname }</a></li>
								</c:forEach>
							</ul>
						</div>
					</th>
					<th>스터디명</th>
					<th>현재인원</th>
					<th>최대인원</th>
					<th>조작</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="study" items="${ list }">
					<tr>
						<th scope="row">${ study.cname }</th>
						<td>${ study.sname }</td>
						<td>${ study.scurr }</td>
						<td>${ study.smax }</td>
						<td>
							<a class="blue-text"><i class="fa fa-user"></i></a> 
							<a class="teal-text"><i class="fa fa-pencil"></i></a>
							<a class="red-text"><i class="fa fa-times"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>