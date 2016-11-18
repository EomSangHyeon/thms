<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<!-- Main content -->
<div class="container-fluid">
	<div class="row">
		<%@ include file="../admin/admin_sidebar.jsp" %>
		<!-- left column -->
		<div class="col-sm-9 col-md-10 main">

			<form action="post">
				<input type="button" class="btn btn-primary" value="의사 정보 입력하기" onclick=" location='/doctor/register'"/>
				<hr>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>진료실</th>
							<th>부서ID</th>
							<th>정보수정<th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listPage}" var="DoctorVO">
							<tr>
								<td>${DoctorVO.did}</td>
								<td><a href="/doctor/readPage?did=${DoctorVO.did}">${DoctorVO.dname}</a></td>
								<td>${DoctorVO.dclinic}</td>
								<td>${DoctorVO.sjid}</td>
								<td><a href="/doctor/modifyPage?did=${DoctorVO.did}"><input class="btn btn-warning" type="button" value="수정"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="listPage?page=${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>
		
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="listPage?page=${idx}">${idx}</a>
								</li>
							</c:forEach>
		
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="listPage?page=${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</form>
			
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>