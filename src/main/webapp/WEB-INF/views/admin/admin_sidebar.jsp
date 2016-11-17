<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:if test="${login.ustatus == 'admin'}">
	<h2 class="main-header"> 페이지 관리자</h2>
</c:if>
<c:if test="${login.ustatus == 'hospital'}">
	<h2 class="main-header"> 병원 관리자</h2>
</c:if>
<c:if test="${login.ustatus == 'master'}">
	<h2 class="main-header"> 전체 관리자</h2>
</c:if>
<hr style="border:none; border:2px solid darkgray;">
<div class="col-sm-3 col-md-2 sidebar">
  <ul class="nav nav-sidebar">
  	<li><a href="/admin/edit">개인정보 수정 </a></li>
  	<c:if test="${login.ustatus == 'admin' || login.ustatus == 'master'}">
  		<h3 class="main-header"> 회원 관리</h3>
			<li><a href="#">회원정보 수정 </a></li>  
		</c:if>
		
		<c:if test="${login.ustatus == 'hospital' || login.ustatus == 'master'}">
			<h3 class="main-header"> 병원 관리</h3>	      
    	<li><a href="/doctor/listPage">의사정보 확인</a></li>
    	<li><a href="/schedule/before">의료진 일정 관리</a></li>
		</c:if>
    
  </ul>		  
</div>

