<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>
	<!--  정보수정인데 관리자가 오면 status 수정가능하고 아니면 안보이게 -->

	<form action="confirmUpdateMember" method="POST">
		<table>
			<c:forEach items="${searchmember}" var="search">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" value='${search.uid}'
						readonly /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="uname" value="${search.uname}"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="unick" value="${search.unick}"
						readonly /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="ugender"
						value="${search.ugender}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="uemail" value="${search.uemail}"
						readonly /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="ubirth" value="${search.ubirth}"></td>
				</tr>
				<tr>
					<td>권한</td>
					<td><input type="text" name="ustatus" value="${search.ustatus}"></td>
				</tr>
			</c:forEach>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>
