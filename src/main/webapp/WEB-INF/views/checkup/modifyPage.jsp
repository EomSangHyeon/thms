<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form role="form" method="post">
<div>검사ID<input type="text" name="chid" value="${checkUpVO.chid}" readonly="readonly"></div>
<div>검사내용 : <input type="text" name="chname" value="${checkUpVO.chname}"></div>
<div>
	<button type="submit" class="modify">수정</button>
	<button type="submit" class="remove">취소</button>
</div>
</form>
</body>
</html>