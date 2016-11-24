<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
	 function searchcheckup() {
		event.preventDefault();
		var Url = "../checkup/listView";
		var Option = "width=370, height=670, resizable=no, scrollbars=no, status=yes;"; 
		window.open(Url,"검사선택",Option);

	}
	 
	 function setID(id){
	      document.getElementById("chid").value = id;
	}
	 $(document).ready(function() {
			$("#submit").click(function(){
				if($("#chid").val() == ""){
					alert("검사를 입력하세요");
					$("#chid").focus();
					return false;
				}else if($("#dclinic").val() == ""){
					alert("검사실을 입력하세요");
					$("#dclinic").focus();
					return false;
				}else{
					return true;
				}
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
			
				<form method="post" class="form-horizontal">
				
					<div class="form-group">
						<label class="control-label col-sm-2">검사ID :</label> 
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" name="chid" id ="chid">
								<span class="input-group-btn"><button class="btn btn-primary" onclick="searchcheckup()">찾기</button></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">검사실 : </label>
						<div class="col-sm-6"> 
							<input class="form-control" type="text" name="crnumber" id ="dclinic">
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