<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function sendmemID(id) {
		opener.setmemID(id);
		window.close();
	}

	$(document)
	.ready(function(){
		$("#searchBtn").click(function() {
				self.location = "memberList${pageMaker.makeQuery(1)}&searchType="
											+ $(
													"select option:selected")
													.val()
											+ "&keyword="
											+ $("#keywordInput").val();
								});
			});
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
				<h2>환자 선택</h2>
			</div>
			
			<div class="box box-body" >
				
				<div class="form-group">
					<select class="form-control" name="searchType">
						<option value="n"
							<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
						<option value="id"
							<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>아이디</option>
						<option value="na"
							<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>이름</option>
						<option value="bir"
							<c:out value="${cri.searchType eq 'bir'?'selected':''}"/>>생일</option>
					</select>
					<div class="input-group">
						<input class="form-control" type="text" name="keyword" id="keywordInput" value="${cri.keyword}" />
						<span class="input-group-btn"><button class="btn btn-primary" id="searchBtn">Search</button></span>
					</div>
				</div>
			
				<table class="table table-striped">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
					</tr>
			
					<c:forEach items="${memberList}" var="MemberVO">
						<tr class="linked" onclick="javascript:sendmemID('${MemberVO.uid }')">
							<td>${MemberVO.uid }</td>
							<td>${MemberVO.uname }</td>
							<td>${MemberVO.ugender }</td>
							<td>${MemberVO.ubirth }</td>
						</tr>
					</c:forEach>
			
				</table>
				
				<div class="text-center">
					<ul class="pagination">
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
				
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->