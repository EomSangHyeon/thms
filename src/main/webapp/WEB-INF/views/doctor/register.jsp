<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		window.open(popUrl,"�μ�����",popOption);

	}
	 
	 function setID(id){
	      document.getElementById("sjid").value = id;
	}
</script>
<body>
<form method="post">
<div>�̸� : <input type="text" name="dname" id ="dname"></div>
<div>����: <input type="radio" name="dgender" id ="dgender" value="��">��
		<input type="radio" name="dgender" id ="dgender" value="��">��
</div>
<div>���� : <input type="text" name="dclinic" id ="dclinic"></div>
<div>�μ� : <input type="text" name="sjid" id ="sjid"><button onclick="searchSJ()">ã��</button></div>
<div>
	<button type="submit">�Է�</button>
</div>
</form>
</body>
</html>