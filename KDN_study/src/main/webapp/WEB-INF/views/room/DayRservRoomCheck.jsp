<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>스터디룸 예약 정보</h2>
		<p>현재 KDN Study 포털의 룸 예약 현황 목록입니다.</p>
		<table class="table" style="text-align: center">
			<thead>
				<tr>
					<th>스터디룸 번호</th>
					<th>7-9시</th>
					<th>9-12시</th>
					<th>13-15시</th>
					<th>15-18시</th>
					<th>19-21시</th>
					<th>21-23시</th>
	
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${ dayRsvlist }">
					<tr>
						<th scope="row">${room.RNO}</th>
						<c:choose>
							<c:when test="${room.TIME07_09 == 0 }">
								<td style="color: blue">가능</td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>	
						<c:choose>
							<c:when test="${room.TIME09_12 == 0 }">
								<td style="color: blue">가능</td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${room.TIME13_15 == 0}">
									<td style="color: blue">가능</td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${room.TIME15_18 == 0}">
									<td style="color: blue">가능</td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${room.TIME19_21 == 0}">
								<td style="color: blue">가능</td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${room.TIME21_23 ==0}">
									<td style="color: blue">가능</td>
							</c:when>
							<c:otherwise>
								<td style="color: gray">불가능</td>
							</c:otherwise>
						</c:choose>
	
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
