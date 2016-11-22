<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		function searchUid() {
			var comeon = $("#uid").val();
			alert(comeon);
			window.open("searchUid?uid=" + comeon, "",
					"width=600, height=500, left=600");

		}

		function restRoom() {
			$.ajax({
				type : 'post',
				dataType : 'text',
				url : "restRoomAjax",
				data : {
					rmid : $("#rmid").val()
				},
				success : function(data) {
					$("#searchRmid").html(
							'<b style="font-size:18px;color:blue">' + data
									+ '</b>')
				}

			})
		}
	</script>

	<!--  사용자 uid 검색 가능하게  ajax로
입원일은 그냥 입력
병실 빈병실 검색하게 해서 나오게하기 ajax
의사 이름으로 검색 하게하기 ajax
-->
	<form action="joinForPatient.do" method="post">
		<label>사용자 아이디 검색</label>
		<div>
			<input type="text" id="uid" name="uid"> <input type="button"
				id="btn" name="btn" onclick="searchUid()" value="검색">

		</div>
		<div id="forPatientUid"></div>

		<label> 입원일 입력</label>
		<div>
			<input type="text" id="horegdate" name="horegdate">
		</div>


		<label> 빈 병실 검색</label>
		<div>
			<input type="text" id="rmid" name="rmid" onchange="restRoom()">
		</div>
		<div id="searchRmid"></div>
		<label> 담당의사 번호</label>
		<div>
			<input type="text" id="did" name="did"
				onchange="searchDidForPatient()">
		</div>
		<div id="forPatientDid"></div>
		<input type="submit">
	</form>

</body>
</html>
