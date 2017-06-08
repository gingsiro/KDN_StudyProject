<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').modal({
				remote : 'CreateStudy.jsp';
			});
		})
	})
</script>
</head>
<body>
	<button class="btn btn-default" id="popbutton">모달출력버튼</button>
	<br />
	<div style="overflow:hidden;" class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">Header</h4>
				</div>
				<!-- body -->
				<div class="modal-body">Bodddddy</div>
				<!-- Footer -->
				<div class="modal-footer">
					Footer
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<section id="study-main">
		<c:choose>
			<c:when test="${ !empty listform }">
				<jsp:include page="${ listform }" />
			</c:when>
			<c:otherwise>
				스터디 홈 입니다.
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>