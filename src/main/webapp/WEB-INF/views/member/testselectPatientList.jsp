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
	selectPatientList
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
</body>
</html>
