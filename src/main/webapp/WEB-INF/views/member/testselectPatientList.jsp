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
<script type="text/javascript">
	var comeon;

	function deleteAjax(here) {
		$.ajax({
			url : 'deleteAjax.do',
			type : 'post',
			dataType : 'text',
			data : {
				hoid : here
			},
			success : function() {
				alert("삭제하였습니다")
				location.href = 'testselectPatientList'
			}
		})

	}

	//환자 입실이미 되어있나 없나 확인후에 환자 

	function goRoom(comeon) {
		window.open("confirmRoom?hoid=" + comeon, "",
				"width=600, height=500, left=600");

	}

	function leaveRoom() {
		alert("ss");

	}
</script>


</head>
<body>
	selectPatientList
	<input type="button" value="환자병실확인"
		onclick="self.location='/room/list';" />
	<input type="button" value="환자 추가"
		onclick="self.location='/member/testJoinPatient';" />

	<br>
	<table>
		<tr>
			<td>환자아이디</td>
			<td>환자 유저아이디</td>
			<td>입실일</td>
			<td>방번호</td>
			<td>의사아이디</td>
		</tr>
		<c:forEach items="${list }" var="patient">
			<tr>
				<td>${patient.hoid }</td>
				<td>${patient.uid }</td>
				<td>${patient.horegdate }</td>
				<td>${patient.rmid }</td>
				<td>${patient.did }</td>
				<td><input type="button" value="입실" id="enterRoom"
					onclick="goRoom(' ${patient.hoid}')"></td>
				<td><input type="button" value="퇴실" id="checkOut"
					onclick="leaveRoom()"></td>
				<td><input type="button" value=" 삭제"
					onclick="deleteAjax('${patient.hoid }')"></td>
			</tr>

		</c:forEach>
	</table>

	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="testselectPatientList?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">

				<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
					<a
					href="testselectPatientList?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage>0}">
				<li><a
					href="testselectPatientList?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<form action="testselectPatientList">
		<table>
			<tr>
				<td>검색유형</td>
				<td><select name="searchType">
						<option value="hoid">환자 아이디</option>
						<option value="uid">유저 아아디</option>
						<option value="rmid">방번호</option>
						<option value="did">담당 의사</option>
				</select></td>
				<td>검색어</td>
				<td><input type="text" name="keyword" required="required"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>
</body>
</html>
