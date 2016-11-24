
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../admin/admin_sidebar.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#submit").click(function(){
		if($("#rmnumber").val() == ""){
			alert("방번호 입력하세요");
			$("#rmnumber").focus();
			return false;
		}else if($("#rmheadcount").val() == ""){
			alert("입실최고인원을 입력하세요");
			$("#rmheadcount").focus();
			return false;
		}else{
			return true;
		}
	});
});

</script>
<div class="container-fluid">
	<div class="row">
		<div class = "col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>병실목록 입력</h2>
			</div>
			
			<div class = "box box-body">
				
				<form method="post" class="form-horizontal">
				
					<div class="form-group">
						<label class="control-label col-sm-2">방번호 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="rmnumber" id="rmnumber">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">입실최고인원 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="rmheadcount" id="rmheadcount">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<button class="btn btn-primary" type="submit" id="submit">입력</button>
						</div>
					</div>
					
				</form>
				
			</div><!-- box-body -->
					
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>

