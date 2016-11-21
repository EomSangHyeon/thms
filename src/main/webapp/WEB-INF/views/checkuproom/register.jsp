<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
	 function searchcheckup() {
		event.preventDefault();
		var Url = "../checkup/listView";
		var Option = "width=370, height=360, resizable=no, scrollbars=no, status=yes;"; 
		window.open(Url,"검사선택",Option);

	}
	 
	 function setID(id){
	      document.getElementById("chid").value = id;
	}
</script>
<%@ include file="../admin/admin_sidebar.jsp" %>
<div class="container-fluid">
	<div class="row">		
		<div class="col-sm-9 col-md-10 main">
			
			<div class = "box box-header">
				<h2>검사실 수정</h2>
			</div>
			
			<div class="box box-body">
			
				<form method="post" class="form-horizontal">
				
					<div class="form-group">
						<label class="control-label col-sm-2">검사ID :</label> 
						<div class="col-sm-6">
							<input class="form-control" type="text" name="chid" id ="chid"><button onclick="searchcheckup()">찾기</button>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2">검사실 : </label>
						<div class="col-sm-6"> 
							<input class="form-control" type="text" name="crnumber" id ="dclinic">
						</div>
					</div>
					
					<div class="col-offset-sm-2 col-sm-6">
						<button class="btn btn-primary" type="submit">입력</button>
					</div>
				</form>

			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->
<%@ include file="../include/footer.jsp" %>