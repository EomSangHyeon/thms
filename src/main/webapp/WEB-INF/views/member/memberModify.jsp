<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html; charset=UTF-8" session="true"%>

<%@ include file="../include/header.jsp"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<c:if test="${login.ustatus == 'admin' || login.ustatus == 'hospital' || login.ustatus == 'master'}">
<%@ include file="../admin/admin_sidebar.jsp"%>
</c:if>
<c:if test="${login.ustatus == 'customer'}">
<%@ include file="../mypage/sidebar.jsp"%>
</c:if>


	<form action="memberModify.do" method="POST">

		<c:forEach items="${searchmember}" var="search">

			<label>아이디</label>
			<input type="text" name="uid" value='${search.uid}'
				required="required" readonly />
			<label>비밀번호</label>
			<input type="password" name="upw" value='${search.upw}' required="required">

			<label>이름</label>
			<input type="text" name="uname" value="${search.uname}"
				required="required">

			<label> 닉네임</label>
			<input type="text" name="unick" value="${search.unick}"
				required="required" readonly />

			<label>성별</label>
			<select name="ugender">
				<option name="man">man</option>
				<option name="woman">woman</option>
			</select>

			<label> 이메일</label>
			<input type="text" name="uemail" value="${search.uemail}"
				required="required" readonly />
			<label> 생년월일</label>
			<input type="text" name="ubirth" value="${search.ubirth}"
				required="required">
		</c:forEach>
		<input type="submit">

	</form>
	
<%@ include file="../include/footer.jsp"%>
