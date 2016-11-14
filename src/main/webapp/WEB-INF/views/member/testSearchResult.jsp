<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	search
	<br>

	<table>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>성별</td>
			<td>닉네임</td>
			<td>생일</td>
			<td>상태</td>
		</tr>
		<c:forEach items="${searchmember}" var="search">
			<tr>
				<td><a
					href="/member/testMemberModify?uid=${search.uid }&ustatus=${search.ustatus}">${search.uid}</a></td>
				<td>${search.uname}</td>
				<td>${search.uemail}</td>
				<td>${search.ugender}</td>
				<td>${search.unick}</td>
				<td>${search.ubirth}</td>
				<td>${search.ustatus}</td>

			</tr>
		</c:forEach>
	</table>


	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="testSearchResult?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">

				<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
					<a
					href="testSearchResult?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
				</li>

			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage>0}">
				<li><a
					href="testSearchResult?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
			</c:if>

		</ul>
	</div>

</body>
</html>
