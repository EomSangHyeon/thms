<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	 function searchSJ() {
		event.preventDefault();
		var popUrl = "../subject/listView";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=yes;"; 
		window.open(popUrl,"부서선택",popOption);

	}
	 
	 function setID(id){
	      document.getElementById("sjid").value = id;
	}
</script>
<body>
<form role="form" method="post">
<div>번호 <input type="text" name="did" value="${doctorVO.did}" readonly="readonly"></div>
<div>이름 : <input type="text" name="dname" id ="dname" value="${doctorVO.dname}" ></div>
<div>성별: <input type="radio" name="dgender" id ="dgender" value="남">남
		<input type="radio" name="dgender" id ="dgender" value="여">여
</div>
<div>병실 : <input type="text" name="dclinic" id ="dclinic" value="${doctorVO.dclinic}"></div>
<div>부서 : <input type="text" name="sjid" id ="sjid" value="${doctorVO.sjid}"><button onclick="searchSJ()">찾기</button></div>




<div>
	<button type="submit" class="modify">수정</button>
	<button type="submit" class="remove">취소</button>
</div>
</form>
</body>
</html>