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
	function deleteUser(haha) {
		alert(haha);
		$.ajax({
			type : 'post',
			dataType : 'text',
			url : 'deleteUserAjax',
			data : {
				uid :haha
			},
			success : function() {
			
				alert("삭제되었습니다");
			location.href = "testSearchResult"; 
			}

		})
	}
</script>
</head>
<body>
	search


	<br>
	<form action="testSearchResult" method="POST">
		<table>
			<tr>
				<td>검색유형</td>
				<td><select name="searchType">
						<option value="uid">아이디</option>
						<option value="uname">이름</option>
						<option value="uemail">이메일</option>
						<option value="unick">닉네임</option>
						<option value="ustatus">권한</option>
				</select></td>
			</tr>
			<tr>
				<td>검색어</td>
				<td><input type="text" name="keyword"></td>
			</tr>
			<tr>
				<td><input type="submit" name="ketword"></td>
			</tr>
		</table>
	</form>

	<table>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>성별</td>
			<td>닉네임</td>
			<td>생일</td>
			<c:if test="${check =='master' }">
				<td>상태</td>
			</c:if>
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
				<c:if test="${check =='master' }">
					<td>${search.ustatus}</td>
				</c:if>
				<td><input type="button" id="deleteuser" value="삭제"
					onclick="deleteUser('${search.uid }')"></td>
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