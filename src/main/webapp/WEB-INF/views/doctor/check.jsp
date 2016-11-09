<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var name = document.getElementById("dname").value ;

</script>
<body>
	<div>${name }</div>
	<div><%=request.getParameterValues("dgender").toString() %></div>
	<div><%=request.getParameterValues("dclinic").toString() %></div>
	<div><%=request.getParameterValues("sjid").toString() %></div>
</body>
</html>