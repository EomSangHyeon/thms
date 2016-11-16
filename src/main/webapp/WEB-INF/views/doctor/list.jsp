<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchBtn").click(function() {
			self.location = "list${pageMaker.makeQuery(1)}&searchType="
			+ $("select option:selected").val()
			+ "&keyword="
			+ $("#keywordInput").val();
			});

			$("#newBtn").click(function() {
				self.location = "register";
			});
 		});
</script>
<body>

	<form>
		<div>
			<select name="searchType">
				<option value="n"
					<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
				<option value="id"
					<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>번호</option>
				<option value="na"
					<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>이름</option>
			</select> <input type="text" name="keyword" id="keywordInput"
				value="${cri.keyword}" />
			<button id="searchBtn">Search</button>
			<button id="newBtn">Add</button>
		</div>


		<table>
			<th>번호</th>
			<th>이름</th>
			<th>병실</th>
			<th>부서ID</th>
			<c:forEach items="${list}" var="DoctorVO">
				<tr>
					<td>${DoctorVO.did}</td>
					<td><a
						href='/doctor/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&did=${DoctorVO.did}'>${DoctorVO.dname}</a></td>
					<td>${DoctorVO.dclinic}</td>
					<td>${DoctorVO.sjid}</td>
				</tr>
			</c:forEach>

		</table>
		<div>
			<div>
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>