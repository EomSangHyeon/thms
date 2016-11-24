<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function searchSJ() {
		event.preventDefault();
		var popUrl = "../subject/listView";
		var popOption = "width=370, height=670, resizable=no, scrollbars=no, status=yes;"; 
		window.open(popUrl,"부서선택",popOption);

	}
	 
	function setID(id){
   	document.getElementById("sjid").value = id;
	}
	
	 $(document).ready(function() {
			$("#submit").click(function(){
				if($("#dname").val() == ""){
					alert("이름을 입력하세요");
					$("#dname").focus();
					return false;
				}else if($("#dgender").val() == ""){
					alert("성별을 선택하세요");
					$("#dgender").focus();
					return false;
				}else if($("#dclinic").val() == ""){
					alert("병실을 입력하세요");
					$("#dclinic").focus();
					return false;
				}else if($("#sjid").val() == ""){
					alert("진료과목을 입력하세요");
					$("#sjid").focus();
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
				<h2>의료진 목록 입력</h2>
			</div>
			
			<div class="box box-body">
				
				<form method="post" class="form-horizontal">
					
					<div class="form-group">
						<label class="control-label col-sm-2">이름 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="dname" id ="dname">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">성별 : </label>
						<div class="col-sm-6">
							<input class="radio-inline" type="radio" name="dgender" id ="dgender" value="남" checked="checked"> 남
							<input class="radio-inline" type="radio" name="dgender" id ="dgender" value="여"> 여
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">병실 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="dclinic" id ="dclinic" size="50">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">진료과목 : </label>
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" name="sjid" id ="sjid">
								<span class="input-group-btn"><button onclick="searchSJ()" class="btn btn-primary">찾기</button></span>
							</div>
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
<%@ include file="../include/footer.jsp"%>