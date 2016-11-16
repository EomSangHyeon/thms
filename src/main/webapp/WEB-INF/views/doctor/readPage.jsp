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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".modify").on("click",function(){
		formObj.attr("action","/doctor/modifyPage");
		formObj.attr("method","get");
		formObj.submit();
	});
	$(".remove").on("click",function(){
		formObj.attr("action","/doctor/remove");
		formObj.submit();
	});
	$(".list").on("click",function(){
		self.location="/doctor/listPage";
	}); 
});

</script>
<body>

<form role="form" method="post">
	<input type="hidden" name="did" value="${doctorVO.did}">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
</form>

<label>번호</label>
<div> <input type="text" name="did" value="${doctorVO.did}" readonly="readonly"></div>
<label>이름</label>
<div><input type="text" name="dname" value="${doctorVO.dname}" readonly="readonly"></div>
<label>병실</label>
<div><input type="text" name="dclinic" value="${doctorVO.dclinic}" readonly="readonly"></div>
<label>부서ID</label>
<div><input type="text" name="sjid" value="${doctorVO.sjid}" readonly="readonly"></div>
<div>
	<button type="submit" class="modify" >수정</button>
	<button type="submit" class="remove" >삭제</button>
	<button type="submit" class="list" >list</button>
</div>
</body>
</html>