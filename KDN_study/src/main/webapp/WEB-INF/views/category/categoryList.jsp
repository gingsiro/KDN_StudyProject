<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/*$(function() {
		$("#popbutton").click(function() {
			$('div.modal').modal({});
		})
	})*/
	function insertForm() {
		$('#modal-title').html("카테고리 생성");
		$('#submitButtonName').html("<span class='glyphicon glyphicon-ok'></span>생성");
		$('#cname').val();
		$('#cucno').val(0);
		$("#cuCategory").attr("action", "createCategory.do");
		$('#modalForm').modal();
	}
	
	function updateForm(cno, cname) {
		$('#modal-title').html("카테고리 수정");
		$('#submitButtonName').html("<span class='glyphicon glyphicon-ok'></span>수정");
		$('#cname').val(cname);
		$('#cucno').val(cno);
		$("#cuCategory").attr("action", "updateCategory.do");
		$('#modalForm').modal();
	}
	
	function deleteCategory(cno) {
		$('#rdcno').val(cno);
		$('#checkContentTitle').html('카테고리 삭제');
		$('#checkContent').html('정말 삭제하시겠습니까?<br/>현재 연결된 스터디가 있다면 모두 삭제됩니다.<br/>주의하시기 바랍니다.<br/>');
		$('#checkButtonName').html('<span class="glyphicon glyphicon-ok"></span> 삭제');
		$("#rdCategory").attr("action", "deleteCategory.do");
		$('#checkForm').modal();
	}
</script>
</head>
<body>
<div style="overflow:hidden" id="modalForm" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: blue">
						<span class="glyphicon glyphicon-pencil"></span><label id="modal-title">카테고리 생성</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="cuCategory" name="cuCategory" role="form" method="POST" action="createCategory.do">
						<div class="form-group" >
							<label for="inputCategoryName">카테고리 이름</label> 
							<input type="text" class="form-control" id="cname" name="cname" placeholder="Category Name" value="" required>
						<input type="hidden" id="cucno" name="cno" value="" />
						</div>
						<div style="text-align:right">
							<button id="submitButtonName" name="submitButtonName" type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span>생성							
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 취소							
							</button>
						</div>
					</form>					
				</div>
			</div>			
		</div>
	</div>
	
	<div style="overflow:hidden" id="checkForm" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: blue">
						<span class="glyphicon glyphicon-exclamation-sign"></span><label id="checkContentTitle" >카테고리 삭제</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="rdCategory" name="rdCategory" role="form" method="POST" action="deleteCategory.do">
						<label id="checkContent" for="checkContent">정말 삭제하시겠습니까?</label><br/>
						<input type="hidden" id="rdcno" name="cno" value="" />
						<div style="text-align:right">
							<button id="checkButtonName" name="checkButtonName" type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 삭제							
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> 취소							
							</button>
						</div>			
					</form>	
				</div>
			</div>			
		</div>
	</div>



	<h2>전체 카테고리 목록</h2>
	<p>KDN Study 포털에 등록된 전체 카테고리 목록입니다.</p>
	<div style="text-align: right">
		<button type="button" class="btn btn-info btn-lg" data-keyboard="true" onClick="insertForm()">카테고리 생성</button>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th style="width:140px;text-align:center">카테고리 번호</th>
				<th style="text-align:center">카테고리명</th>
				<th style="width:65px"></th>
				<th style="width:65px"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="category" items="${ list }">
				<tr>
					<th style="text-align:center" scope="row">${ category.cno }</th>
					<td style="text-align:center">${ category.cname }</td>
					<td>
						<a class="teal-text" data-keyboard="true" onClick="updateForm('${ category.cno }', '${ category.cname }')"><i class="fa fa-pencil"></i>수정</a>
					</td>
					<td>
						<a class="red-text"onClick="deleteCategory('${ category.cno }')"><i class="fa fa-times"></i>삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>