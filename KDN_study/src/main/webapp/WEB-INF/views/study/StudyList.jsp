<%@ page language="java" contentType="text/str += 'html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>StudyList</title>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/*$(function() {
		$("#popbutton").click(function() {
			$('div.modal').modal({});
		})
	})*/
	function insertForm() {
		$('#modal-title').html("스터디 생성");
		$('#submitButtonName').html("<span class='glyphicon glyphicon-ok'></span>생성");
		$('#sno').val(0);
		$('#scurr').val(1);
		$('#sname').val("");
		$('#sinfo').val("");
		$("#cuStudy").attr("action", "createStudy.do");
		$('#cno').val(1).attr("selected", "selected");
		$('#smax').val(2).attr("selected", "selected");
		$('#modalForm').modal();
	}
	
	function updateForm(sno, sname, cno, smax, smaster, scurr, sinfo) {
		$('#modal-title').html("스터디 수정");
		$('#submitButtonName').html("<span class='glyphicon glyphicon-ok'></span>수정");
		$('#sno').val(sno);
		$('#sname').val(sname);
		$('#sinfo').val(sinfo);
		$("#cuStudy").attr("action", "updateStudy.do");
		$('#cno').val(cno).attr("selected", "selected");
		$('#smax').val(smax).attr("selected", "selected");
		$('#scurr').val(scurr).val(scurr);
		$('#modalForm').modal();
	}
	
	function deleteStudy(sno, smaster) {
		$('#rdsno').val(sno);			
		$('#checkContentTitle').html('스터디 삭제');
		$('#checkContent').html('정말 삭제하시겠습니까?');
		$('#checkButtonName').html('<span class="glyphicon glyphicon-ok"></span> 삭제');
		$("#rdStudy").attr("action", "deleteStudy.do");
		$('#checkForm').modal();
	}
	
	function joinStudy(sno){
		$('#rdsno').val(sno);
		$('#checkContentTitle').html('스터디 가입');
		$('#checkContent').html('정말 가입하시겠습니까?');
		$('#checkButtonName').html('<span class="glyphicon glyphicon-ok"></span> 가입');
		$("#rdStudy").attr("action", "joinStudy.do");
		$('#checkForm').modal();
	}
</script>

</head>
<body>
	<!--
		스터디 생성/수정모달 
	 -->
	<div style="overflow:hidden" id="modalForm" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: blue">
						<span class="glyphicon glyphicon-pencil"></span><label id="modal-title">스터디 생성</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="cuStudy" name="cuStudy" role="form" method="POST" action="createStudy.do">
						<div class="form-group" >
							<label for="inputStudyName">스터디 이름</label> 
							<input type="text" class="form-control" id="sname" name="sname" placeholder="스터디 이름을 작성해주세요." value="" required>
						</div>
						<div class="form-group">
							<label for="inputCategory">카테고리</label> 
							<select id="cno" name="cno" class="form-control" required>
								<c:forEach var="category" items="${ categoryList }">
									<option value="${ category.cno }">${ category.cname }</option>									
								</c:forEach>
							</select>							
						</div>
						<div class="form-group">
							<label for="inputMax">정원</label> 
							<select id="smax" name="smax" class="form-control" required>
								<c:forEach var="i" begin="2" end="12" step="1">
									<option value="${ i }">${ i }</option>									
								</c:forEach>
							</select>
							<input type="hidden" id="smaster" name="smaster" value="${ empno }" />
							<input type="hidden" id="sno" name="sno" value="${ sno }" />
							<input type="hidden" id="scurr" name="scurr" value="${ scurr }" />
						</div>
						<div class="form-group" >
							<label for="inputStudyName">스터디 설명</label> 
							<input type="text" class="form-control" id="sinfo" name="sinfo" placeholder="스터디 설명을 작성해주세요." value="" required>
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
						<span class="glyphicon glyphicon-exclamation-sign"></span><label id="checkContentTitle" >스터디 삭제</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="rdStudy" name="rdStudy" role="form" method="POST" action="deleteStudy.do">
						<label id="checkContent" for="checkContent">정말 삭제하시겠습니까?</label><br/>
						<input type="hidden" id="rdsno" name="sno" value="" />
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



	<h2>전체 스터디 목록</h2>
	<p>KDN Study 포털에 등록된 전체 스터디 목록입니다.</p>
	<div style="text-align: right">
		<button type="button" class="btn btn-info btn-lg" data-keyboard="true" onClick="insertForm()">스터디 생성</button>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th style="width:100px">
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
				<th style="width:100px; text-align:center">현재인원</th>
				<th style="width:100px; text-align:center">최대인원</th>
				<th style="width:65px"></th>
				<th style="width:65px"></th>
				<th style="width:65px"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="study" items="${ list }">
				<tr>
					<c:set var="index" value="0"/> 
					<c:forEach var="myStudy" items="${ myStudyList }">
						<c:if test="${index eq '0'}"> 
							<c:if test="${ study.sno == myStudy.sno }"> 
								<c:set var="index" value="1"/> 
							</c:if>
						</c:if>
					</c:forEach>
					<th scope="row">${ study.cname }</th>
					<td>
						<c:if test="${ index eq '1' }">
							<a href="listSchedule.do?sno=${study.sno}">${ study.sname }</a>
						</c:if>
						<c:if test="${ index eq '0' }">
							${ study.sname }
						</c:if>
						<br/>
						<c:if test="${ study.sinfo!=null }">
							<font size="2em" color="gray">─${ study.sinfo }</font>
						</c:if>
					</td>
					<td style="text-align:center">${ study.scurr }</td>
					<td style="text-align:center">${ study.smax }</td>
					<td>
						<c:if test="${ index eq '0' && study.scurr < study.smax}">
							<a class="teal-text" data-keyboard="true" onClick="joinStudy('${ study.sno }')"><i class="fa fa-plus"></i>가입</a>
						</c:if>
					</td>
					<td>
						<c:if test="${ empno == study.smaster || admin eq 'Y' }">
							<a class="teal-text" data-keyboard="true" onClick="updateForm('${ study.sno }', '${ study.sname }', '${ study.cno }', '${ study.smax }', '${ study.smaster }', '${ study.scurr }', '${ study.sinfo }')">
								<i class="fa fa-pencil"></i>수정
							</a>
						</c:if>
					</td>
					<td>
						<c:if test="${ empno == study.smaster || admin eq 'Y'  }">
							<a class="red-text"onClick="deleteStudy('${ study.sno }', '${ study.smaster }')">
								<i class="fa fa-times"></i>삭제
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
