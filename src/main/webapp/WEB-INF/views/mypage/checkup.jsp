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
	        <thead>
	          <tr>
	            <th>예약일</th>
	            <th>검사명</th>
	            <th>진료실</th>	            
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>2016-12-24</td>
	            <td>x-ray</td>
	            <td>102호</td>	            
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>CT</td>
	            <td>102호</td>	            
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>피검사</td>
	            <td>102호</td>
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>대장 내시경</td>
	            <td>102호</td>
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>MRI</td>
	            <td>102호</td>
	          </tr>
	        </tbody>	        
	      </table>	      
	      <div class="col-sm-9 col-md-10 main" style="display: inline-block;text-align: center;">
		      <ul class="pagination">
		      	<li><a href="#"><<</a></li>
		      	<li class="active"><a href="#">1</a></li>
					  <li><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					  <li><a href="#">>></a></li>
		      </ul>
	      </div>
	    </div>
	  </div>		
	</div>
</div>

<%@ include file="../include/footer.jsp" %>