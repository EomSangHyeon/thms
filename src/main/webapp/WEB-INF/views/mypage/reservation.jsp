<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$(".btn-danger").on("click", function() {
		if(confirm("정말 삭제하시겠습니까?")) {
			var thisRid = $(this).attr("id");
			$.post("/mypage/reservation", {
				rid: thisRid
			}, function(data) {
				if(data == "success") {
					alert("외례예약이 삭제되었습니다.");
					$("#"+ thisRid).parent("td").parent("tr").remove();
				}
			});
		}
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<%@ include file="sidebar.jsp" %>

		<div class="col-sm-9 col-md-10 main">
	    	<h2 class="sub-header">외래예약 확인</h2>
	    	<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>예약일</th>
							<th>진료과목</th>
							<th>담당의사</th>
							<th>진료실</th>
							<!-- <th>예약변경</th> -->
							<th>예약삭제</th>           
						</tr>
					</thead>
					<tbody>
<c:forEach items="${reservationList}" var="i">
						<tr>
							<td>${i.rdate}</td>
							<td>${i.sjname}</td>
							<td>${i.dname}</td>
							<td>${i.dclinic}</td>
							<!-- <td><button type="button" class="btn btn-warning">변경</button></td> -->
							<td><button type="button" id="${i.rid}" class="btn btn-danger">삭제</button></td>
						</tr>
</c:forEach>
					</tbody>	        
				</table>

				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a href="reservation${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="reservation${pageMaker.makeQuery(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="reservation${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>		
	</div>
</div>

<%@ include file="../include/footer.jsp" %>