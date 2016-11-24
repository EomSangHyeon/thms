<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function searchuid() {
		event.preventDefault();
		var popUrl = "/checkupreservation/memberList";
		var popOption = "width=600, height=700, resizable=no, scrollbars=no, status=yes;";
		window.open(popUrl, "", popOption);
	}
	function setmemID(id) {
		document.getElementById("uid").value = id;
	}
	
	
	
	$(document).ready(function() {
		if ($("select[name='chid']").val() != "")
			getid();

		$("select[name='chid']").on("change", getid);
	});

	function getid() {
		var selected_chid = $("select[name='chid']").val();

		$.getJSON("register/" + selected_chid, function(list) {
			var htmlStr = "<option value=''>---</option>";
			$(list).each(
					function(key, val) {
						htmlStr += "<option value='"+ val.crid +"'>"
								+ val.crnumber + "</option>";
					});
			$("select[name='crid']").html(htmlStr);

		});
	}
	$(document).ready(function() {
		$("#submit").click(function(){
			if($("#credate").val() == ""){
				alert("날짜를 입력하세요");
				$("#credate").focus();
				return false;
			}else if($("#uid").val() == ""){
				alert("아이디를 입력하세요");
				$("#uid").focus();
				return false;
			}else if($("#chid").val() == ""){
				alert("검사를 입력하세요");
				$("#chid").focus();
				return false;
			}else if($("#crid").val() == ""){
				alert("검사실을 입력하세요");
				$("#crid").focus();
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
				<h2>검사예약 입력</h2>
			</div>
			
			<div class="box box-body">
				<form method="post" class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2">검사 날짜</label>
						<div class="col-sm-6">
							<input class="form-control" type="date" name="credate" id="credate">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">환자ID</label>
						<div class="col-sm-6">
							<div class="input-group">
								<input class="form-control" type="text" name="uid" id="uid">
								<span class="input-group-btn"><button class="btn btn-primary" onclick="searchuid()">찾기</button></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">검사ID</label>
						<div class="col-sm-6">
							<select class="form-control" name="chid" id="chid">
								<option value="">----</option>
								<c:forEach items="${test}" var="CheckUpVO">
								<option value="${CheckUpVO.chid}">${CheckUpVO.chname}</option>
								</c:forEach>			
							</select>
						</div>						
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">검사실ID</label>
						<div class="col-sm-6">
							<select class="form-control" name="crid" id="crid">
								<option value="">검사를 먼저 선택 하세요</option>
							</select>
						</div>
					</div>	

					<div class="form-group">
      			<div class="col-sm-offset-2 col-sm-6">
							<button type="submit" id="submit">입력</button>
						</div>
					</div>
				</form>
	
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp"%>