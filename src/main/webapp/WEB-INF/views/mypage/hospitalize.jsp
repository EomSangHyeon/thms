<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<%@ include file="sidebar.jsp" %>
		
		<div class="col-sm-9 col-md-10 main">
	    <h2 class="sub-header">입원정보 확인</h2>
	    <div class="table-responsive">
	      <table class="table table-striped">
	        <thead>
	          <tr>
	            <th>입원일</th>
	            <th>진료과목</th>
	            <th>담당의사</th>
	            <th>병실</th>							
	          </tr>
	        </thead>
	        <tbody>
<c:forEach items="${hospitalizeList}" var="i">
	          <tr>
	            <td>${i.horegdate}</td>
	            <td>${i.sjname}</td>
	            <td>${i.dname}</td>
	            <td>${i.rmnumber}</td>	            
	          </tr>
</c:forEach>
	        </tbody>	        
	      </table>	      
	      <div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a href="hospitalize${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="hospitalize${pageMaker.makeQuery(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="hospitalize${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
	    </div>
	  </div>		
	</div>
</div>

<%@ include file="../include/footer.jsp" %>