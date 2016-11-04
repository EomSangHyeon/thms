<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fileDrop { width:100%; height:200px; border:1px dotted blue; }
small { margin-left:3px; font-weight:bold; color:GRAY; }
</style>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
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
				var str = "";

				console.log(data);
				console.log(checkImageType(data));

				if(checkImageType(data)) {
					str = "<div>";
					str += "<a href='displayFile?fileName="+ getImageLink(data) +"'>";
					str += "<img src='displayFile?fileName="+ data +"'/>";
					str += getImageLink(data);
					str += "</a>";
					str += "<small data-src="+ data +">X</small>";
					str += "</div>";
				} else {
					str = "<div>";
					str += "<a href='displayFile?fileName="+ data +"'>";
					str += getOriginalName(data);
					str += "</a>";
					str += "<small data-src="+ data +">X</small>";
					str += "</div>";
				}

				$(".uploadedList").append(str);
			}
		});
	});

	$(".uploadedList").on("click", "small", function(event) {
		var that = $(this);

		$.ajax({
			type: "post",
			url: "deleteFile",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				if(result == "deleted")
					that.parent("div").remove();
			}
		});
	});
});

function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;

	return fileName.match(pattern);
}

function getOriginalName(fileName) {
	if(checkImageType(fileName))
		return;

	var idx = fileName.indexOf("_") + 1;

	return fileName.substr(idx);
}

function getImageLink(fileName) {
	if(!checkImageType(fileName))
		return;

	var front = fileName.substr(0, 12);
	var end = fileName.substr(14);

	return front + end;
}
</script>
</head>
<body>
<h3>Ajax File Upload</h3>
<div class="fileDrop"></div>
<div class="uploadedList"></div>
</body>
</html>