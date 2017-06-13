<%@ page language="java" contentType="text/str += 'html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Join List</title>
<meta charset="UTF-8">

<style>
	.fa-flag { color: #1DDB16;
	}
	
	.fa-user { color: #FF0000;
	}
</style>
	
<script>
function deleteMember(sno, jno, scurr) {
	$('#ban_jno').val(jno);
	$('#sno').val(sno);
	$('#scurr').val(scurr);	
	$('#checkForm').modal();
}

</script>
</head>
<body>

	<div style="overflow:hidden" id="checkForm" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: blue">
						<span class="glyphicon glyphicon-exclamation-sign"></span><label id="checkContentTitle" >스터디원 강퇴</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form id="rdStudy" name="rdStudy" role="form" method="POST" action="deleteMember.do">
						<label id="checkContent" for="checkContent">정말 강퇴하시겠습니까?</label><br/>
						<input type="hidden" id=ban_jno name="jno" value="" />
						<input type="hidden" id=scurr name="scurr" value="" />
						<input type="hidden" id=sno name="sno" value="" />
						<div style="text-align:right">
							<button id="checkButtonName" name="checkButtonName" type="submit" class="btn btn-default btn-success">
								<span class="glyphicon glyphicon-ok"></span> 강퇴							
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
	
	
	
	<div id="member_title">
		<h2>스터디 구성원</h2>
		<p>현재 스터디 그룹에 가입한 구성원입니다.</p>
		<br/>
		<p> 정원 : ${ joinMembers_list[0].smax }     현원 : ${ joinMembers_list[0].scurr }</p>
		<br/>
		<br/> 
		<table class="table">
			<thead>
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${ joinMembers_list }">
					<tr>
						<th scope="row">${member.empno}</th>
						<td>${member.ename}
							<c:if test = "${member.empno == member.smaster}">
								&nbsp;<i class="fa fa-flag">리더</i>
							</c:if>
							<c:if test = "${empno == member.empno }">
								&nbsp;<i class="fa fa-user">나</i>
							</c:if>
						</td>
						<td>${member.dept}</td>
						<c:if test="${ empno == member.smaster }">
							<c:if test="${ empno != member.empno }">
								<td><a data-toggle="modal" data-target="#delMember" class="red-text" onClick="deleteMember('${ member.sno }', ${ member.jno }, ${ member.scurr }  )"><i class="fa fa-times"></i></a></td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<%-- 
	<div>
		<ul>
			<c:forEach var="member" items="${ joinMembers_list }">
				<li>${ member.ename }
					<c:if test = "${member.empno == member.smaster}">
						<i class="fa fa-flag"></i>
					</c:if>
					<c:if test = "${empno == member.empno }">
						<p>너다</p>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div> --%>
	
</body>
</html>
