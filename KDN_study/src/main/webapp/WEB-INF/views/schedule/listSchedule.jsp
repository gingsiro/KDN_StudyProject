<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <jsp:useBean 	id="pageBean"         class="com.kdn.study.domain.PageBean" 
				scope="request"/> --%>
<!DOCTYPE html>
<html>
	
<head>
	<meta charset="UTF-8">
	<title>Schedule List</title>
	<style type="text/css">
		#loadCalendar { witdth: 50px;
								/* margin-left: 20%;
								margin-right: 20%;*/
		} 
		
		#btn_insert_schedule { margin-bottom: 20px;
		}
	</style>
		
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/sch/sysdate.js"></script>
		
	<style>
	.form-group {
		display: block;
	}
	</style>
		
	<script type="text/javascript">
		$(function() {
			$("#popbutton").click(function() {
				$('div.modal').modal({});
			})
		})
		
		function updateForm(sname, cno, smax) {
			$('#updateSname').val(sname);
		}
			
		console.log('현재 날짜: ' + sysdate);
	
	</script>
		
	<script type="text/javascript">
	window.onload = function() 
	{ 
        
		console.log('현재 날짜: ' + sysdate); 
		$('#sysdate_').val(sysdate);
		$('#sno').val("${sno}");
	};
	</script>
	
</head>

<body>

		<!-- Modal -->
	<div style="overflow:hidden" id="createForm" class="modal fade" role="dialog">
		<div id="model" class="modal-dialog">
				<!-- Modal content-->
			<div class="modal-content">
					
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: blue;">
						<span class="glyphicon glyphicon-pencil"></span> 일정 입력
					</h4>
				</div>
					
				<div class="modal-body" id="modal-body">
					<form role="form" method="POST" action="insertSchedule.do">
						<input type="hidden" class="form-control" id="sno" name="sno">
						<div class="form-group">
							<label for="inputScheduleName">스케줄 이름</label> 
							<input type="text" class="form-control" id="sctitle" name="sctitle" placeholder="Schedule Name">
						</div>
						<!-- value="2017-10-09T15:38:00" -->
						<div class="form-group">
							<label for="inputScheduleName">일시</label><br/>
							<input type="datetime-local" id="sysdate_" name="scdate"  > 
						</div>

						<div style="text-align:right">
							<button type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 입력
							</button>
							<button type="reset" class="btn btn-default btn-success" data-dismiss="modal" id="schedule_close_button">
								<span class="glyphicon glyphicon-remove"></span> 취소
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
		
	<div id="shcedule_title">
		<h2>스터디 일정</h2>
		<p>현재 스터디 그룹에 등록된 일정입니다.</p>
	</div>
	
	<div style="text-align: right">
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
					id = "btn_insert_schedule" data-target="#createForm">일정 입력</button>
	</div>

	<div id='loadCalendar'>
		<jsp:include page="calendar.jsp"></jsp:include>
	</div>
</body>
</html>
