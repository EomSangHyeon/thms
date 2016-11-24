<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="container-fluid">
	<div class="row">
		<%@ include file="sidebar.jsp"%>
		${uid}
		<div class="col-sm-9 col-md-10 main">
			<h2 class="sub-header">검사예약 확인</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<tr>
						<th>예약일</th>
						<th>검사명</th>
						<th>진료실</th>
					</tr>
					<c:forEach items="${checkup}" var="CheckUpReservationViewVO">
						<tr>
							<td>${CheckUpReservationViewVO.v_credate}</td>
							<td>${CheckUpReservationViewVO.v_chname}</td>
							<td>${CheckUpReservationViewVO.cr_number}</td>
						</tr>

					</c:forEach>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="checkup${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="checkup${pageMaker.makeQuery(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="checkup${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>