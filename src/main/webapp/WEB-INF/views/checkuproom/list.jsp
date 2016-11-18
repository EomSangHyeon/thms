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
				 		$(".remove").click(function(){
				 			    $.ajax({
				 			        dataType:'text',
				 			    	url: 'remove',
				 			        type:"post", 
				 		 	       data: {"crid": $("#crid").val()}	,
				 		 	       success : function(data){
				 		        	location.href="list";
				 		  	      }
				 		  	  })
						});
					});
</script>
<body>

	<div>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType==null?'selected':''}"/>>---</option>
			<option value="id"
				<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>검사실ID</option>
			<option value="na"
				<c:out value="${cri.searchType eq 'na'?'selected':''}"/>>검사ID</option>
				<option value="rm"
				<c:out value="${cri.searchType eq 'rm'?'selected':''}"/>>검사실</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${cri.keyword}" />
		<button id="searchBtn">Search</button>
		<button id="newBtn">Add</button>
	</div>


	<table>
		<th>검사실ID</th>
		<th>검사ID</th>
		<th>검사실번호</th>		
		<c:forEach items="${list}" var="CheckUpRoomVO">
			<tr>
				<td>${CheckUpRoomVO.crid}</td>
				<td>${CheckUpRoomVO.chid}</td>
			<td>${CheckUpRoomVO.crnumber}</td>
			<td><a href="modifyPage?crid=${CheckUpRoomVO.crid}"><button type="button" class="modify">수정</button></a></td>
				<td><button class="remove" >삭제</button></td>
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

</body>
</html>