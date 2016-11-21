<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	 function searchcheckup() {
		event.preventDefault();
		var Url = "../checkup/listView";
		var Option = "width=370, height=360, resizable=no, scrollbars=no, status=yes;"; 
		window.open(Url,"검사선택",Option);

	}
	 
	 function setID(id){
	      document.getElementById("chid").value = id;
	}
</script>
<%@ include file="../admin/admin_sidebar.jsp" %>
<form method="post">

<div>검사ID : <input type="text" name="chid" id ="chid"><button onclick="searchcheckup()">찾기</button></div>
<div>검사실 : <input type="text" name="crnumber" id ="dclinic"></div>
<div>
	<button type="submit">입력</button>
</div>
</form>
<%@ include file="../include/footer.jsp" %>