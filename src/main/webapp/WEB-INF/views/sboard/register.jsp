<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>

<style type="text/css">
.fileDrop { width:80%; height:100px; border:1px dotted GRAY; background-color:LIGHTSLATEGRAY; margin:auto; }
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[role='form']");
	var template = Handlebars.compile($("#template").html());
	console.log(formObj);
	$(".btn-warning").click(function() {
		self.location = "/sboard/list";
	});
	$(".btn-primary").click(function() {
		if($("form[role='form'] input[name=title]").val() == "") {
			alert("제목을 입력해주세요.");
			$("form[role='form'] input[name=title]").focus();
			return false;
		}
		formObj.submit();
	});
	$(".fileDrop").on({
		dragenter: function(event) {
			event.preventDefault();
		},
		dragover: function(event) {
			event.preventDefault();
		},
		drop: function(event) {
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			var formData = new FormData();
			formData.append("file", file);
			$.ajax({
				type: "post",
				url: "/uploadAjax",
				data: formData,
				dataType: "text",
				processData: false,
				contentType: false,
				success: function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".uploadedList").append(html);
				}
			});
		}
	});
	formObj.submit(function(event) {
		event.preventDefault();
		var that = $(this);
		var str = "";
		$(".uploadedList .delbtn").each(function(index) {
			str += "<input type='hidden' name='files["+ index +"]' value='"+ $(this).attr("href") +"'/>";
		});
		that.append(str);
		that.get(0).submit();
	});
});
</script>
<script id="template" type="text/x-handlebars-template">
<li>
	<span class="mailbox-attachment-icon has-img">
		<img src="{{imgsrc}}" alt="Attachment"/>
	</span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
			<i class="fa fa-fw fa-remove"></i>
		</a>
	</div>
</li>
</script>
<!-- Main content -->

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header width-border">
					<h3 class="box-title">글쓰기</h3>
				</div>

				<form role="form" action="register" method="post">						
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label>
						<input type="text" name="title" class="form-control" placeholder="Enter Title"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Content</label>
						<textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label>
						<input type="text" name="writer" value="${login.uid}" class="form-control" placeholder="Enter Writer" readonly/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">File DROP Here</label>
						<div class="fileDrop"></div>
					</div>
					<input type="hidden" name="btype" value="bbs">
				</div>
				</form>

				<div class="box-footer">
					<div>
						<hr>
					</div>
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="submit" class="btn btn-warning">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>