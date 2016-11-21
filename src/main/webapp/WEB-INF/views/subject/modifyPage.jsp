<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$("#modify").on("click",function(){
		formObj.submit();
	});
	$("#remove").on("click",function(){
		self.location="/subject/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
				"&searchType=${cri.searchType}&keyword=${cri.keyword}";
	}); 
});
</script>
<form role="form" method="post">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
<label>부서번호</label>
<div> <input type="text" name="sjid" value="${subjectVO.sjid}" readonly="readonly"></div>
<label>부서명</label>
<div><input type="text" name="sjname" value="${subjectVO.sjname}" ></div>
<div>
	<button type="submit" id="modify">수정</button>
	<button type="submit" id="remove">취소</button>
</div>
</form>
</body>
</html>