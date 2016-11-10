<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

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
						<label for="exampleInputEmail1">진료과목</label>
						<input type="text" name="title" class="form-control" placeholder="Enter Title"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">의료진 선택</label>
						<textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea>
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
<c:forEach begin="0" end="5" step="1" var="i">
								<tr>
	<c:forEach begin="0" end="6" step="1" var="j">
									<td>${i * 7 + j}</td>
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