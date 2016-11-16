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
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;"; 
		window.open(popUrl,"부서선택",popOption);

	}
	 
	function setID(id){
   	document.getElementById("sjid").value = id;
	}
</script>

<!-- Main content -->
<div class="container-fluid">
	<div class="row">
		<%@ include file="../admin/admin_sidebar.jsp" %>
		
		<div class="col-sm-9 col-md-10 main">
			<div class="box">
				
				<form method="post">
					<div class="form-group">
						<label>이름 : </label>
						<input class="form-control" type="text" name="dname" id ="dname">
					</div>
					
					<div class="form-group">
						<label>성별 : </label>
						
						<input class="radio-inline" type="radio" name="dgender" id ="dgender" value="남"> 남
						<input class="radio-inline" type="radio" name="dgender" id ="dgender" value="여"> 여
						
					</div>
					
					<div class="form-group">
						<label>병실 : </label>
						<input class="form-control" type="text" name="dclinic" id ="dclinic" size="50">
					</div>
					
					<div class="form-group">
						<label>부서 : </label>
						<div class="input-group">
							<input class="form-control" type="text" name="sjid" id ="sjid">
							<span class="input-group-btn"><button onclick="searchSJ()" class="btn btn-primary">찾기</button></span>
						</div>
					</div>
										
					<button class="btn btn-primary" type="submit">입력</button>
									
				</form>
				
			</div>
		</div>

	</div>
</div>
<%@ include file="../include/footer.jsp"%>