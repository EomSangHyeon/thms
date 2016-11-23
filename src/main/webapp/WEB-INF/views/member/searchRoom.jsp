<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function sendRoom(comeon) {

		opener.setRmid(comeon);
		window.close();
	}
</script>
</head>
<body>

	<br>
	<form action="searchRoom" method="POST">
		<label>검색유형 <select name="searchType">
				<option value="rmid">방아이디</option>
				<option value="rmnumber">방번호</option>
		</select> 검색어 <input type="text" name="keyword">
		</label> <label><input type="submit"></label>
	</form>
	<br>


	<label>방아이디</label>
	<label>방위치</label>
	<label>현인원</label>
	<label>방최고인원</label>

	<br>

	<c:forEach items="${searchmember}" var="search">

		<a href="javascript:sendRoom('${search.rmid}')"><label>${search.rmid}</label>
			<label>${search.rmnumber}</label> <label>${search.rmcurrentcount}</label>
			<label>${search.rmheadcount}</label></a>

		<br>
	</c:forEach>



	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="searchRoom?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">

				<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
					<a
					href="searchRoom?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
				</li>

			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage>0}">
				<li><a
					href="searchRoom?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
			</c:if>

		</ul>
	</div>

</body>
</html>