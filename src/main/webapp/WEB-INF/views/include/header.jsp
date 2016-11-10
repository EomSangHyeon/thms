<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>THMS Project</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<style>
.navbar { margin-bottom: 0; border-radius: 0; }
footer { background-color: #f2f2f2; padding: 25px; }
.carousel-inner img { width: 100%; margin: auto; min-height:200px; }
@media (max-width: 600px) {
	.carousel-caption {
		display: none;
	}
}
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	var thisFolder = document.location.pathname.substr(1).split("/")[0];

	$(".navbar-nav li").each(function() {
		$(this).removeClass("active");
	});
	if(thisFolder != "")
		$("#"+ thisFolder).addClass("active");
});
</script>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">THMS</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li id="introduce" class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">병원소개
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="#">병원 소개</a></li>
	          <li><a href="#">의료진 소개</a></li>
	          <li><a href="#">연혁</a></li> 
	          <li><a href="#">오시는 길</a></li>
	        </ul>
	      </li>
				<li id="reservation"><a href="#">진료예약</a></li>
				<li id="news"><a href="/nboard/list">의료소식</a></li>
				<li id="sboard"><a href="/sboard/list">병원게시판</a></li>
<%-- <c:if test="${login.ustatus == 'admin' || login.ustatus == 'master'}">
				<li id="member"><a href="/member/list">회원관리</a></li>
				<li id="banner"><a href="/banner/list">메인배너관리</a></li>
</c:if>
<c:if test="${login.ustatus == 'hospital' || login.ustatus == 'master'}">
				<li id="doctor"><a href="/doctor/list">의료진관리</a></li>
				<li id="reservation"><a href="/reservation/list">외례관리</a></li>
				<li id="room"><a href="/room/list">병상관리</a></li>
				<li id="schedule"><a href="/schedule/list">의료진 일정관리</a></li>
</c:if> --%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
<c:if test="${empty login}">
				<li><a href="/member/join"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="/member/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
</c:if>
<c:if test="${not empty login}">
				<li><a href="/member/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
</c:if>
			</ul>
		</div>
	</div>
</nav>
