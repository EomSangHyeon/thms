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
		<th>번호</th>
		<th>부서</th>
		
		<c:forEach items="${listAll}" var="SubjectVO">
			<tr>
				<td>${SubjectVO.sjid }</td>
				<td><a href="/subject/readPage?sjid=${SubjectVO.sjid}">${SubjectVO.sjname }</a></td>
			</tr>
		</c:forEach>
		
	</table>
</form>
</body>
</html>