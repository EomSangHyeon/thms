<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>

<style type="text/css">
.popup { position:absolute; }
.back { background-color:GRAY; opacity:0.5; width:100%; height:300%; overflow:hidden; z-index:1101; }
.front { z-index:1110; opacity:1; border:1px; margin:auto; }
.show { position:relative; max-width:1200px; max-height:800px; overflow:auto; }
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript">
var bno = ${boardVO.bno};
var replyPage = 1;

$(document).ready(function() {
	var formObj = $("form[role=form]");
	var template = Handlebars.compile($("#templateAttach").html());

	//수정보튼 클릭
	$("#modifyBtn").on("click", function() {
		formObj.attr({
			action: "/sboard/modifyPage",
			method: "get"
		});
		formObj.submit();
	});

	//삭제버튼 클릭
	$("#removeBtn").on("click", function() {
		if(confirm("정말 삭제하시겠습니까?")) {
			var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g, "");
			if(replyCnt > 0) {
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
				return;
			}

			var arr = [];
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
			});

			if(arr.length > 0) {
				$.post("/deleteAllFiles", {files:arr}, function() {
					
				});
			}

			formObj.attr({
				method: "post", 
				action: "/sboard/removePage"
			});
			formObj.submit();
		}
	});

	//목록보기 버튼 클릭
	$("#goListBtn").on("click", function() {
		formObj.attr({
			method: "get",
			action: "/sboard/list"
		});
		formObj.submit();
	});

	//덧글 보기버튼 클릭
	$("#repliesDiv").on("click", function() {
		if($(".timeline").find("li").length > 1)
			return;

		getPage("/replies/"+ bno +"/1");
	});

	//페이징 클릭
	$(".pagination").on("click", function(event) {
		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/"+ bno +"/"+ replyPage);
	});

	//덧글 등록
	$("#replyAddBtn").on("click", function() {
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();

		$.ajax({
			type: "post",
			url: "/replies/",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			dataType: "text",
			data: JSON.stringify({
				bno: bno,
				replyer: replyer,
				replytext: replytext
			}),
			success: function(result) {
				console.log("result : "+ result);

				if(result == "SUCCESS") {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+ bno +"/"+ replyPage);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".replyLi", function(event) {
		var reply = $(this);

		$("#replytext").val(reply.find(".timeline-body").text());
		$(".modal-title").html(reply.attr("data-rno"));
	});

	$("#replyModBtn").on("click", function() {
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type: "put",
			url: "/replies/"+ rno,
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "PUT"
			},
			data: JSON.stringify({
				replytext: replytext
			}),
			dataType: "text",
			success: function(result) {
				console.log("result : "+ result);

				if(result == "SUCCESS") {
					alert("수정 되었습니다.");
					getPage("/replies/"+ bno +"/"+ replyPage);
				}
			}
		});
	});

	$("#replyDelBtn").on("click", function() {
		if(confirm("삭제 하시겠습니까?")) {
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();

			$.ajax({
				type: "delete",
				url: "/replies/"+ rno,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				success: function(result) {
					console.log("result : "+ result);

					if(result == "SUCCESS") {
						alert("삭제 되었습니다.");
						getPage("/replies/"+ bno +"/"+ replyPage);
					}
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

Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();

	return year +"/"+ month +"/"+ date;
});

var printData = function(replyArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
};

function getPage(pageInfo) {
	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#repliesDiv"), $("#template"));
		printPaging(data.pageMaker, $(".pagination"));

		$("#modifyModal").modal("hide");
		$("#replycntSmall").html("[ "+ data.pageMaker.totalCount +" ]");
	});
}

var printPaging = function(pageMaker, target) {
	var str = "";
	if(pageMaker.prev)
		str += "<li><a href='"+ (pageMaker.startPage - 1) +"'> &lt;&lt; </a></li>";

	for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
		var strClass = pageMaker.cri.page==i?" class='active'":"";
		str += "<li"+ strClass +"><a href='"+ i +"'>"+ i +"</a></li>";
	}

	if(pageMaker.next)
		str += "<li><a href='"+ (pageMaker.endPage + 1) +"'> &gt;&gt; </a></li>";

	target.html(str);
};

Handlebars.registerHelper("eqReplyer", function(replyer, block) {
	var accum = "";
	if(replyer == "${login.uid}" || "${login.ustatus}" == "admin" || "${login.ustatus}" == "master")
		accum += block.fn();

	return accum;
});
</script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
		</span>
		<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
		<div class="timeline-body">{{replytext}}</div>
		<div class="timeline-footer">
			{{#eqReplyer replyer}}
			<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
			{{/eqReplyer}}
		</div>
	</div>
</li>
{{/each}}
</script>
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src="{{fullName}}">
	<span class="mailbox-attachment-icon has-img">
		<img src="{{imgsrc}}" alt="Attachment"/>
	</span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</div>
</li>
</script>
<div class="popup back" style="display:none;">
	<div id="popup_front" class="popup front" style="display:none;">
		<img id="popup_img"/>
	</div>
</div>
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dailog">
	<div class=modal-dailog>
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"/></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<form role="form">
<input type="hidden" name="page" value="${cri.page}"/>
<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
<input type="hidden" name="searchType" value="${cri.searchType}"/>
<input type="hidden" name="keyword" value="${cri.keyword}"/>
<input type="hidden" name="bno" value="${boardVO.bno}"/>
</form>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header width-border">
					<h3 class="box-title">READ BOARD</h3>
				</div>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label>
						<input type="text" name="title" class="form-control" value="${boardVO.title}" readonly/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Content</label>
						<textarea class="form-control" name="content" rows="3" readonly>${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label>
						<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly/>
					</div>
				</div>

				<div class="box-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
<c:if test="${login.uid == boardVO.writer || login.ustatus == 'admin' || login.ustatus == 'master'}">
					<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
					<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
</c:if>
					<button type="submit" class="btn btn-primary" id="goListBtn">GO LIST</button>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>

<c:if test="${not empty login}">
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label>
					<input type="text" value="${login.uid}" placeholder="USER ID" id="newReplyWriter" class="form-control" readonly/>
					<label for="exampleInputEmail1">Reply Text</label>
					<input type="text" placeholder="REPLY TEXT" id="newReplyText" class="form-control"/>
				</div>

				<div class="box-footer">
					<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
				</div>
</c:if>

<c:if test="${empty login}">
				<div class="box-body">
					<div><a href="javascript:goLogin();">Login Please</a></div>
				</div>
</c:if>
			</div>

			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">Replies List <small id="replycntSmall"> [ ${boardVO.replycnt} ] </small></span></li>
			</ul>
	
			<div class="text-center">
				<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>