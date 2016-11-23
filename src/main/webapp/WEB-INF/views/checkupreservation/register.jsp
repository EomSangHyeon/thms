<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
	/* function searchCh() {
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
	} */
</script>

<body>
	<form method="post">
		<div>
			검사 날짜<input type="date" name="credate">
		</div>
		<div>
			환자ID<input type="text" name="uid" id="uid">
			<button onclick="searchuid()">찾기</button>
		</div>
		<div>
			검사ID <select name="chid" id="chid">
				<option value="">----</option>
				<c:forEach items="${test}" var="CheckUpVO">
					<option value="${CheckUpVO.chid}">${CheckUpVO.chname}</option>
				</c:forEach>

			</select>
		</div>
		<div>
			검사실ID <select name="crid" id="crid">
				<option value="">----</option>
			</select>
			<div>
				<button type="submit">입력</button>
			</div>
	</form>
</body>
</html>