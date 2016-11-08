<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
		  <ul class="nav nav-sidebar">
		    <li><a href="#">개인정보 수정 </a></li>
		    <li class="active"><a href="#">외래예약 확인</a></li>
		    <li><a href="#">검사예약 확인 </a></li>
		    <li><a href="#">입원정보 확인 </a></li>		    
		  </ul>		  
		</div>
		
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
	            <th>예약변경</th>	            
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>2016-12-24</td>
	            <td>소아과</td>
	            <td>김똘똘</td>
	            <td>102호</td>
	            <td><button type="button" class="btn btn-warning">변경</button></td>
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>소아과</td>
	            <td>김똘똘</td>
	            <td>102호</td>
	            <td><button type="button" class="btn btn-warning">변경</button></td>
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>소아과</td>
	            <td>김똘똘</td>
	            <td>102호</td>
	            <td><button type="button" class="btn btn-warning">변경</button></td>
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>소아과</td>
	            <td>김똘똘</td>
	            <td>102호</td>
	            <td><button type="button" class="btn btn-warning">변경</button></td>
	          </tr>
	          <tr>
	            <td>2016-12-24</td>
	            <td>소아과</td>
	            <td>김똘똘</td>
	            <td>102호</td>
	            <td><button type="button" class="btn btn-warning">변경</button></td>
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