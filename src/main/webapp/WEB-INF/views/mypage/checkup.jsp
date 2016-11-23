<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<%@ include file="sidebar.jsp" %>
		
		<div class="col-sm-9 col-md-10 main">
	    <h2 class="sub-header">검사예약 확인</h2>
	    <div class="table-responsive">
	      <table class="table table-striped">	        
	          <tr>
	            <th>예약일</th>
	            <th>검사명</th>
	            <th>진료실</th>	            
	          </tr>
	      </table>	      
	      
	    </div>
	  </div>		
	</div>
</div>

<%@ include file="../include/footer.jsp" %>