<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../include/header.jsp" %>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#searchBtn")
								.click(
										function() {
											self.location = "list${pageMaker.makeQuery(1)}&searchType="
													+ $(
															"select option:selected")
															.val()
													+ "&keyword="
													+ $("#keywordInput").val();
										});
						$("#newBtn").click(function() {
							self.location = "register";
						});
						/* 	$(".modify").click(function() {
								self.location="modifyPage${pageMaker.makeSearch(pageMaker.cri.page)}&rmid="+$("#rmid").val();
							}); */
						$(".remove").click(function() {
							$.ajax({
								dataType : 'text',
								url : 'remove',
								type : "post",
								data : {
									"rmid" : $("#rmid").val()
								},
								success : function(data) {
									location.href = "list";
								}
							})
						});
					});
</script>

<%@ include file="../admin/admin_sidebar.jsp" %>

	<div>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
			<option value="id"
				<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>번호</option>
			<option value="na"
				<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>방(호)</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${cri.keyword}" />
		<button id="searchBtn">Search</button>
		<button id="newBtn">Add</button>
	</div>
	<table>
		<th>방ID</th>
		<th>방번호</th>
		<th>현재입실인원</th>
		<th>입실최고인원</th>
		<th></th>
		<th></th>
		<c:forEach items="${list}" var="RoomVO">
			<tr>
				<td>${RoomVO.rmid}</td>
				<td>${RoomVO.rmnumber}</td>
				<td>${RoomVO.rmcurrentcount }</td>
				<td>${RoomVO.rmheadcount}</td>
				<td><a href="modifyPage?rmid=${RoomVO.rmid}"><button
							type="button" class="modify">수정</button></a></td>
				<td><button class="remove">삭제</button></td>
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

<%@ include file="../include/footer.jsp" %>