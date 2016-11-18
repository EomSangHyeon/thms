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
<script>
	// 들어갈 수 있는 방 목록만 가져오기 ajax??  !!!

	// ajax로 방 입력했을때 가능한지 안가능한지 확인
	function restRoom() {
		$.ajax({
			type : 'post',
			url : 'restRoomAjax',
			dataType : 'text',
			data : {
				rmid : $('#rmid').val()
			},
			success : function(data) {
				alert(data);
				$("#spanForRmid")
						.html(
								'<b style="font-size:18px;color:blue">' + data
										+ '</b>')

			}
		})
	}

	//ajax 방 확정하고 닫음
	function exit() {
		$.ajax({
			type : 'post',
			url : 'updateConfirmRoom.do',
			data : {
				hoid : $("#hoid").val(),
				uid : $("#uid").val(),
				horegdate : $("#horegdate").val(),
				rmid : $("#rmid").val(),
				did : $("#did").val(),
			},
			success : function(data) {
				opener.location.reload(); //부모페이지 refresh
				window.close();

			}
		})

	}
</script>

</head>
<body>
	<form action="updateConfirmRoom.do" method="POST">
		<table>
			<c:forEach items="${here }" var="hh">
				<tr>
					<td>환자번호</td>
					<td><input type="text" id="hoid" name="hoid"
						value=${hh.hoid
						} readonly /></td>
				</tr>
				<tr>
					<td>유저아이디</td>
					<td><input type="text" id="uid" name="uid" value=${hh.uid} ></td>
				</tr>
				<tr>
					<td>입실날자</td>
					<td><input type="text" id="horegdate" name="horegdate"
						value=${hh.horegdate}></td>
				</tr>
				<tr>
					<td>방아이디</td>
					<td><input type="text" id="rmid" name="rmid" value=${hh.rmid }
						onchange="restRoom()""></td>
					<td><span id="spanForRmid"></span></td>
				</tr>
				<tr>
					<td>의사아이디</td>
					<td><input type="text" id="did" name="did" value=${hh.did}></td>
				</tr>
			</c:forEach>
			<tr>
				<td><input type=button onclick="exit()" value="확정"></td>
			</tr>
		</table>
	</form>

</body>
</html>
