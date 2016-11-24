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

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-md-10 main">
		
			<div class="box box-header">
				<h3>개인정보 관리</h3>
			</div>
			
			<div class="box box-body"> 
				<form action="memberModify" method="POST">
					<input type="hidden" name="uid" id="uid">
					<h4>비밀번호 확인 :</h4>
					<div class="form-group">
						<div class="col-sm-4">
							<input class="form-control" type="password" name="pw" required="required">							
						</div>
						<div class="col-sm-2">
							<input class="btn btn-primary" type="submit" value='입력'>
						</div>
					</div>					
				</form>
			</div><!-- .box-body -->
			
		</div><!-- .col-sm-10 main -->
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp"%>