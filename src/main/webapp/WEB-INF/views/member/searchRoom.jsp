<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function sendRoom(comeon) {

		opener.setRmid(comeon);
		window.close();
	}
</script>
<style>
.linked {
	color: #045FB4;
}
.linked:hover {
	text-decoration: underline;
	cursor: pointer;
	color: black;
}
</style>

<div class="container-fluid">
	<div class="row">		
		<div class="col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>병실 선택</h2>
			</div>
			
			<div class="box box-body" >
			
				<form action="searchRoom" method="POST">
					<div class="form-group">
						<select class="form-control" name="searchType">
							<option value="rmid">방아이디</option>
							<option value="rmnumber">방번호</option>
						</select>
						
						<div class="input-group">
							<input class="form-control" type="text" name="keyword">
							<span class="input-group-btn"><input class="btn btn-primary" type="submit"></span>
						</div>
					</div>
				</form>

			
				<table class="table table-striped">
					<tr>
						<th>방아이디</th>
						<th>방위치</th>
						<th>현인원</th>
						<th>방최고인원</th>
					</tr>
				
			
				<c:forEach items="${searchmember}" var="search">
					
					<tr class="linked" onclick="javascript:sendRoom('${search.rmid}')">
						<td>${search.rmid}</td>
						<td>${search.rmnumber}</td>
						<td>${search.rmcurrentcount}</td>
						<td>${search.rmheadcount}</td>
					</tr>
					
				</c:forEach>
				</table>
			
			
				<div class="text-center">
					<ul class="pagination">
			
						<c:if test="${pageMaker.prev}">
							<li><a
								href="searchRoom?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
						</c:if>
			
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
			
							<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
								<a
								href="searchRoom?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
							</li>
			
						</c:forEach>
			
						<c:if test="${pageMaker.next && pageMaker.endPage>0}">
							<li><a
								href="searchRoom?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
						</c:if>
			
					</ul>
				</div>

			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->

