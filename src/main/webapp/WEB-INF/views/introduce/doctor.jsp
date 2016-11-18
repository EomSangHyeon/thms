<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>
<script>
/* $(document).ready(function(){
	$(".panel-body").hide();
 	$(".panel-heading").on("click", function(){
		$(this).next("div").children("div").show();
	});
}); */

</script>
<%@ include file="sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class = "col-sm-9 col-md-10 main">
		
		  <h2>의료진 소개</h2>
		  
		  <div class="panel-group" id="accordion">
		  
<c:forEach items="${subjectList}" var="sub">
		    <div class="panel panel-default">
		      <div class="panel-heading" id="${sub.sjid}">
		        <h4 class="panel-title">
		          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${sub.sjid}"><label>${sub.sjname}</label></a>
		        </h4>
		      </div>
		      
		      <div id="collapse${sub.sjid}" class="panel-collapse collapse in">
		        <div class="panel-body" id="${sub.sjid }">
		        	<table class="table table-striped">
		        		<tr>
		        			<th>번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>진료실</th>
									<th>예약하기</th>								
		        		</tr>
	<c:forEach items="${doctorList}" var="doc">
		<c:if test="${doc.sjid == sub.sjid}">
		        		<tr>
		        			<td>${doc.did}</td>
		        			<td>${doc.dname}</td>
		        			<td>${doc.dgender}</td>
		        			<td>${doc.dclinic}</td>
		        			<td><button class="btn btn-primary">예약하기</button></td>
		        		</tr>
		  </c:if>
	</c:forEach>
		        		
		        	</table>
		        </div>
		      </div>
		    </div>
</c:forEach>
		        
		  </div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>