<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<style type="text/css">
.fileDrop { width:80%; height:100px; border:1px dotted GRAY; background-color:LIGHTSLATEGRAY; margin:auto; }
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var bno = ${boardVO.bno};
	var formObj = $("form[role='form']");
	var template = Handlebars.compile($("#template").html());
	console.log(formObj);

	$(".btn-warning").click(function() {
		self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});

	formObj.submit(function() {
		alert(11111111);
		event.preventDefault();

		var that = $(this);
		var str = "";
		$(".uploadedList .delbtn").each(function(index) {
			str += "<input type='hidden' name='files["+ index +"]' value='"+ $(this).attr("href") +"'/>";
		});
		that.append(str);
		console.log(str);
		that.get(0).submit();
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

	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event) {
		var fileLink = $(this).attr("href");

		if(checkImageType(fileLink)) {
			event.preventDefault();

			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);

			console.log(imgTag.attr("src"));

			$(".popup").show("slow");
			imgTag.addClass("show");
		}
	});

	$(".uploadedList").on("click", ".delbtn", function(event) {
		event.preventDefault();

		var that = $(this);
		$.ajax({
			type: "post",
			url: "/deleteFile",
			data: {
				fileName: $(this).attr("href")
			},
			dataType: "text",
			success: function(result) {
				if(result == 'deleted')
					that.closest("li").remove();
			}
		});
	});

	$("#popup_img").on("click", function() {
		$(".popup").hide("slow");
	});

	$.getJSON("/sboard/getAttach/"+ bno, function(list) {
		$(list).each(function() {
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	});
});
</script>
<script id="template" type="text/x-handlebars-template">
<li>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
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
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>

				<form role="form" action="modifyPage" method="post">
				<input type="hidden" name="page" value="${cri.page}"/>
				<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
				<input type="hidden" name="searchType" value="${cri.searchType}"/>
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">BNO</label>
						<input type="text" name="bno" class="form-control" value="${boardVO.bno}" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label>
						<input type="text" name="title" class="form-control" placeholder="Enter Title" value="${boardVO.title}"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Content</label>
						<textarea class="form-control" name="content" rows="3" placeholder="Enter ...">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label>
						<input type="text" name="writer" class="form-control" placeholder="Enter Writer" value="${boardVO.writer}"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">File DROP Here</label>
						<div class="fileDrop"></div>
					</div>
				</div>
				</form>

				<div class="box-footer">
					<div>
						<hr>
					</div>
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>