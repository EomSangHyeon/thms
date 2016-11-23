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
	function sendUid(comeon) {
	
		opener.setUid(comeon);
		alert(comeon);
		window.close();
		
	}
</script>
</head>
<body>

	<br>
	<form action="searchUid" method="POST">


		<label>검색유형 <select name="searchType">
				<option value="uid">아이디</option>
				<option value="uname">이름</option>
				<option value="uemail">이메일</option>
				<option value="unick">닉네임</option>
				<option value="ustatus">권한</option>
		</select> 검색어 <input type="text" name="keyword">
		</label> <label><input type="submit"></label>

		</table>

	</form>
	<br>


	<label>아이디</label>
	<label>이름</label>
	<label>이메일</label>
	<label>성별</label>
	<label>닉네임</label>
	<label>생일</label>
	<label>상태</label>
	<br>

	<c:forEach items="${searchmember}" var="search">

		<label><a href="javascript:sendUid('${search.uid}')">${search.uid}</a></label>
		<label>${search.uname}</label>
		<label>${search.uemail}</label>
		<label>${search.ugender}</label>
		<label>${search.unick}</label>
		<label>${search.ubirth}</label>
		<label>${search.ustatus}</label>

		<br>
	</c:forEach>



	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="searchUid?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">

				<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
					<a
					href="searchUid?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
				</li>

			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage>0}">
				<li><a
					href="searchUid?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
			</c:if>

		</ul>
	</div>

</body>
</html>