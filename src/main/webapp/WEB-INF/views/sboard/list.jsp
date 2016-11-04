<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
var msg = "${msg}";

if(msg != "")
	alert(msg);

$(document).ready(function() {
	$("#searchBtn").click(function() {
		self.location = "list${pageMaker.makeQuery(1)}&searchType="+ $("select option:selected").val() +"&keyword="+ $("#keywordInput").val();
	});

	$("#newBtn").click(function() {
		self.location = "register";
	});
});
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-body">
					<select name="searchType">
						<option value="n" <c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
						<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>Title</option>
						<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>Content</option>
						<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>Writer</option>
						<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>Title OR Content</option>
						<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>Content OR Writer</option>
						<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>Title OR Content OR Writer</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
					<button id="searchBtn">Search</button>
					<button id="newBtn">Add</button>
				</div>
			</div>

			<div class="box">
				<div class="box-header width-border">
					<h3 class="box-title">목록</h3>
				</div>

				<div class="box-body">
					<table class="table table-bordered">
						<colgroup>
							<col style="width:60px;"/>
							<col/>
							<col style="width:120px;"/>
							<col style="width:60px;"/>
							<col style="width:150px;"/>
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성자</th>
								<th class="text-center">조회수</th>
								<th class="text-center">작성일</th>
							</tr>
						</thead>
						<tbody>
<c:forEach items="${list}" var="row">
							<tr>
								<td class="text-center">${row.bno}</td>
								<td><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${row.bno}">${row.title}<strong>[ ${row.replycnt} ]</strong></a></td>
								<td class="text-center">${row.writer}</td>
								<td class="text-center"><span class="badge bg-red">${row.viewcnt}</span></td>
								<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${row.regdate}"/></td>
							</tr>
</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
</c:if>

<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
</c:forEach>

<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>