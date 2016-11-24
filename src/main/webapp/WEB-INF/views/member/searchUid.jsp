<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" session="true"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function sendUid(comeon) {
	
		opener.setUid(comeon);

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
				<h2>입원자 선택</h2>
			</div>
			
			<div class="box box-body" >

			<form action="searchUid" method="POST">

				<div class="form-group">
					<select class="form-control" name="searchType">
							<option value="uid">아이디</option>
							<option value="uname">이름</option>
							<option value="uemail">이메일</option>
							<option value="unick">닉네임</option>
					</select>
					<div class="input-group">
						<input class="form-control" type="text" name="keyword">
						<span class="input-group-btn"><input class="btn btn-primary" type="submit"></span>
					</div>
				</div>
		
			</form>

			<table class="table table-striped">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>성별</th>
					<th>닉네임</th>
					<th>생년월일</th>
				</tr>
				<c:forEach items="${searchmember}" var="search">			
				
				<tr class="linked" onclick="javascript:sendUid('${search.uid}')">
					<td>${search.uid}</td>
					<td>${search.uname}</td>
					<td>${search.uemail}</td>
					<td>${search.ugender}</td>
					<td>${search.unick}</td>
					<td>${search.ubirth}</td>
				</tr>
				
				</c:forEach>
			</table>
		
		
			<div class="text-center">
				<ul class="pagination">
		
					<c:if test="${pageMaker.prev}">
						<li><a
							href="searchUid?page=${pageMaker.startPage -1 }&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&laquo;</a></li>
					</c:if>
		
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
		
						<li <c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
							<a
							href="searchUid?page=${idx}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">${idx }</a>
						</li>
		
					</c:forEach>
		
					<c:if test="${pageMaker.next && pageMaker.endPage>0}">
						<li><a
							href="searchUid?page=${pageMaker.endPage+1}&keyword=${pageMaker.cri.keyword}&searchType=${pageMaker.cri.searchType}">&raquo;</a></li>
					</c:if>
		
				</ul>
			</div>

			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
