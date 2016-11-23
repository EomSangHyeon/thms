<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<div class="container-fluid">
	<div class="row">		
		<div class="col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>검사 선택</h2>
			</div>
			
			<div class="box box-body" >
			
				<form>
					<div>
						<select class="form-control" name="searchType">
							<option value="n"
								<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
							<option value="id"
								<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>번호</option>
							<option value="na"
								<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>부서</option>
						</select> 
						<div class="input-group">
							<input class="form-control" type="text" name="keyword" id="keywordInput"
							value="${cri.keyword}" />
							<span class="input-group-btn"><button class="btn btn-primary" id="searchBtn">Search</button></span>
						</div>
					</div>
				</form>
				
				<table class="table table-striped">
					<tr>
						<th>검사ID</th>
						<th>검사내용</th>
					</tr>
					<c:forEach items="${listView}" var="CheckUpVO">
						<tr>
							<td>${CheckUpVO.chid }</td>
							<%-- <td>${SubjectVO.sjname }</td> --%>
							<td><a href="javascript:sendID('${CheckUpVO.chid }')">${CheckUpVO.chname }</a></td>
						</tr>
					</c:forEach>
			
				</table>
			
				<div class="text-center">
					<ul class="pagination">
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

			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->