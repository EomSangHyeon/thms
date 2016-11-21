<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<form action="testSearchResult" method="POST">
		<table>
			<tr>
				<td>검색유형</td>
				<td><select name="searchType">
						<option value="uid">아이디</option>
						<option value="uname">이름</option>
						<option value="uemail">이메일</option>
						<option value="unick">닉네임</option>
						<option value="ustatus">권한</option>
				</select></td>
			</tr>
			<tr>
				<td>검색어</td>
				<td><input type="text" name="keyword"></td>
			</tr>
			<tr>
				<td><input type="submit" name="ketword"></td>
			</tr>
		</table>
	</form>

</body>
</html>
