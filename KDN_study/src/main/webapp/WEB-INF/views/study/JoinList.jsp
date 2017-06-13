<%@ page language="java" contentType="text/str += 'html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Join List</title>
<meta charset="UTF-8">

</head>
<body>

	<div id="member_title">
		<h2>스터디 구성원</h2>
		<p>현재 스터디 그룹에 가입한 구성원입니다.</p>
		<br/>
		<p>현원/정원 : ${ joinMembers_list[0].scurr }/${ joinMembers_list[0].smax }</p> 
	</div>
	
	<div>
		<ul>
			<c:forEach var="member" items="${ joinMembers_list }">
				<li>${ member.ename }
					<c:if test = "${member.empno == member.smaster}">
						<p>얘가 바로 스터디장ㅎㅎ</p>
					</c:if>
					<c:if test = "${empno == member.empno }">
						<p>너다</p>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>
