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

.form-join {
  max-width: 800px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-join-heading {
	  margin-bottom: 30px;
	}	
}
</style>

<div class="wrapper">
	<form class="form-join">
    <h2 class="form-join-heading">회원가입</h2>
    <div class="form-group">
    	<label for="uid">아이디</label>
    	<div class="input-group">
    		<input type="text" class="form-control" name="uid" placeholder="아이디" required="required" autofocus="autofocus" />
        <span class="input-group-btn">
	        <button class="btn btn-primary">중복확인 <i class="fa fa-check spaceLeft"></i></button>
        </span>   	
    	</div>
    </div>
    <div class="form-group">
    	<label for="upw">비밀번호</label>
    	<input type="password" class="form-control" name="upw" placeholder="비밀번호" required="required"/>
    </div>
    <div class="form-group">
    	<label for="upassword">비밀번호 확인</label>
    	<input type="password" class="form-control" name="upassword" placeholder="비밀번호 확인" required="required"/>
    	<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    <div class="form-group">
    	<label for="uname">이름</label>
    	<input type="password" class="form-control" name="uname" placeholder="이름" required="required"/>
    </div>
    <div class="form-group">
    	<label for="unick">닉네임</label>
    	<div class="input-group">
	    	<input type="password" class="form-control" name="unick" placeholder="닉네임" required="required"/>
	    	<span class="input-group-btn">
	      	<button class="btn btn-primary">중복확인 <i class="fa fa-check spaceLeft"></i></button>
	      </span>
      </div>
    </div>
    <div class="form-group">
    	<label for="uemail">이메일</label>
    	<div class="input-group">	    	
	    	<input type="email" class="form-control" name="uemail" placeholder="이메일" required="required" autofocus="autofocus" />
	    	<span class="input-group-btn">
	     		<button class="btn btn-primary">중복확인 <i class="fa fa-check spaceLeft"></i></button>
	      </span>
	    </div>
    </div>
    <div class="form-group">
    	<label for="ugender">성별</label>
    	<div class="radio">
	    	<label><input type="radio" name="ugender" value="male">남자</label>
	    	<label><input type="radio" name="ugender" value="female">여자</label>
    	</div>
    </div>
    <div class="form-group">
    	<label for="ubirth">생년월일</label>
    	<input class="form-control" id="ubirth" type="date">    	
    </div>    
    <br>
    <button class="btn btn-primary" type="submit">회원 <i class="fa fa-check spaceLeft"></i></button>
    <button class="btn btn-warning" type="reset">취소 <i class="fa fa-times spaceLeft"></i></button>    
  </form>
</div>



<%@ include file="../include/footer.jsp" %>