
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../admin/admin_sidebar.jsp" %>
<<script type="text/javascript">
$(document).ready(function() {
	$("#submit").click(function(){
		if($("#chname").val() == ""){
			alert("검사 이름을 입력하세요");
			$("#chname").focus();
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
				<h2>검사 목록 입력</h2>
			</div>
			
			<div class = "box box-body">
			
				<h3> 검사명 입력</h3>
				
				<form method="post">
					<div class="form-group">
					
						<div class="col-sm-4">							
							<input class="form-control" type="text" name="chname" id="chname">
						</div>
						<div class="col-sm-2">
							<button type="submit" id ="submit" class="btn btn-primary">입력</button>
						</div>						
					</div>
				</form>
				
			</div><!-- box-body -->
					
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>


