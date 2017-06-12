<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function insertForm() {
	$('#modal-title').html("스터디룸 추가");
	$('#submitButtonName').html("<span class='glyphicon glyphicon-ok'></span>추가");
	$('#rno').val();
	$('#rname').val();
	$('#rmax').val();
	$("#cuRoom").attr("action", "insertRoom.do");

	$('#modalForm').modal();
}

function updateForm(rno, rname, rmax) {
		$('#modal-title').html("스터디룸 수정");
		$('#submitButtonName').html("<span class='glyphicon glyphicon-ok'></span>수정");
		$('#rno').val(rno);
		$('#rname').val(rname);
		$('#rmax').val(rmax);
		$("#cuRoom").attr("action", "updateRoom.do");

		$('#modalForm').modal();
}

function deleteRoom(rno) {
		$('#drno').val(rno);			
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
						<span class="glyphicon glyphicon-pencil"></span><label id="modal-title">룸 추가하기</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="cuRoom" name="cuRoom" role="form" method="POST" action="insertRoom.do">
						<div class="form-group" >
							<label for="inputStudyName">룸 번호</label> 
							<input type="text" class="form-control" id="rno" name="rno" placeholder="Room NUMBER" value="" required>
						</div>
						<div class="form-group">
							<label for="inputCategory">룸 이름</label> 
							<input type="text" class="form-control" id="rname" name="rname" placeholder="Room NAME" value="" required>				
						</div>
						<div class="form-group">
							<label for="inputCategory">룸 정원</label> 
							<input type="text" class="form-control" id="rmax" name="rmax" placeholder="Room MAX" value="" required>
						</div>
						<div style="text-align:right">
							<button id="submitButtonName" name="submitButtonName" type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span>추가							
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
						<span class="glyphicon glyphicon-exclamation-sign"></span><label id="checkContentTitle" >스터디 삭제</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="rdStudy" name="rdStudy" role="form" method="POST" action="deleteRoom.do">
						<label id="checkContent" for="checkContent">해당 스터디룸과 관련된 예약까지 모두 삭제됩니다. </br>정말 삭제하시겠습니까?</label><br/>
						<input type="hidden" id="drno" name="rno" />
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
	<div>
		<h2>KDN 스터디룸 정보</h2>
		<p>현재 KDN의 스터디룸 정보 목록입니다.</p>
		<div style="text-align: right">
		<button type="button" class="btn btn-info btn-lg" data-keyboard="true" onClick="insertForm()">스터디룸 추가</button>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>룸 번호</th>
					<th>룸 이름</th>
					<th>룸 정원</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${ roomList }">
					<tr>
						<th scope="row">${room.rno}</th>
						<td>${room.rname}</td>
						<td>${room.rmax}</td>
						<td><a class="teal-text" data-keyboard="true" onClick="updateForm('${room.rno}', '${room.rname}', '${room.rmax}')"><i class="fa fa-pencil"></i>수정</a></td>
						<td><a class="red-text"onClick="deleteRoom('${ room.rno }')"><i class="fa fa-times"></i>삭제</a></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>