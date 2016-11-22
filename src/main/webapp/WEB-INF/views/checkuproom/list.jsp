<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
							self.location="modifyPage${pageMaker.makeSearch(pageMaker.cri.page)}&crid="+$("#crid").val();
						}); */
				 		$("#remove").click(function(){
				 			    $.ajax({
				 			        dataType:'text',
				 			    	url: 'remove',
				 			        type:"post", 
				 		 	       data: {"crid": $("#remove").val()}	,
				 		 	       success : function(data){
				 		        	location.href="list";
				 		  	      }
				 		  	  })
						});
					});
</script>

<%@ include file="../admin/admin_sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class = "col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>검사실 관리</h2>
			</div>
			
			<div class = "box box-body">
			
				<h3>검사실 검색</h3>

				<div class="form-group">					
					<div class="col-sm-6">
						<div class="form-inline">
							<select class="form-control" name="searchType">
								<option value="n"
									<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
								<option value="id"
									<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>검사실ID</option>
								<option value="na"
									<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>검사ID</option>
									<option value="rm"
									<c:out value="${cri.searchType eq 'rm'?'selected':''}"/>>검사실</option>
							</select> 
							<input class="form-control" type="text" name="keyword" id="keywordInput"
								value="${cri.keyword}" />
							<button id="searchBtn" class="btn btn-warning">검색</button>
							<button id="newBtn" class="btn btn-primary">검사실 입력</button>
						</div>
					</div>
				</div>			
			
				<table class="table table-striped">
					<tr>
						<th>검사실ID</th>
						<th>검사ID</th>
						<th>검사실번호</th>
						<th>수정 / 삭제</th>
					</tr>		
					<c:forEach items="${list}" var="CheckUpRoomVO">
						<tr>
							<td>${CheckUpRoomVO.crid}</td>
							<td>${CheckUpRoomVO.chid}</td>
							<td>${CheckUpRoomVO.crnumber}</td>
							<td>
								<a href="modifyPage?crid=${CheckUpRoomVO.crid}"><button type="button" class="btn btn-warning">수정</button></a>
							<button id="remove"  value="${CheckUpRoomVO.crid}" class="btn btn-danger">삭제</button>
							</td>
						</tr>
					</c:forEach>
			
				</table>
				
				<div class="text-center">
					<ul class="pagination">
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
				
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>
