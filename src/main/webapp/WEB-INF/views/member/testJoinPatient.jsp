<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	function setUid(id) {
		document.getElementById("uid").value = id;
	}

	function setRmid(rmid) {
		document.getElementById("rmid").value = rmid;
	}

	function searchUid() {

		window.open("searchUid", "", "width=700, height=750, left=600");

	}

	function searchRestRoom() {
		window.open("searchRoom", "", "width=700, height=750, left=600");

	}
</script>

<!--  사용자 uid 검색 가능하게  ajax로
입원일은 그냥 입력
병실 빈병실 검색하게 해서 나오게하기 ajax
의사 이름으로 검색 하게하기 ajax
-->
<%@ include file="../admin/admin_sidebar.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-md-10 main">

			<div class="box box-header">
				<h2>입원자 추가</h2>
			</div>

			<div class="box box-body">

				<form class="form-horizontal" action="joinForPatient.do"
					method="post">

					<div class="form-group">
						<label class="control-label col-sm-2">입원자 ID : </label>
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" id="uid" name="uid"
									value='${here 	 }' readonly="readonly"> <span
									class="input-group-btn"><input class="btn btn-primary"
									type="button" id="btn" name="btn" onclick="searchUid()"
									value="검색"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2">입원일 입력 : </label>
						<div class="col-sm-6">
							<input class="form-control" type="date" id="horegdate"
								name="horegdate">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2">빈 병실 검색 : </label>
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" id="rmid" name="rmid"
									onchange="restRoom()" readonly="readonly"> <span
									class="input-group-btn"><input class="btn btn-primary"
									type="button" id="" name="" onclick="searchRestRoom()"
									value="검색"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<div id="searchRmid"></div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2">담당의사 번호 : </label>
						<div class="col-sm-6">
							<select id="sjid" name="sjid" onchange="alert(hh)">
							<option value="hh">hh</option>
							<option value="hh">hh</option>
							<option value="hh">hh</option>
							</select> 
							
							
							
							
							<input class="form-control"
								type="text" id="did" name="did" onchange="searchDidForPatient()">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<input class="btn btn-primary" type="submit" value="입력">
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