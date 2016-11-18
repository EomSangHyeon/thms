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
		formObj.attr("action","/checkup/modifyPage");
		formObj.attr("method","get");
		formObj.submit();
	});
	$(".remove").on("click",function(){
		formObj.attr("action","/checkup/remove");
		formObj.submit();
	});
	$(".list").on("click",function(){
		self.location="/checkup/list";
	}); 
});

</script>
<body>
<form role="form" method="post">
	<input type="hidden" name="chid" value="${checkUpVO.chid}">	
		<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
</form>

<label>검사ID</label>
<div> <input type="text" name="chid" value="${checkUpVO.chid}" readonly="readonly"></div>
<label>검사내용</label>
<div><input type="text" name="chname" value="${checkUpVO.chname}" readonly="readonly"></div>



<div>
	<button type="submit" class="modify" id="modify">수정</button>
	<button type="submit" class="remove" id="remove">삭제</button>
	<button type="submit" class="list" id="list">list</button>
</div>
</body>
</html>