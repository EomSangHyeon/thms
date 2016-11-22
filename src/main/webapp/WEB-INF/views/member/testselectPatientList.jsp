<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	var comeon;

	function deleteAjax(here) {
		$.ajax({
			url : 'deleteAjax.do',
			type : 'post',
			dataType : 'text',
			data : {
				hoid : here
			},
			success : function() {
				alert("삭제하였습니다");
				location.href = 'testselectPatientList'
			}
		})

	}

	//환자 입실이미 되어있나 없나 확인후에 환자 

	function goRoom(comeon) {
		window.open("confirmRoom?hoid=" + comeon, "",

				"width=400, height=500, left=600");

	}

	function leaveRoom() {
		alert("안만듬");

	}
</script>

<%@ include file="../admin/admin_sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class = "col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>입원자 관리</h2>
			</div>
			
			<div class = "box box-body">
			
				<h3>입원자 검색</h3>
				
				<div class="form-group">					
					<div class="col-sm-10">
						<div class="form-inline">
							<div class="form-group">
								<form action="testselectPatientList">
									<select class="form-control" name="searchType">
										<option value="hoid">환자 아이디</option>
										<option value="uid">유저 아아디</option>
										<option value="rmid">방번호</option>
										<option value="did">담당 의사</option>
									</select>
									<input class="form-control" type="text" name="keyword" required="required">
									<input class="btn btn-warning" type="submit" value="검색">																
								</form>
							</div>
							
							<div class="form-group">
								<input class="btn btn-primary" type="button" value="환자병실확인"	onclick="self.location='/room/list';" />
								<input class="btn btn-primary" type="button" value="입원자 추가" onclick="self.location='/member/testJoinPatient';" />	
							</div>
						</div>
					</div>
				</div>
			
				<table class="table table-striped">
					<tr>
						<th>환자ID</th>
						<th>ID</th>
						<th>입실일</th>
						<th>방번호</th>
						<th>의사아이디</th>
						<th>입퇴실/환자삭제</th>
					</tr>
					<c:forEach items="${list }" var="patient">
						<tr>
							<td>${patient.hoid }</td>
							<td>${patient.uid }</td>
							<td>${patient.horegdate }</td>
							<td>${patient.rmid }</td>
							<td>${patient.did }</td>
							<td>
								<input class="btn btn-primary"type="button" value="입실" id="enterRoom"
								onclick="goRoom(' ${patient.hoid}')">
								<input class="btn btn-warning" type="button" value="퇴실" id="checkOut"
								onclick="leaveRoom()">
								<input class="btn btn-danger" type="button" value=" 삭제"
								onclick="deleteAjax('${patient.hoid }')">
							</td>
						</tr>
			
					</c:forEach>
				</table>
			
				<div class="text-center">
					<ul class="pagination">
			
						<c:if test="${pageMaker.prev}">
							<li><a
								href="testselectPatientList?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
						</c:if>
			
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
			
							<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
								<a
								href="testselectPatientList?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
							</li>
						</c:forEach>
			
						<c:if test="${pageMaker.next && pageMaker.endPage>0}">
							<li><a
								href="testselectPatientList?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp"%>