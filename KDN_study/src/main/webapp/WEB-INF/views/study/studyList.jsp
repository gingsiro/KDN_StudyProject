<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
</head>
<body>

	<div class="container">
		<h2>스터디 목록</h2>
		<p>현재 KDN Study 포털에 등록된 전체 스터디 목록입니다.</p>
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
								<li><a href="studyList.do?key='cno'&word='1'">HTML</a></li>
								<li><a href="studyList.do?key='cno'&word='2'">CSS</a></li>
								<li><a href="studyList.do?key='cno'&word='3'">JavaScript</a></li>
							</ul>
						</div></th>
					<th>스터디명</th>
					<th>현재인원</th>
					<th>최대인원</th>
					<th>조작</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='study' items='list'>
					<tr>
						<th scope="row">${ study.cno }</th>
						<td>${ study.sname }</td>
						<td>${ study.scurr }</td>
						<td>${ study.smax }</td>
						<td><a class="blue-text"><i class="fa fa-user"></i></a> <a
							class="teal-text"><i class="fa fa-pencil"></i></a> <a
							class="red-text"><i class="fa fa-times"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>