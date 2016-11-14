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
		<th>검사실ID</th>
		<th>검사ID</th>
		<th>검사실번호</th>		
		<c:forEach items="${listAll}" var="CheckUpRoomVO">
			<tr>
				<td>${CheckUpRoomVO.crid}</td>
				<td><a href="/checkuproom/readPage?crid=${CheckUpRoomVO.crid}">${CheckUpRoomVO.chid}</a></td>
				<td>${CheckUpRoomVO.crnumber}</td>
			</tr>
		</c:forEach>
		
	</table>
</form>
</body>
</html>