<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#searchBtn").click(function() {
			self.location = "list${pageMaker.makeQuery(1)}&searchType="	+ $("select option:selected").val()
							+ "&keyword="+ $("#keywordInput").val();
			});
		$("#newBtn").click(function() {
			self.location = "register";
		});
	 /* 	$(".modify").click(function() {
			self.location="modifyPage${pageMaker.makeSearch(pageMaker.cri.page)}&did="+$("#did").val();
		}); */
	 	$(".btn-danger").click(function(){
	 		    $.ajax({
	 		        dataType:'text',
	 		    	url: 'remove',
	 		        type:"post", 
	 		        data: {"did": $("#did").val()}	,
	 		        success : function(data){
	 		        	location.href="list";
	 		        }
	 		    })
		});
	});

</script>

<%@ include file="../admin/admin_sidebar.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class = "col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>의료진 목록 관리</h2>
			</div>
			
			<div class = "box box-body">
			
				<h3>의료진 검색</h3>

				<div class="form-group">					
					<div class="col-sm-6">
						<div class="form-inline">
							<select class="form-control" name="searchType">
								<option value="n"
									<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
								<option value="id"
									<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>번호</option>
								<option value="na"
									<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>이름</option>
							</select> 
							<input class="form-control" type="text" name="keyword" id="keywordInput"
								value="${cri.keyword}" />
							<button id="searchBtn" class="btn btn-warning">검색</button>
							<button id="newBtn" class="btn btn-primary">의료진 입력</button>
						</div>
					</div>
				</div>
			
				<table class="table table-striped">
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>진료실</th>
						<th>부서ID</th>
						<th>수정 / 삭제</th>						
					</tr>
					<c:forEach items="${list}" var="DoctorVO">
						<tr>
							<td>${DoctorVO.dname}</td>
							<td>${DoctorVO.dgender}</td>
							<td>${DoctorVO.dclinic}</td>
							<td>${DoctorVO.sjid}</td>
							<td>
								<a href="modifyPage?did=${DoctorVO.did}"><button type="button" class="btn btn-warning">수정</button></a>
								<button class="btn btn-danger" >삭제</button>
							</td>						
						</tr>
					</c:forEach>			
				</table>
			
				
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
						</c:if>
		
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>
		
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>				
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>