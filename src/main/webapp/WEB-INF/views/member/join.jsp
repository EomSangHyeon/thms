<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 전체 */
* {
	margin: auto;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

body {
	background: #eee !important;
}

.form-join {
	max-width: 800px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-join-heading
	{
	margin-bottom
	:
	30px;
}
}
</style>

<script type="text/javascript">
	function checkInfo() {

		var id1 = $("#uid").val();
		var pw1 = document.getElementById("upw1").value;
		var pw2 = document.getElementById("upw2").value;
		var bir1 = $("#ubirth").val();

		var check_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //영문, 숫자 혼합하여 6~20자리 이내

		/*아이디 검사*/
		if (id1.search(/\s/) != -1) {
			alert("아이디는 공백이 없어야말 하겠지요??")
			$('#uid').focus();
			return false;
		}

		/*비번 검사*/

		if (pw1 != pw2) {
			alert("위의 비밀번호와 같지 않습니다");
			$('#upw1').focus();
			return false;
		}

		if (pw1.search(/\s/) != -1) {
			alert("비밀번호는 공백업이 입력해주세요.");
			return false;
		}

		if (!check_pwd.test(pw1)) {
			alert("비밀번호 영문,숫자 혼합하여 6~20자리이내");
			$('#upw1').focus();
			return false;
		}
		/*주민번호 검사*/
		if (bir1.length != 6) {
			alert("주민번호 앞자리는 6자리입니다")
			$('#bir1').focus();
			return false;
		}
		if (bir1.search(/\s/) != -1) {
			alert("주민번호는 공백이 없어야말 하겠지요??")
			$('#bir1').focus();
			return false;
		}

		if (passnick == 1) {
			alert("닉네임  중복확인을 해주세요.");
			alert(passnick);
			return false;
		}
		if (passid == 1) {
			alert("아이디 중복 확인 해주세요");
			return false;
		}

	}
	var passid;
	var passnick;

	function cUid() {

		$.ajax({
			type : 'post',
			url : 'checkId',
			dataType : 'text',
			data : {
				id1 : $("#uid").val()
			},
			success : function(data) {
				if (data == "O") {
					passid = 2;

				} else {
					passid = 1;

				}

				$('#divcheckuid')
						.html(
								'<b style="font-size:18px;color:blue">' + data
										+ '</b>')
			}
		})

	};

	function cUnick() {
		$.ajax({
			type : 'post',
			url : 'checkId',
			dataType : 'text',
			data : {
				unick : $("#unick").val()
			},
			success : function(data) {
				if (data == "O") {

					passnick = 2;

				} else {
					passnick = 1;

				}
				$('#divchecknick')
						.html(
								'<b style="font-size:18px;color:blue">' + data
										+ '</b>')
			}
		})
	};
	var temp;
	function ajaxsend() {
		alert("인증");
		$
				.ajax({
					type : 'post',
					url : 'ajaxsend',
					dataType : 'text',
					data : {
						uemail : $("#uemail").val()
					},
					success : function(data) {
						alert("이메일을 확인해주세요.");
						alert(data);

						$('#confirmajax1').html(
								'<b style="font-size:18px;color:red">'
										+ " 인증번호 입력" + '</b>');

						$('#confirmajax2')
								.html(
										"<input type='text' id='checknumber'required='required'>  "
												+ "<input type='button' class='btn btn-primary'  id='checkbtn' value='번호확인' onclick='ajaxconfirm()'> ")
						temp = data;
					}

				})
	}

	function ajaxconfirm() {
		alert("들어옴");

		if ($("#checknumber").val() == temp) {
			alert("인증되었습니다")
		} else {
			alert("일치하지 않습니다")
		}

	}

</script>

<div class="wrapper">

	<!--  onsubmit submit하기전에 뒤에꺼 실행 후 submit  return 값이 true일때만 전송  메소드 이름앞에 return을 붙일것.-->
	<!-- onchange 변화가 있을때  -->
	<form action="join" method="POST" onsubmit="return checkInfo()"
		class="form-join">
		<h2 class="form-join-heading">회원가입</h2>

		<label>아이디</label>

		<div class="form-group">
			<input type="text" name="uid" class="form-control" id="uid"
				required="required" onchange="cUid()" autofocus="autofocus" /> <span
				id="divcheckuid"></span>
		</div>


		<label>닉네임</label>
		<div class="form-group">
			<input type="text" class="form-control" name="unick" id="unick"
				required="required" onchange="cUnick()"> <span
				id="divchecknick"></span>
		</div>

		<label>이름</label>
		<div class="form-group">
			<input type="text" name="uname" id="uname" required="required"
				class="form-control">
		</div>
		<label>비밀번호</label>
		<div class="form-group">
			<input type="password" name="upw" id="upw1" required="required"
				placeholder="6~20자리 영문자 혼합" class="form-control">
		</div>
		<label>비밀번호 재확인</label>
		<div class="form-group">
			<input type="password" name="upw2" id="upw2" required="required"
				placeholder="6~20자리 영문자 혼합" class="form-control">
		</div>
		<label>전화번호</label>
		<div class="form-group">
			<input type="text" name="utel" id="utel" required="required"
				placeholder="- 없이 입력" class="form-control">
		</div>
		<label>생년월일</label>
		<div class="form-group">
			<input type="text" name="ubirth" id="ubirth" required="required"
				class="form-control">
		</div>
		<div class="form-group">
			<label>이메일</label>
			<div class="input-group">
				<input type="text" name="uemail" id="uemail" required="required"
					class="form-control"> <span class="input-group-btn">
					<button class="btn btn-primary" onclick="ajaxsend()">
						메일인증발송<i class="fa fa-check spaceLeft"></i>
					</button>
				</span>
			</div>
		</div>
		<div id="confirmajax1" name="confirmajax1"></div>
		<div id="confirmajax2" name="confirmajax2"></div>


		<label>성별</label>
		<div class="form-group">
			<div class="gender" id="ugender" style="padding-left: 5px">
				<label><input type="radio" name="ugender" value="man"
					required="required" />남</label> &nbsp;&nbsp; <label><input
					type="radio" value="woman" name="ugender" required="required" />여</label>
			</div>
		</div>
		<button class="btn btn-primary" type="submit">
			회원가입<i class="fa fa-check spaceLeft"></i>
		</button>
		<button class="btn btn-warning" type="reset">
			취소 <i class="fa fa-times spaceLeft"></i>
		</button>
	</form>
</div>

<%@ include file="../include/footer.jsp"%>
