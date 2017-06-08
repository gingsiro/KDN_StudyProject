<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

<link href="css/StudyCSS.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<h2>스터디 목록</h2>
		<p>현재 KDN Study 포털에 등록된 전체 스터디 목록입니다.</p>
		<a href="">스터디만들기</a>
		



		<table class="table">
			<thead>
				<tr>
					<th><div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown">
								카테고리 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="studyList.do">전체</a></li>
								<c:forEach var="category" items="${ categoryList }">
									<li><a href="studyList.do?key=cno&word=${ category.cno }">${ category.cname }</a></li>
								</c:forEach>
							</ul>
						</div></th>
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