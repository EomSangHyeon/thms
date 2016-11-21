<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function searchuid() {
	event.preventDefault();
	var popUrl = "/checkupreservation/memberList";
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;";
	window.open(popUrl, "", popOption);
}
function setmemID(id) {
	document.getElementById("uid").value = id;
}

function searchCh() {
	event.preventDefault();
	var popUrl = "/checkupreservation/checkupList";
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;";
	window.open(popUrl, "", popOption);
}
function setcheckupID(id) {
	document.getElementById("chid").value = id;
}
function searchchroom() {
	event.preventDefault();
	var popUrl = "/checkupreservation/checkuproomList";
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;";
	window.open(popUrl, "", popOption);
}
function setcheckuproomID(id) {
	document.getElementById("crid").value = id;
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
											self.location = "/checkupreservation/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
										});
					});
</script>
<body>
	<form role="form" method="post">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<div>
		검사예약ID	<input type="text" name="creid" value="${checkUpReservationVO.creid}" readonly="readonly">		
		</div>
		<div>
			검사 날짜<input type="date" name="credate" value="${checkUpReservationVO.credate}">
		</div>
		<div>
			환자ID<input type="text" name="uid" id="uid" value="${checkUpReservationVO.uid}">
			<button onclick="searchuid()">찾기</button>
		</div>
		<div>
			검사ID<input type="text" name="chid" id="chid" value="${checkUpReservationVO.chid}">
			<button onclick="searchCh()">찾기</button>
		</div>
		<div>
			검사실ID<input type="text" name="crid" id="crid" value="${checkUpReservationVO.crid}">
			<button onclick="searchchroom()">찾기</button>
		</div>

		<div>
			<button type="submit" id="modify">수정</button>
			<button type="submit" id="remove">취소</button>
		</div>
	</form>
</body>
</html>