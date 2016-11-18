<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function sendID(id) {
			opener.setID(id);
			window.close();
		}
		$(document)
				.ready(
						function() {
							$("#searchBtn")
									.click(
											function() {
												self.location = "listView${pageMaker.makeQuery(1)}&searchType="
														+ $(
																"select option:selected")
																.val()
														+ "&keyword="
														+ $("#keywordInput")
																.val();
											});
						});
	</script>
	<form>
		<div>
			<select name="searchType">
				<option value="n"
					<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
				<option value="id"
					<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>번호</option>
				<option value="na"
					<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>부서</option>
			</select> <input type="text" name="keyword" id="keywordInput"
				value="${cri.keyword}" />
			<button id="searchBtn">Search</button>
		</div>
	</form>
	<table>
		<th>검사ID</th>
		<th>검사내용</th>

		<c:forEach items="${listView}" var="CheckUpVO">
			<tr>
				<td>${CheckUpVO.chid }</td>
				<%-- <td>${SubjectVO.sjname }</td> --%>
				<td><a href="javascript:sendID('${CheckUpVO.chid }')">${CheckUpVO.chname }</a></td>
			</tr>
		</c:forEach>

	</table>

	<div>
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a
						href="listView${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="listView${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="listView${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>


</body>
</html>