<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	if($("select[name='sjid']").val() != "")
		getDid();

	$("select[name='sjid']").on("change", getDid);

	$("select[name='did']").on("change", getSchedule);
});

function getDid() {
	var selected_sjid = $("select[name='sjid']").val();

	$.getJSON("/schedule/doctorList/"+ selected_sjid, function(list) {
		var htmlStr = "<option value=''>---</option>";
		$(list).each(function(key, val) {
			if(val.did == "${scheduleVO.did}")
				htmlStr += "<option value='"+ val.did +"' selected>"+ val.dname +"</option>";
			else
				htmlStr += "<option value='"+ val.did +"'>"+ val.dname +"</option>";
		});
		$("select[name='did']").html(htmlStr);
/*
		if($("select[name='did']").val() != "")
			getSchedule();
*/
	});

	$(".btn-warning").on("click", function() {
		event.preventDefault();

		history.back();
	});

	$("form[role='form']").submit(function() {
		event.preventDefault();

		var i = 0;
		var type = "";
		var flag = true;
		var weekday = "";
		$(".medicalCount").each(function() {
			weekday = this.id.replace(/td\_/gi, "");

			$(this).find("input[type='number']").each(function() {
				type = $(this).prop("class").replace(/Input/gi, "");

				$.post("/schedule/calendarEdit", {
					sjid: $("select[name='sjid']").val(),
					did: $("select[name='did']").val(),
					weekday: getWeekday(weekday),
					ampm: type,
					medicalCount: $(this).val()
				}, function(data) {
					if(data == "success")
						flag = true;
					else
						flag = false;
				});

				if(flag == true)
					i++;
				else {
					alert("error");
					return;
				}
			});
		});
	});
}

function getWeekday(number) {
	var weekday = "";

	switch(number) {
		case "0" : weekday = "Sun"; break;
		case "1" : weekday = "Mon"; break;
		case "2" : weekday = "Tue"; break;
		case "3" : weekday = "Wed"; break;
		case "4" : weekday = "Thr"; break;
		case "5" : weekday = "Fri"; break;
		case "6" : weekday = "Sat"; break;
	}

	return weekday;
}

function getSchedule() {
	self.location = "/schedule/calendar?sjid="+ $("select[name='sjid']").val() +"&did="+ $("select[name='did']").val() +"&year=${year}&month=${month}";
}

function getScheduleEmptyVO(year, month) {
	if(month < 1) {
		year--;
		month = 12;
	} else if(month > 12) {
		year++;
		month = 1;
	}

	if(year < 1)
		return;

	self.location = "/schedule/calendar?sjid="+ $("select[name='sjid']").val() +"&did="+ $("select[name='did']").val() +"&year="+ year +"&month="+ month;
}
</script>
<!-- Main content -->
<div class="container-fluid">
	<div class="row">
		<!-- left column -->
		<%@ include file="../admin/admin_sidebar.jsp" %>

		<div class="col-sm-9 col-md-10 main">
			<!-- general form elements -->
			<form role="form" action="calendar" method="post">
			<div class="box">
				<div class="box-header width-border">
					<h3 class="box-title">의료진 일정관리</h3>
				</div>

				<div class="box-body">
					<div class="form-group">
						<label for="sjid">진료과목 선택</label>
						<select name="sjid" id="sjid">
							<option value="">---</option>
<c:forEach items="${subject}" var="sj">
	<c:if test="${sj.sjid == scheduleVO.sjid}">
							<option value="${sj.sjid}" selected>${sj.sjname}</option>
	</c:if>
	<c:if test="${sj.sjid != scheduleVO.sjid}">
							<option value="${sj.sjid}">${sj.sjname}</option>
	</c:if>
</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="did">의료진 선택</label>
						<select name="did" id="did">
							<option value="">---</option>
						</select>
					</div>
					<div class="form-group">
						<table class="table table-bordered">
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
								<tr>
<c:forEach begin="0" end="6" step="1" var="w">
									<td id="td_${w}" class="text-center medicalCount" style="height:50px; padding:4px; margin:0px;">
										<div class="text-center" style="background-color:#00D8FF;">오전</div>
										<div><input type="number" name="am[${w}]" value="${medicalCount[w][0]}" class="amInput" style="width:100%;"/></div>
										<div class="text-center" style="background-color:#FFA7A7;">오후</div>
										<div><input type="number" name="pm[${w}]" value="${medicalCount[w][1]}" class="pmInput" style="width:100%;"/></div>
									</td>
</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="calendarTable" class="form-group">
						<h3 class="text-center">
							<span style="letter-spacing:-10px; cursor:pointer;" onclick="getScheduleEmptyVO(${year - 1}, ${month});">◁◁</span>&nbsp;
							<span style="cursor:pointer;" onclick="getScheduleEmptyVO(${year}, ${month - 1});">◁</span>&nbsp;
							${year}년 ${month}월&nbsp;
							<span style="cursor:pointer;" onclick="getScheduleEmptyVO(${year}, ${month + 1});">▷</span>&nbsp;
							<span style="letter-spacing:-10px; cursor:pointer;" onclick="getScheduleEmptyVO(${year + 1}, ${month});">▷▷</span>
						</h3>
						<table class="table table-bordered">
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
										<div class="text-center" style="background-color:#00D8FF;">오전</div>
										<div class="text-center">0 / ${medicalCount[j][0]}</div>
										<div class="text-center" style="background-color:#FFA7A7;">오후</div>
										<div class="text-center">0 / ${medicalCount[j][1]}</div>
		</c:if>
									</td>
	</c:forEach>
								</tr>
</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="submit" class="btn btn-warning">Cancel</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>