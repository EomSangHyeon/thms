<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-fluid">
<c:if test="${login.ustatus == 'admin'}">
	<h3>페이지 관리자</h3>
</c:if>
<c:if test="${login.ustatus == 'hospital'}">
	<h3>병원 관리자</h3>
</c:if>
<c:if test="${login.ustatus == 'master'}">
	<h3>전체 관리자</h3>
</c:if>
</div>
<hr style="border:none; border:2px solid darkgray;">
<div class="col-sm-3 col-md-2 sidebar">
  <ul class="nav nav-sidebar">
<c:if test="${login.ustatus == 'customer'}">
  	<li>관리자 전용 페이지</li>
</c:if>
<c:if test="${login.ustatus == 'admin' || login.ustatus == 'hospital' || login.ustatus == 'master'}">
  	<li><a href="/member/checkPw">개인정보 수정 </a></li>
</c:if>
<c:if test="${login.ustatus == 'admin' || login.ustatus == 'master'}">
 		<h3> 회원 관리</h3>
		<li><a href="/member/testSearchResult">회원관리 </a></li>  
</c:if>
		
<c:if test="${login.ustatus == 'hospital' || login.ustatus == 'master'}">
		<h3> 병원 관리</h3>
		<li><a href="/subject/list">진료과 목록 관리</a></li>	      
   	<li><a href="/doctor/list">의료진 목록 관리</a></li>
   	<li><a href="/schedule/calendar">의료진 일정 관리</a></li>
   	<li><a href="/checkup/list">검사목록 관리</a></li>
   	<li><a href="/checkuproom/list">검사실 관리</a></li>
   	<li><a href="/room/list">병실목록 관리</a></li>
   	<li><a href="/member/testselectPatientList">입원자 관리</a></li>
   	<h3> 예약 관리</h3>
   	<li><a href="#">외래예약 관리</a></li>
   	<li><a href="/checkupreservation/list">검사예약 관리</a></li>   	
</c:if>
    
  </ul>		  
</div>

