<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

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
				uid : haha
			},
			success : function() {

				alert("삭제되었습니다");
				location.href = "testSearchResult";
			}

		})
	}
</script>

<<<<<<< HEAD
<%@ include file="../admin/admin_sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-md-10 main">
		
			<div class="box box-header">
				<h2>회원 관리</h2>
			</div>
			
			<div class="box box-body">
			
				<h3>회원 검색</h3>
				
				<div class="form-group">					
					<div class="col-sm-10">
						<div class="form-inline">
							<div class="form-group">
								<form action="testSearchResult" method="POST">
									<select class="form-control" name="searchType">
										<option value="uid">아이디</option>
										<option value="uname">이름</option>
										<option value="uemail">이메일</option>
										<option value="unick">닉네임</option>
										<option value="ustatus">권한</option>
									</select>
									<input class="form-control" type="text" name="keyword">
									<input class="btn btn-warning" type="submit" name="ketword" value="검색"></form>
							</div>	
						</div>
					</div>
				</div>
						
				<table class="table table-striped">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>성별</th>
						<th>닉네임</th>
						<th>생일</th>
						<c:if test="${check.ustatus =='master' || check.ustatus =='admin' }">
							<th>상태</th>
						</c:if>
						<th>삭제</th>
					</tr>
					<c:forEach items="${searchmember}" var="search">
						<tr>
							<td>
								<a href="/member/testMemberModify?uid=${search.uid }&ustatus=${search.ustatus}">${search.uid}</a>
							</td>
							<td>${search.uname}</td>
							<td>${search.uemail}</td>
							<td>${search.ugender}</td>
							<td>${search.unick}</td>
							<td>${search.ubirth}</td>
							<c:if test="${check.ustatus =='master' || check.ustatus =='admin' }">
								<td>${search.ustatus}</td>
							</c:if>
							<td>
								<input class="btn btn-danger" type="button" id="deleteuser" value="삭제"	onclick="deleteUser('${search.uid }')">
							</td>
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
			</div><!-- box-body -->
			
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>