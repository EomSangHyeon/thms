<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$("select[name='sjid']").on("change", function() {
		var selected_sjid = $(this).val();

		$.getJSON("/schedule/doctorList/"+ selected_sjid, function(list) {
			var htmlStr = "<option value=''>---</option>";
			$(list).each(function(key, val) {
				htmlStr += "<option value='"+ val.did +"'>"+ val.dname +"</option>";
			});
			$("select[name='did']").html(htmlStr);
		});
	});
});
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header width-border">
					<h3 class="box-title">의료진 일정관리</h3>
				</div>

				<form role="form" action="calendar" method="post">
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">진료과목 선택</label>
						<select name="sjid">
							<option value="">---</option>
<c:forEach items="${subject}" var="sj">
							<option value="${sj.sjid}">${sj.sjname}</option>
</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">의료진 선택</label>
						<select name="did">
							<option value="">---</option>
						</select>
					</div>
					<div class="form-group">
						<h3 class="text-center">${year}년 ${month}월</h3>
						<table id="calendarTable" class="table table-bordered">
							<colgroup>
								<col style="width:14%;"/>
								<col style="width:14%;"/>
								<col style="width:14%;"/>
								<col style="width:14%;"/>
								<col style="width:14%;"/>
								<col style="width:14%;"/>
								<col style="width:14%;"/>
							</colgroup>
							<thead>
								<tr>
									<th class="text-center" style="color:RED;">일</th>
									<th class="text-center">월</th>
									<th class="text-center">화</th>
									<th class="text-center">수</th>
									<th class="text-center">목</th>
									<th class="text-center">금</th>
									<th class="text-center" style="color:BLUE;">토</th>
								</tr>
							</thead>
							<tbody>
<c:forEach begin="0" end="5" step="1" var="i">
								<tr>
	<c:forEach begin="0" end="6" step="1" var="j">
									<td class="text-center" style="height:50px; padding:4px; margin:0px;">
		<c:if test="${not empty calDate[i][j]}">
										<div class="text-right">${calDate[i][j]}</div>
										<br/>
										오전 : 0
										<br/>
										오후 : 0
		</c:if>
									</td>
	</c:forEach>
								</tr>
</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				</form>

				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="submit" class="btn btn-warning">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>