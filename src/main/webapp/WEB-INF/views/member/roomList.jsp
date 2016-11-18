<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title> roomList
<br>

<table>
	<tr>
		<td>방 아이디</td>
		<td>위치</td>
		<td>현 인원</td>
		<td>수용가능 인원</td>
	</tr>
	<c:forEach items="${room}" var="hh">
		<tr>
			<td>${hh.rmid }</td>
			<td>${hh.rmnumber }</td>
			<td>${hh.rmcurrentcount }</td>
			<td>${hh.rmheadcount }</td>
		</tr>
	</c:forEach>
</table>

</head>
<body>



</body>
</html>
