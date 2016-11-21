<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	function searchSJ() {
		event.preventDefault();
		var popUrl = "../subject/listView";
		var popOption = "width=370, height=670, resizable=no, scrollbars=no, status=yes;";
		window.open(popUrl, "부서선택", popOption);

	}

	function setID(id) {
		document.getElementById("sjid").value = id;
	}

	$(document)
			.ready(
					function() {
						var formObj = $("form[role='form']");
						console.log(formObj);

						$("#modify").on("click", function() {
							formObj.submit();
						});
						$("#remove")
								.on(
										"click",
										function() {
											self.location = "/doctor/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
										});
					});
</script>
<%@ include file="../admin/admin_sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">		
		<div class="col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>의료진 목록 수정</h2>
			</div>
			
			<div class="box box-body">

				<form role="form" method="post" class="form-horizontal">
					<input type="hidden" name="did" value="${doctorVO.did}"> 
					<input type="hidden" name="page" value="${cri.page}"> 
					<input type="hidden" name="perPage" value="${cri.perPageNum}"> 
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
			
					<div class="form-group">
						<label class="control-label col-sm-2">번호 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="did" value="${doctorVO.did}"	readonly="readonly">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">이름 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="dname" id="dname" value="${doctorVO.dname}">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">성별 : </label>
						<div class="col-sm-6">
							<input type="radio" name="dgender" id="dgender" value="남" checked="checked">남
							<input type="radio" name="dgender" id="dgender" value="여">여
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">진료실 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="dclinic" id="dclinic" value="${doctorVO.dclinic}">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">진료과목 : </label>
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" name="sjid" id="sjid" value="${doctorVO.sjid}">
								<span class="input-group-btn"><button onclick="searchSJ()" class="btn btn-primary">찾기</button></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
      			<div class="col-sm-offset-2 col-sm-6">
							<button type="submit" id="modify" class="btn btn-warning">수정</button>
							<button type="submit" id="remove" class="btn btn-danger">취소</button>
						</div>
					</div>					
				</form>
				
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>