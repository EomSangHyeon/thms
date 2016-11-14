<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function sendID(id){
	opener.setID(id);
	window.close();
	}

</script>
<form action="post">
	<table>
		<th>검사ID</th>
		<th>검사내용</th>
		
		<c:forEach items="${listView}" var="CheckUpVO">
			<tr>
				<td>${CheckUpVO.chid }</td>
				<%-- <td>${SubjectVO.sjname }</td> --%>
				<td><a href="javascript:sendID('${CheckUpVO.chid }')">${CheckUpVO.chname }</a></td>
			</tr>
		</c:forEach>
		
	</table>
</form>
</body>
</html>