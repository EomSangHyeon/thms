<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>

<div class="wrapper">
  <form class="form-signin">       
    <h2 class="form-signin-heading">비밀번호 찾기</h2>
    <input type="text" class="form-control" name="uid" placeholder="ID" required="required" autofocus="autofocus" />
    <input type="password" class="form-control" name="upassword" placeholder="Password" required="required"/>      
    <br><br>
    <button class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
    <button id="register_lost_btn" type="button" class="btn btn-link">로그인</button>
    <button id="register_register_btn" type="button" class="btn btn-link">아이디 찾기</button>
  </form>
</div>

<%@ include file="../include/footer.jsp" %>