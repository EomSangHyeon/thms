<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>

</script>
</head>
<body>
	pw
	<br> 
	<form action="memberModify" method="POST">
		<table>
			<tr>
				<td><input type="hidden" name="uid" id="uid"></td>
				<td>비밀번호 확인 :</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>
