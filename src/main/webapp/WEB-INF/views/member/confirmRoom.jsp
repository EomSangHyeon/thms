<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	// 들어갈 수 있는 방 목록만 가져오기 ajax??  !!!

	// ajax로 방 입력했을때 가능한지 안가능한지 확인
	function restRoom() {
		$.ajax({
			type : 'post',
			url : 'restRoomAjax',
			dataType : 'text',
			data : {
				rmid : $('#rmid').val()
			},
			success : function(data) {
				alert(data);
				$("#spanForRmid")
						.html(
								'<b style="font-size:18px;color:blue">' + data
										+ '</b>')

			}
		})
	}

	//ajax 방 확정하고 닫음
	function exit() {
		$.ajax({
			type : 'post',
			url : 'updateConfirmRoom.do',
			data : {
				hoid : $("#hoid").val(),
				uid : $("#uid").val(),
				horegdate : $("#horegdate").val(),
				rmid : $("#rmid").val(),
				did : $("#did").val(),
			},
			success : function(data) {
				opener.location.reload(); //부모페이지 refresh
				window.close();

			}
		})

	}
</script>

<div class="container-fluid">
	<div class="row">		
		<div class="col-sm-6 main">
			
			<div class = "box box-header">
				<h2>입실 확인</h2>
			</div>
			
			<div class="box box-body" >
				<form class="form-horizontal" action=" updateConfirmRoom.do" method="POST">
					<c:forEach items="${here }" var="hh">
						<div class="form-group">
							<label class="control-label col-sm-2">환자번호</label>
							<div class="col-sm-4">							
								<input class="form-control" type="text" id="hoid" name="hoid" value=${hh.hoid} readonly />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">유저아이디</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" id="uid" name="uid" value=${hh.uid} readonly/ >
							</div>
						</div>
							
								
						<div class="form-group">
							<label class="control-label col-sm-2">입실날자</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" id="horegdate" name="horegdate"
									value=${hh.horegdate}>
							</div>
						</div>
							
								
						<div class="form-group">
							<label class="control-label col-sm-2">방아이디</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" id="rmid" name="rmid" value=${hh.rmid }
									onchange="restRoom()"">
								<span id="spanForRmid"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">의사아이디</label>
							<div class="col-sm-4">								
								<input class="form-control" type="text" id="did" name="did" value=${hh.did}>
							</div>
						</div>
						</c:forEach>
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<input class="btn btn-primary" type=button onclick="exit()" value="입원 확정">
							</div>
						</div>
				</form>
			
			</div><!-- box-body -->
						
		</div><!-- /col-sm-9 col-md-10 main -->				
	</div><!-- .row -->
</div><!-- .container-fluid -->