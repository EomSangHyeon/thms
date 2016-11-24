<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
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
											self.location = "/checkup/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
										});
					});
</script>
<%@ include file="../admin/admin_sidebar.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-md-10 main">

			<div class="box box-header">
				<h2>검사 목록 수정</h2>
			</div>

			<div class="box box-body">

				<h3>검사명 수정</h3>

				<form role="form" method="post" class="form-horizontal">
					<input type="hidden" name="page" value="${cri.page}"> <input
						type="hidden" name="perPageNum" value="${cri.perPageNum}">
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">

					<div class="form-group">
						<label class="control-label col-sm-2">검사ID : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="chid"
								value="${checkUpVO.chid}" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">검사명 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="chname"
								value="${checkUpVO.chname}">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<button type="submit" id="modify" class="btn btn-warning">수정</button>
							<button type="submit" id="remove" class="btn btn-danger">취소</button>
						</div>
					</div>
				</form>

			</div>
			<!-- box-body -->

		</div>
		<!-- /col-sm-9 col-md-10 main -->
	</div>
	<!-- .row -->
</div>
<!-- .container-fluid -->
<%@ include file="../include/footer.jsp"%>