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
		function searchUidForPatient() {
			$.ajax({
				type : 'post',
				url : 'ajaxForPatientUid',
				dataType : 'text',
				data : {
					uid : $("#uid").val()
				},

				success : function(data) {
					alert(data);
					alert("test"+"test1");
					var list = new Array(data);
				/* 	var list = new Array("test", "test1"); */

					

					for (var idx = 0; idx < list.length; idx++) {
						$("#forPatientUid").append(
								"<option value='"+list[idx]+"'>" + list[idx]
										+ "</option>");
					}
				}

			})

		}
		/* 
		$("#forPatientUid").html(
				'<b style="font-size:18px;color:red">' + data
						+ '</b>'

		) */
		//'<b style="font-size:18px;color:blue">' + data + '</b>'
	</script>

	<!--  사용자 uid 검색 가능하게  ajax로
입원일은 그냥 입력
병실 빈병실 검색하게 해서 나오게하기 ajax
의사 이름으로 검색 하게하기 ajax
-->

	<label>사용자 아이디 검색</label>
	<div>
		<input type="text" id="uid" name="uid"
			onchange="searchUidForPatient()">
	</div>
	<div id="forPatientUid"></div>

	<label> 입원일 입력</label>
	<div>
		<input type="text" id="horegdate" name="horegdate">
	</div>


	<label> 빈 병실 검색</label>
	<div>
		<input type="text" id="rmid" name="rmid">
	</div>

	<label> 의사 이름 검색</label>
	<div>
		<input type="text" id="did" name="did">
	</div>




</body>
</html>
