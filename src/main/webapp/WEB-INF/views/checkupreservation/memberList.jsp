<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function sendmemID(id) {
		opener.setmemID(id);
		window.close();
	}

	$(document)
	.ready(
			function() {
				$("#searchBtn")
						.click(
								function() {
									self.location = "memberList${pageMaker.makeQuery(1)}&searchType="
											+ $(
													"select option:selected")
													.val()
											+ "&keyword="
											+ $("#keywordInput").val();
								});
			});
</script>
</head>
<body>
	<div>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
			<option value="id"
				<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>아이디</option>
			<option value="na"
				<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>이름</option>
			<option value="bir"
				<c:out value="${cri.searchType eq 'bir'?'selected':''}"/>>생일</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${cri.keyword}" />
		<button id="searchBtn">Search</button>
	</div>

	<table>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>생일</th>

		<c:forEach items="${memberList}" var="MemberVO">
			<tr>
				<td><a href="javascript:sendmemID('${MemberVO.uid }')">${MemberVO.uid }</a></td>
				<td>${MemberVO.uname }</td>
				<td>${MemberVO.ugender }</td>
				<td>${MemberVO.ubirth }</td>
			</tr>
		</c:forEach>

	</table>
	
	<div>
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a
						href="memberList${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="memberList${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="memberList${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	
</body>
</html>