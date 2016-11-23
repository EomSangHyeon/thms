<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<c:if test="${login.ustatus == 'admin' || login.ustatus == 'hospital' || login.ustatus == 'master'}">
<%@ include file="../admin/admin_sidebar.jsp"%>
</c:if>
<c:if test="${login.ustatus == 'customer'}">
<%@ include file="../mypage/sidebar.jsp"%>
</c:if>
	pw
	<br> 
	<form action="checkPw.do" >
		<table>
			<tr>
				<td><input type="hidden" name="uid" id="uid"></td>
				<td>비밀번호 확인 :</td>
				<td><input type="password" name="pw" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form>

<%@ include file="../include/footer.jsp"%>