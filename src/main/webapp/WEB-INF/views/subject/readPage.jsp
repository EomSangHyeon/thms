<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".modify").on("click",function(){
		formObj.attr("action","/subject/modifyPage");
		formObj.attr("method","get");
		formObj.submit();
	});
	$(".remove").on("click",function(){
		formObj.attr("action","/subject/remove");
		formObj.submit();
	});
	$(".list").on("click",function(){
		self.location="/subject/listAll";
	}); 
});

</script>
<body>
<form role="form" method="post">
	<input type="hidden" name="sjid" value="${subjectVO.sjid}">	
</form>

<label>부서번호</label>
<div> <input type="text" name="sjid" value="${subjectVO.sjid}" readonly="readonly"></div>
<label>부서명</label>
<div><input type="text" name="sjname" value="${subjectVO.sjname}" readonly="readonly"></div>
<div>
	<button type="submit" class="modify" id="modify">수정</button>
	<button type="submit" class="remove" id="remove">삭제</button>
	<button type="submit" class="list" id="list">list</button>
</div>
</body>
</html>