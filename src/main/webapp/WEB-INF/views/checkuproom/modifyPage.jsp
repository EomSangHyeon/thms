<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	 function searchcheckup() {
		event.preventDefault();
		var popUrl = "../checkup/listView";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;"; 
		window.open(popUrl,"부서선택",popOption);

	}
	 
	 function setID(id){
	      document.getElementById("chid").value = id;
	}
</script>
<body>
<form role="form" method="post">
<div>검사실ID <input type="text" name="crid" value="${checkUpRoomVO.crid}" readonly="readonly"></div>
<div>검사ID : <input type="text" name="chid" id ="chid" value="${checkUpRoomVO.chid}"><button onclick="searchcheckup()">찾기</button></div>
<div>검사실 : <input type="text" name="crnumber" id ="crnumber" value="${checkUpRoomVO.crnumber}"></div>



<div>
	<button type="submit" class="modify">수정</button>
	<button type="submit" class="remove">취소</button>
</div>
</form>
</body>
</html>