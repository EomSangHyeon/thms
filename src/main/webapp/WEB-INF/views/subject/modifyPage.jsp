<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp" %>
<%@ include file="../admin/admin_sidebar.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".btn-warning").on("click",function(){
		formObj.submit();
	});
	$(".btn-danger").on("click",function(){
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
				
				<form role="form" method="post">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
				
					<div class="form-group">
						<label>부서번호</label>
						<input class="form-control" type="text" name="sjid" value="${subjectVO.sjid}" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>부서명</label>
						<input class="form-control" type="text" name="sjname" value="${subjectVO.sjname}" >
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-warning">수정</button>
						<button type="submit" class="btn btn-danger">취소</button>
					</div>				
				</form>			
				
			</div><!-- box-body -->
					
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->

<%@ include file="../include/footer.jsp"%>