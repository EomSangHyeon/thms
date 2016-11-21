<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			검사ID<input type="text" name="chid" id="chid">
			<button onclick="searchCh()">찾기</button>
		</div>
		<div>
			검사실ID<input type="text" name="crid" id="crid">
			<button onclick="searchchroom()">찾기</button>
		</div>
		<div>
			<button type="submit">입력</button>
		</div>
	</form>
</body>
</html>