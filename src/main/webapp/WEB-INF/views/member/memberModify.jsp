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
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-md-10 main">
		
			<div class="box box-header">
				<h3>개인정보 관리</h3>
			</div>
			
			<div class="box box-body"> 

				<form action="memberModify.do" method="POST" class="form-horizontal">
			
					<c:forEach items="${searchmember}" var="search">
						<div class="form-group">
							<label class="control-label col-sm-2">아이디 : </label>
							<div class=" col-sm-6">
								<input class="form-control" type="text" name="uid" value='${search.uid}' required="required" readonly />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">비밀번호 : </label>
							<div class=" col-sm-6">
								<input class="form-control" type="password" name="upw" value='${search.upw}' required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">이름 : </label>
							<div class=" col-sm-6">
								<input class="form-control" type="text" name="uname" value="${search.uname}" required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">닉네임 : </label>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="unick" value="${search.unick}" required="required" readonly />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">성별</label>
							<div class="col-sm-6">
								<select class="form-control" name="ugender">
									<option name="man">man</option>
									<option name="woman">woman</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2"> 이메일</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="uemail" value="${search.uemail}" required="required" readonly />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2"> 생년월일</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="ubirth" value="${search.ubirth}"	required="required">
							</div>
						</div>
					</c:forEach>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<input class="btn btn-primary" type="submit" value="변경하기">
						</div>
					</div>
			
				</form>
			</div><!-- .box-body -->
			
		</div><!-- .col-sm-10 main -->
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp"%>
