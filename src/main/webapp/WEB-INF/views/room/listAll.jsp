<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="post">
	<table>
		<th>방ID</th>
		<th>방번호</th>
		<th>입실최고인원</th>
		
		<c:forEach items="${listAll}" var="RoomVO">
			<tr>
				<td>${RoomVO.rmid }</td>
				<td><a href="/room/readPage?rmid=${RoomVO.rmid}">${RoomVO.rmnumber }</a></td>
				<td>${RoomVO.rmheadcount }</td>
			</tr>
		</c:forEach>
		
	</table>
</form>
</body>
</html>