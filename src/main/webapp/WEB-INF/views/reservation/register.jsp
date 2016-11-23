<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<style type="text/css">
.clickable_day {
	cursor: pointer;
}

.enter_color {
	background-color: #FF0000;
}

.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var clickedDate = "";

	if($("select[name='sjid']").val() != "")
		getDid();

	$("select[name='sjid']").on("change", getDid);

	$("select[name='did']").on("change", function() {
		getSchedule("${year}", "${month}");
	});

	$(".clickable_day").on({
		mouseenter: function() {
			$(this).addClass("enter_color");
		},
		mouseleave: function() {
			$(this).removeClass("enter_color");
		},
		click: function() {
			var str = this.id.split("-");
			clickedDate = str[0];
			if(str[1] < 10)
				clickedDate += "-0"+ str[1];
			else
				clickedDate += "-"+ str[1];
			if(str[2] < 10)
				clickedDate += "-0"+ str[2];
			else
				clickedDate += "-"+ str[2];
		}
	});

	$("#chooseAmPm").on("click", function() {
		var sjname = $("select[name='sjid'] option:selected").text();
		var dname = $("select[name='did'] option:selected").text();
		var ampm = $("input:radio[name='ampm']:checked").val();

		if($("input:radio[name='ampm']").is(":checked") != true) {
			alert("진료시간대를 선택해주세요.");
			return;
		}
		
		if($("select[name='sjid']").val() == "") {
			alert("진료과목을 선택해주세요.");
			$("#confirmModal").modal("hide");
			return;
		}

		if($("select[name='did']").val() == "") {
			alert("의료진을 선택해주세요.");
			$("#confirmModal").modal("hide");
			return;
		}

		$.post("/reservation/register", {
			rdate: clickedDate,
			sjid: $("select[name='sjid'] option:selected").val(),
			did: $("select[name='did'] option:selected").val(),
			ampm: $("input:radio[name='ampm']:checked").val()
		}, function(data) {
			if(data == "success") {
				alert("외례예약이 완료되었습니다.");
				self.location.reload();
			}
		});
	});
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

function getSchedule(year, month) {
	if(month < 1) {
		year--;
		month = 12;
	} else if(month > 12) {
		year++;
		month = 1;
	}

	if(year < 1)
		return;

	var url = "/reservation/register?";
	if($("select[name='sjid']").val() != "" && $("select[name='did']").val() != "")
		url += "sjid="+ $("select[name='sjid']").val() +"&did="+ $("select[name='did']").val() +"&";

	self.location = url +"year="+ year +"&month="+ month;
}
</script>
<!-- Main content -->
<div class="container-fluid">
	<div class="row">
		<!-- left column -->
		<div class="main">
			<!-- general form elements -->
			<form role="form" action="calendar" method="post">
			<div class="box">
				<div class="box-header width-border">
					<h3 class="box-title">의료진 일정관리</h3>
				</div>

				<!-- Modal -->
				<div id="confirmModal" class="modal fade" role="dailog">
					<div class="modal-dailog modal-sm" style="margin: 30px auto;">
						<!-- Modal content -->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">예약 시간대 선택</h4>
							</div>
							<div class="modal-body">
								<p>
<c:if test="${empty login}">
									<a href="/member/login">로그인</a> 후 이용해주세요.
</c:if>
<c:if test="${not empty login}">
									<label>
										<input type="radio" name="ampm" value="am"/>오전
									</label>
									<br/>
									<label>
										<input type="radio" name="ampm" value="pm"/>오후
									</label>
</c:if>
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="chooseAmPm">예약하기</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
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
					<div id="calendarTable" class="form-group">
						<h3 class="text-center">
							<span style="letter-spacing:-10px; cursor:pointer;" onclick="getSchedule(${year - 1}, ${month});">◁◁</span>&nbsp;
							<span style="cursor:pointer;" onclick="getSchedule(${year}, ${month - 1});">◁</span>&nbsp;
							${year}년 ${month}월&nbsp;
							<span style="cursor:pointer;" onclick="getSchedule(${year}, ${month + 1});">▷</span>&nbsp;
							<span style="letter-spacing:-10px; cursor:pointer;" onclick="getSchedule(${year + 1}, ${month});">▷▷</span>
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
										<div id="${year}-${month}-${calDate[i][j]}" class="clickable_day" data-toggle="modal" data-target="#confirmModal">
											<div class="text-right">${calDate[i][j]}</div>
											<br/>
											<div class="text-center" style="background-color:#00D8FF;">오전</div>
											<div class="text-center">${reservationCount[calDate[i][j]][0]} / ${medicalCount[j][0]}</div>
											<div class="text-center" style="background-color:#FFA7A7;">오후</div>
											<div class="text-center">${reservationCount[calDate[i][j]][1]} / ${medicalCount[j][1]}</div>
										</div>
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