<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	 function searchcheckup() {
		event.preventDefault();
		var popUrl = "../checkup/listView";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;"; 
		window.open(popUrl,"부서선택",popOption);

	}
	 
	 function setID(id){
	      document.getElementById("chid").value = id;
	}
	 
	 $(document).ready(function(){
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$("#modify").on("click",function(){
				formObj.submit();
			});
			$("#remove").on("click",function(){
				self.location="/checkuproom/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
						"&searchType=${cri.searchType}&keyword=${cri.keyword}";
			}); 
		});
</script>
<%@ include file="../admin/admin_sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">		
		<div class="col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>검사실 수정</h2>
			</div>
			
			<div class="box box-body">
			
				<form role="form" method="post" class="form-horizontal">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
				
				
					<div class="form-group">
						<label class="control-label col-sm-2">검사실 ID : </label> 
						<div class="col-sm-6">
							<input class="form-control" type="text" name="crid" value="${checkUpRoomVO.crid}" readonly="readonly">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">검사 ID :</label> 
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" name="chid" id ="chid" value="${checkUpRoomVO.chid}">
								<span class="input-group-btn"><button class="btn btn-primary" onclick="searchcheckup()">찾기</button></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">검사실 :</label>
						<div class="col-sm-6">
							<input type="text" name="crnumber" id ="crnumber" value="${checkUpRoomVO.crnumber}">
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