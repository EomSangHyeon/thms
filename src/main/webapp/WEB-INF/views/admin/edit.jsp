<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<div class="container-fluid" style="">
	<div class="row">
		<%@ include file="admin_sidebar.jsp" %>
		
		<div class="col-sm-9 col-md-10 main">
	    <h2 class="sub-header">개인정보 수정</h2>
	    <div class="form-group">
	    	<label for="upassword">비밀번호 확인</label>
	    	<input type="password" class="form-control" name="upassword" placeholder="비밀번호 확인" required="required"/>
    	</div>
	  </div>		
	</div>
</div>

<%@ include file="../include/footer.jsp" %>