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
		<th>이름</th>
		<th>병실</th>		
		<th>부서ID</th>
		<c:forEach items="${listCri}" var="DoctorVO">
			<tr>
				<td>${DoctorVO.did}</td>
				<td><a href="/doctor/readPage?did=${DoctorVO.did}">${DoctorVO.dname}</a></td>
				<td>${DoctorVO.dclinic}</td>
				<td>${DoctorVO.sjid}</td>
			</tr>
		</c:forEach>
		
	</table>
</form>
</body>
</html>