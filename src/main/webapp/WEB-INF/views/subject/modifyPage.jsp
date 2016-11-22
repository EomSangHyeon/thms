<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../admin/admin_sidebar.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$("#modify").on("click",function(){
		formObj.submit();
	});
	$("#remove").on("click",function(){
		self.location="/subject/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
				"&searchType=${cri.searchType}&keyword=${cri.keyword}";
	}); 
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class = "col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>진료과 목록 입력</h2>
			</div>
			
			<div class = "box box-body">
			
				<h3>진료과목 수정</h3>				
				
				<form role="form" method="post" class="form-horizontal">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
				
					<div class="form-group">
						<label class="control-label col-sm-2">부서번호 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="sjid" value="${subjectVO.sjid}" readonly="readonly">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">부서명 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="sjname" value="${subjectVO.sjname}" >
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<button type="submit" class="btn btn-warning" id="modify">수정</button>
							<button type="submit" class="btn btn-danger" id="remove">취소</button>
						</div>
					</div>				
				</form>			
				
			</div><!-- box-body -->
					
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->

<%@ include file="../include/footer.jsp"%>
