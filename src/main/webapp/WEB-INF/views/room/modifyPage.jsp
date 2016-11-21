<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".modify").on("click",function(){
		formObj.submit();
	});
	$(".remove").on("click",function(){
		self.location="/room/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
				"&searchType=${cri.searchType}&keyword=${cri.keyword}";
	}); 
});
</script>
<%@ include file="../admin/admin_sidebar.jsp" %>
	<form role="form" method="post">
		<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="perPage" value="${cri.perPageNum}"> <input
			type="hidden" name="searchType" value="${cri.searchType}"> <input
			type="hidden" name="keyword" value="${cri.keyword}">

		<div>
			방ID<input type="text" name="rmid" value="${roomVO.rmid}"
				readonly="readonly">
		</div>
		<div>
			방번호 : <input type="text" name="rmnumber" value="${roomVO.rmnumber}">
		</div>
		<div>
			입실최고인원 : <input type="text" name="rmheadcount"
				value="${roomVO.rmheadcount}">
		</div>
		<div>
			<button type="submit" class="modify">수정</button>
			<button type="submit" class="remove">취소</button>
		</div>
	</form>
<%@ include file="../include/footer.jsp" %>