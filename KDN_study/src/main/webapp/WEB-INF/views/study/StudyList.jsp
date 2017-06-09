<%@ page language="java" contentType="text/str += 'html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">

<!-- <link href="css/StudyCSS.css" rel="stylesheet"> -->

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').modal({});
		})
	})

	function updateForm(study) {
		var str = "";
		alert(study);
		str += '<form role="form" method="POST" action="createStudy.do">';
		str += '<div class="form-group" >';
		str += '<label for="inputStudyName">스터디 이름</label> ';
		str += '<input type="text" class="form-control" id="sname" name="sname" placeholder="Study Name" value="'+ study.sname +'">';
		str += '</div>';
		str += '<div class="form-group">';
		str += '<label for="inputCategory">카테고리</label> <select id="cno"';
		str += 'name="cno" class="form-control">';
		str += '<c:forEach var="category" items="${ categoryList }">';
		str += '				<option value="${ category.cno }">${ category.cname }</option>';
		str += '</c:forEach>';
		str += '</select>';
		str += '</div>';
		str += '<div class="form-group">';
		str += '<label for="inputMax">정원</label>'; 
		str += '<select id="smax" name="smax" class="form-control">';
		str += '<c:forEach var="i" begin="2" end="12" step="1">';
		str += '				<option value="${ i }">${ i }</option>';
		str += '</c:forEach>';
		str += '</select>';
		str += '<input type="hidden" id="scurr" name="scurr" value="1" />';
		str += '<input type="hidden" id="smaster" name="smaster" value="170001" />';
		str += '</div>';
		str += '<button type="submit" class="btn btn-default btn-success">';
		str += '<span class="glyphicon glyphicon-ok"></span> 생성';
		str += '</button>';
		str += '<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">';
		str += '<span class="glyphicon glyphicon-remove"></span> 취소';
		str += '</button>';	
		str += '</form>';
		document.getElementById("modal-body").innerHTML = str;
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
							<span class="glyphicon glyphicon-pencil"></span> 스터디 생성
						</h4>
					</div>
					<div class="modal-body">
						<form role="form" method="POST" action="createStudy.do">
							<div class="form-group">
							<label for="inputStudyName">스터디 이름</label> <input type="text"
								class="form-control" id="sname" name="sname"
								placeholder="Study Name">
						</div>
						<div class="form-group">
							<label for="inputCategory">카테고리</label> <select id="cno"
								name="cno" class="form-control">
								<c:forEach var="category" items="${ categoryList }">
									<option value="${ category.cno }">${ category.cname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="inputMax">정원</label> 
							<select id="smax" name="smax" class="form-control">
								<c:forEach var="i" begin="2" end="12" step="1">
									<option value="${ i }">${ i }</option>
								</c:forEach>
							</select>
							<input type="hidden" id="scurr" name="scurr" value="1" />
							<input type="hidden" id="smaster" name="smaster" value="170001" />
						</div>
						<button type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 생성
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 취소
							</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div style="overflow:hidden" id="updateForm" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 style="color: blue;">
							<span class="glyphicon glyphicon-pencil"></span> 스터디 수정
						</h4>
					</div>
					<div class="modal-body" id="modal-body">
					</div>
				</div>
			</div>
		</div>





		<h2>스터디 목록</h2>
		<p>현재 KDN Study 포털에 등록된 전체 스터디 목록입니다.</p>
		<div style="text-align: right">
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#createForm">스터디 생성</button>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								data-toggle="dropdown">
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
						<td><!-- <a class="blue-text" ><i class="fa fa-user"></i></a>  -->
							<a class="teal-text" data-toggle="modal" data-target="#updateForm" onClick="updateForm('${ study }')"><i class="fa fa-pencil"></i></a>
							<a class="red-text"><i class="fa fa-times"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>