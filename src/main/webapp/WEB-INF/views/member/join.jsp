<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<style>
@import "bourbon";

body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-join {
  max-width: 800px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-join-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	}

	input[type="password"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}
</style>

<div class="wrapper">
	<form class="form-join">
    <h2 class="form-join-heading">회원가입</h2>
    <div class="form-group">
    	<label for="uid">아이디</label>
    	<input type="text" class="form-control" name="uid" placeholder="아이디" required="required" autofocus="autofocus" />
    </div>
    <div class="form-group">
    	<label for="upassword">비밀번호</label>
    	<input type="password" class="form-control" name="upassword" placeholder="비밀번호" required="required"/>
    </div>
    <div class="form-group">
    	<label for="upassword">비밀번호 확인</label>
    	<input type="password" class="form-control" name="upassword" placeholder="비밀번호 확인" required="required"/>
    	<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    <br><br>
    <button class="btn btn-primary" type="submit">회원가입 <i class="fa fa-check spaceLeft"></i></button>
    <button class="btn btn-warning" type="submit">취소 <i class="fa fa-times spaceLeft"></i></button>    
  </form>
</div>

<%@ include file="../include/footer.jsp" %>