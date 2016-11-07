<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<style>
body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
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
  <form class="form-signin">       
    <h2 class="form-signin-heading">로그인</h2>
    <input type="text" class="form-control" name="uid" placeholder="ID" required="required" autofocus="autofocus" />
    <input type="password" class="form-control" name="upassword" placeholder="Password" required="required"/>      
    <br><br>
    <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
    <button id="register_lost_btn" type="button" class="btn btn-link">아이디 / 비밀번호 찾기</button>
    <button id="register_register_btn" type="button" class="btn btn-link">회원가입</button>
  </form>
</div>

<%@ include file="../include/footer.jsp" %>