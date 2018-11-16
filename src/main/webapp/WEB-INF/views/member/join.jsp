<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<title>ICADE 회원가입</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- daum api -->
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
</head>


<body>

	<!-- 본문 시작 -->
	<jsp:include page="../include/header2.jsp" flush="false" />

	<!-- 내용 -->
	<form name="joinForm" action="" method="post" id="joinForm">
		<div class="container-fluid"  style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;text-align: center">
			<div class="container text-center">
				<div class="row">
					<div class="col-sm-6" style="text-align: left;">
						<h2>회원 가입</h2>
						<span style="font-size: 15px; font-weight: 300;">ICADE의 다양한 회원혜택을 받으세요.</span>
					</div>
				</div>
				<hr style="border: 1px solid black;">
				<div class="col-sm-8" style="margin: 0 auto;">
					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							
							아이디
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="text" id="user_Id" class="memberInputBox" placeholder="아이디 : 8글자이상 입력하세요(한글 불가)" name="M_ID" value="" maxlength="30" />
							<br>
							<div class="alert alert-idsuccess" id="alert-idsuccess">
								<font style="color: blue">사용할 수 있는 아이디 입니다</font>
							</div>
							<div class="alert alert-iddanger" id="alert-iddanger">
								<font style="color: red">사용할 수 없는 아이디 입니다</font>
							</div>
							<div class="alert alert-idrefresh" id="alert-idrefresh">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
							<input type="hidden" id="checkId" name="checkId" value="">
						</div>
						<div class="col-sm-2" style="padding-top: 0;">
							<input type="button" value="중복확인" style="width: 120px;" class="btnGray" id="user_id_checkBtn" />
						</div>
					</div>


					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							비밀번호
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="password" name="M_PW" id="pw1" class="memberInputBox" maxlength="30" size="15" placeholder="비밀번호는 8~16자리로 작성해주세요" />
							<br>
							<div class="alert alert-capslock" id="alert-capslock">
								<font style="color: red">capslock키가 켜져 있습니다.</font>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
								비밀번호 확인
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="password" name="M_PWCorre" class="memberInputBox" id="pw2" maxlength="30" size="15" placeholder="작성하신 비밀번호와 일치해야합니다"/>
							<br>
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
							<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							이름
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="text" placeholder="이름 : Ex)박명성" class="memberInputBox" name="M_NAME" id="name" maxlength="10" size="15" />
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							닉네임
						</div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="text" id="user_NickName" class="memberInputBox" placeholder="닉네임 : 2글자 이상 입력하세요" name="M_NICKNAME" maxlength="30" size="15" />
							<br>
							<div class="alert alert-nicksuccess" id="alert-nicksuccess">
								<font style="color: blue">사용할 수 있는 닉네임 입니다</font>
							</div>
							<div class="alert alert-nickdanger" id="alert-nickdanger">
								<font style="color: red">사용할 수 없는 닉네임 입니다</font>
							</div>
							<div class="alert alert-nickfresh" id="alert-nickfresh">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
							<input type="hidden" id="checkNick" name="checkNick" value="">
						</div>
						<div class="col-sm-2">
							<input type="button" class="btnGray" style="width: 120px;" value="중복확인" id="user_nickName_checkBtn" />
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							이메일
						</div>
						<div class="col-sm-4" style="text-align: left;float: left;">
							<input type="text" class="memberInputBox" placeholder="Ex) ssyup4259" id="email1" name="M_EMAIL_ID" maxlength="30" style="width: 100%;margin: 0px;padding: 0px"/>
							<input type="hidden" id="checkEmail" name="checkEmail" value="N">
							<input type="hidden" id="checkNum" name="checkNum" value="0">
						</div>
						<div class="col-sm-1">
						<font style="font-size: 30px;border: 0px">@</font>
						</div>
						<div class="col-sm-3" >
							<!-- <input id="email2" class="memberInputBox" name="M_EMAIL_DOMAIN" placeholder="Ex) hanmail.net" maxlength="30" style="width: 100%;;margin-left: 0px"/> -->
							<select id="email2" name="M_EMAIL_DOMAIN" class="memberInputBox">
			                <option value="" selected="selected">- 이메일 선택 -</option>
			                <option value="naver.com">naver.com</option>
			                <option value="daum.net">daum.net</option>
			                <option value="nate.com">nate.com</option>
			                <option value="hotmail.com">hotmail.com</option> 
			                <option value="yahoo.com">yahoo.com</option>
			                <option value="empas.com">empas.com</option>
			                <option value="korea.com">korea.com</option>
			                <option value="dreamwiz.com">dreamwiz.com</option>
			                <option value="gmail.com">gmail.com</option>
			                <option value="etc">직접입력</option>
			                </select>
						</div>
						<div class="col-sm-2" style="float: right">
							<input type="button" style="width: 120px;" value="중복확인" class="btnGray" id="user_Email_checkBtn" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8" style="float: center;">
							<div class="alert alert-emailsuccess" id="alert-emailsuccess" style="padding-bottom: 10px">
								<font style="color: blue">사용할 수 있는 이메일 입니다</font>
							</div>
							<div class="alert alert-emaildanger" id="alert-emaildanger" style="padding-bottom: 10px;text-align: center">
								<font style="color: red">사용할 수 없는 이메일 입니다</font>
							</div>
							<div class="alert alert-emailfresh" id="alert-emailfresh" style="padding-bottom: 10px">
								<font style="color: red">중복검사를 실행해주세요</font>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8" style="text-align: left;">
							<input type="button" class="btnGray" style="width: 100%;" value="이메일 인증하기" id="" onclick="sendMail();" />
						</div>
						<div class="col-sm-2"></div>
					</div>
					<hr style="border: 1px solid black;">

					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							전화번호
						</div>
						<div class="col-sm-2" style="text-align: left;">

							<input type="text" class="memberInputBox" id="t1" placeholder="Ex) 010" name="M_CELLPHONE1" maxlength="30" size="15" />
						</div>
						<div class="col-sm-3" style="text-align: left;">
							<input type="text" class="memberInputBox" id="t2" placeholder="Ex) 0000" name="M_CELLPHONE2" maxlength="30" size="15" />
						</div>
						<div class="col-sm-3" style="text-align: left;">
							<input type="text" class="memberInputBox" id="t3" placeholder="Ex) 1234" name="M_CELLPHONE3" maxlength="30" size="15" />
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="margin-top: 11px">
							주소
						</div>
						<div class="col-sm-3" style="text-align: left">
							<input type="text" class="memberInputBox" name="M_ZIPCODE" readonly="readonly" placeholder="우편번호" id="sample6_postcode">
						</div>
						<div class="col-sm-5" style="text-align: left">
							<input type="text" class="memberInputBox" name="M_ADDRESS1" readonly="readonly" placeholder="주소" id="sample6_address">
						</div>
						<div class="col-sm-2">
							<input type="button" onclick="sample6_execDaumPostcode()" style="width: 120px;" class="btnGray" value="우편번호 찾기">
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8" style="text-align: left">
							<input type="text" class="memberInputBox" name="M_ADDRESS2" placeholder="상세주소" id="sample6_address2">
						</div>
					</div>
					<div class="row"></div>
				</div>
				<div class="col-sm-4"></div>
				<hr style="border: 1px solid black;">
				<div style="text-align: center; padding-bottom: 15px;">
					<input type="button" class="btnGreen" id="singUpBtn" value="회원가입" style="width: 200px; height: 40px;" onclick="" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btnGreen" value="취소" style="width: 200px; height: 40px" onclick="javascript:location.href='<%=cp%>'">
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../include/footer.jsp" flush="false" />

	<!-- 본문 끝 -->

	<!-- ---------------------------------------------------------------------------------------------------------------------- -->

	<!-- 스크립트 부분 -->

	<script>
$("#alert-idsuccess").hide();
$("#alert-iddanger").hide();
$("#alert-idrefresh").hide();

$("#alert-nicksuccess").hide();
$("#alert-nickdanger").hide();
$("#alert-nickfresh").hide();

$("#alert-emailsuccess").hide();
$("#alert-emaildanger").hide();
$("#alert-emailfresh").hide();


$(document).ready(function() {
	
	$("#user_Id").change(function() {
		
		$('#checkId').val('2');
		$("#alert-idsuccess").hide();
		$("#alert-idrefresh").show();
		
	});
});

$(document).ready(function () {
	
	$("#checkNiCK,#user_NickName").change(function() {
		
		$('#checkNick').val('2');
		$("#alert-nicksuccess").hide();
		$("#alert-nickfresh").show();
	});
});


$(document).ready(function () {
	$("#checkEmail,#email1,#email2").change(function() {
		
		$('#checkEmail').val('2');
 		$("#alert-emailsuccess").hide();
		$("#alert-emailfresh").show();
		$("#alert-emaildanger").hide();
	});
	
});
</script>

	<!-- 아이디확인 -->
	<script>
		$("#alert-idsuccess").hide();
		$("#alert-iddanger").hide();
		$("#alert-refresh").hide();
	
	 	//한글입력방지
		 $("#user_Id").keyup(function(event){
		    if (!(event.keyCode >=37 && event.keyCode<=40)) {
		        var inputVal = $(this).val();
		        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		    }
		}); 
		//중복체크 버튼을 누를시 이벤트 발생
		$(document).ready(function() {
			$("#user_id_checkBtn").unbind("click").click(function(e) {
				e.preventDefault();
				idCheck();		
			});
		});

	
	function idCheck() {
		
		var userId =$("#user_Id").val();
		//var checkId =$("#checkId").val();
		
		//유효성검사
		if(userId.length <1){
			swal("아이디를 입력해주세요.");
		}else if(userId.length<8){
			swal("아이디는 8자리 이상으로 입력해주세요")
		}else if(userId.length>16){
			swal("아이디는 16자리 이하로 입력해주세요")
		}else{
			$.ajax({
				type : "POST",
				url : "/icade/member/idcheck.action",
				data : {"M_ID":userId},
				dataType : "json",
				error : function (error) {
					console.log(error.responseText);
				},
				success : function(result) {
					if (result == 0) {
						$("#alert-idsuccess").show();
						$("#alert-iddanger").hide(); 
						$("#alert-idrefresh").hide();
						
						$('input[id=checkId]').attr('value','1'	);
						
					}else if(result ==1 ){
						$("#alert-idsuccess").hide();
						$("#alert-iddanger").show();
						
					}else{
						alert("에러가 발생했습니다.");
					}
				}
			});
		} 	
	}

</script>
	<!-- 아이디 중복확인 끝 -->

	<!-- 비밀번호 일치확인  -->
	<script>
//capslock 검사

  $("#alert-capslock").hide();

    function caps_lock(e) {
            var keyCode = 0;
            var shiftKey = false;
            keyCode = e.keyCode;
            shiftKey = e.shiftKey;
            if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                    || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
                show_caps_lock();
                setTimeout("hide_caps_lock()", 3500);
            } else {
                hide_caps_lock();
            }
        }
 
    function show_caps_lock() {
         $("#alert-capslock").show();
    }
 
    function hide_caps_lock() {
         $("#alert-capslock").hide();
    }
    
	//한글입력방지
	 $("#pw1").keyup(function(event){
	    if (!(event.keyCode >=37 && event.keyCode<=40)) {
	        var inputVal = $(this).val();
	        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	    }
	}); 
	 $("#pw2").keyup(function(event){
		    if (!(event.keyCode >=37 && event.keyCode<=40)) {
		        var inputVal = $(this).val();
		        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		    }
		}); 
 $(function () {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		
		var pw1 =$("#pw1").val();
		var pw2 =$("#pw2").val();
		
		 if (pw1 !="" || pw2 != ""){		
			if (pw1 ==pw2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
			}
		}
	});
});
</script>
	<!-- 비밀번호 일치확인  끝-->

	<!-- 닉네임 중복확인 시작 -->
	<script>

$("#alert-nicksuccess").hide();
$("#alert-nickdanger").hide();
$("#alert-nickfresh").hide();

$(document).ready(function() {
	$("#user_nickName_checkBtn").unbind("click").click(function(e) {
		e.preventDefault();
		nickCheck();		
	});
});

function nickCheck() {
	
	var userNick =$("#user_NickName").val();
	var checkNick =$("#checkNick").val();
	
	if (userNick.length <1) {
		swal("닉네임을 입력해주세요.")
	}else if(userNick.length<2){
		swal("닉네임은 최소 2글자 이상입니다.")
	}else if(userNick.length>12){
		swal("닉네임은 12글자 이하입니다.")
	}else{
		$.ajax({
			type : "POST",
			url : "/icade/member/nickcheck.action",
			data : {"M_NICKNAME" : userNick},
			dataType :"json",
			error : function(error) {
				alert("서버가 응답하지 않습니다");
				console.log(e.resposneText);
			},
			success : function(result) {
				if (result==0) {
					$("#alert-nicksuccess").show();
					$("#alert-nickdanger").hide();
					$("#alert-nickfresh").hide();
					$('input[id=checkNick]').attr('value','1');
				}else if(result==1){
					$("#alert-nicksuccess").hide();
					$("#alert-nickdanger").show();
				}else{
					alert("에러가 발생했습니다.");					
				}
			}
		});
	}
}

</script>
	<!-- 닉네임 중복확인 끝 -->

	<!-- 다음 api를 활용한 주소확인 -->
	<script type="text/javascript">

  function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>

<!-- 이메일 중복 및 정규식 확인 -->
<script>
$("#alert-emailsuccess").hide();
$("#alert-emaildanger").hide();
$("#alert-emailfresh").hide();

$(document).ready(function(){
    $('#email2').change(function(){
        var email = $("#email2").val(); //id선택자로 email select box값 추출하여 저장
        var check = $("#checkNum").val();
        $("#checkNum").val("0");
        if(email == "etc"){ //selectbox value가 etc이면
            $("#email2").replaceWith("<input type='text' id='email2' name='M_EMAIL_DOMAIN' placeholder='직접입력' class='memberInputBox'>");
            //selectbox 태그를 input 태그로 변경
        }
    });
});


$(document).ready(function() {
	$("#user_Email_checkBtn").unbind("click").click(function(e) {
		e.preventDefault();
		check();		
	});
});

function check() {		

	var email1 =document.getElementById("email1").value; 
	var email2 =document.getElementById("email2").value; 
	var email = email1+ "@" + email2;

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(email)==false){

		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

		swal("이메일 형식이 올바르지 않습니다.");

		document.joinForm.email2.focus();

		return false;

	}

	emailCheck();
}

 function emailCheck() { 

	var email1 =$("#email1").val();
	var email2 =$("#email2").val();
	var checkEmail =$("#checkEmail").val();
	
	var f= document.joinForm;
	
	var allData = {"M_EMAIL_ID" : email1,"M_EMAIL_DOMAIN" : email2}
	
	if (email1.length < 1) {
		swal("이메일을 입력해주세요")
		f.M_EMAIL_ID.focus();
	}
	if (email2.length < 1) {
		swal("정확한 형식을 기입해주세요.")
		f.M_EMAIL_DOMAIN.focus();
	}else{
	  $.ajax({
			type : "POST",
			url : "/icade/member/emailcheck.action",
			data : allData,
			dataType :"json",
			error : function(error) {
				swal("서버가 응답하지 않습니다");
			},
			success : function(result) {
				if (result==0) {
					$("#alert-emailsuccess").show();
					$("#alert-emaildanger").hide();
					$("#alert-emailfresh").hide();
					$("#checkEmail").attr('value','1');
				}else if(result==1){
					$("#alert-emailsuccess").hide();
					$("#alert-emaildanger").show();
					$("#alert-emailfresh").hide();
				}else{
					alert("에러가 발생했습니다.");					
				}
			}
		});
	}
} 
 </script>


<!-- 이메일 보내기 -->
<script>
 	function sendMail(email1,email2){
 		
		
		var email1 =document.getElementById("email1").value; 
		var email2 =document.getElementById("email2").value; 
		var email = email1+ "@" + email2;
		
		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange =function(){
			if (xhttp.readyState == 4 ) {
				if (xhttp.status == 200) {
					/* swal("등록하신 이메일로 인증번호를 발송했습니다."); */
				}else{
					/* swal("메일발송 실패"); */
				}
			}			
		}; 
		xhttp.open("POST","<%=cp%>/sendMail.action",true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xhttp.send("email=" + email);
		
		//팝업창 열기
		window.open("<%=cp%>/sendMail_ok.action","이메일 인증","width=400, height=300, left=100,top=50");
	}  
</script>

	<!-- 회원가입 완료 -->
	<script type="text/javascript">

$(document).ready(function(){
	$("#singUpBtn").unbind("click").click(function(e) {
		e.preventDefault();
		signUp();
	});
});

//회원가입 유효성 검사
function signUp() {
	
		var f = document.joinForm;
		var pw1 = $("#pw1").val()
		var pw2 = $("#pw2").val()
		
	if ($("#user_Id").val().length<1) {
		swal("아이디를 작성해주세요");
		 $('#user_Id').focus();
		 
	}else if($("#user_Id").val().length<8){
		swal("아이디는 8자리 이상으로 입력해주세요")
		$('#user_Id').focus();
		
	}else if($("#user_Id").val().length>16){
		swal("아이디는 16자리 이하로 입력해주세요")
		$('#user_Id').focus();
		
	}else if($("#pw1").val().length<1){
		swal("비밀번호를 작성해주세요");
		$('#pw1').focus();
		
	}else if ($("#pw1").val().length<8 ){
		swal("비밀번호는 8자리 이상으로 작성해주세요");
		$('#pw1').focus(); 
		
	}else if($("#pw1").val().length>16){
		swal("비밀번호는 16자리 이하로 작성해주세요");
		$('#pw1').focus();
		
	}else if($("#pw2").val().length<1){
		swal("비밀번호 확인을 작성해주세요");
		$('#pw2').focus();
	}else if($("#pw2").val() != $("#pw1").val()){
		swal("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$('#pw2').focus();
	}else if($("#name").val().length<1){
		swal("이름을 작성해주세요");
		$('#name').focus();
		
	}else if($("#name").val().length<1){
		swal("이름을 최소 1자리 이상 입력해주세요.");
		$('#name').focus();
		
	}else if($("#user_NickName").val().length<1){
		swal("닉네임을 작성해주세요");
		$('#user_NickName').focus();
		
	}else if($("#user_NickName").val().length<2){
		swal("닉네임은 최소 2글자 이상입니다.");
		$('#user_NickName').focus();
		
	}else if($("#user_NickName").val().length>12){
		swal("닉네임은 12글자 이하입니다.");
		$('#user_NickName').focus();
		
	}else if($("#email1").val().length<1){
		swal("이메일을 작성해주세요");
		$('#email1').focus();
		
	}else if($("#email2").val().length<1){
		swal("이메일을 작성해주세요");
		$('#email1').focus();
		
	}else if($("#t1").val().length<1){
		swal("전화번호를 작성해주세요");
		$('#t1').focus();
		
	}else if($("#t1").val().length<2){
		swal("전화번호를 최소 한 자리 이상 입력해주세요");
		$('#t1').focus();
		
	}else if($("#t1").val().length>5){
		swal("전화번호 형식에 맞지 않습니다. 다시 입력해주세요")
		$('#t1').focus();
		
	}else if($("#t2").val().length<1){
		swal("전화번호를 작성해주세요");
		$('#t2').focus();
		
	}else if($("#t2").val().length<2){
		swal("전화번호를 최소 한 자리 이상 입력해주세요");
		$('#t1').focus();
		
	}else if($("#t2").val().length>5){
		swal("전화번호 형식에 맞지 않습니다. 다시 입력해주세요")
		$('#t2').focus();
		
	}else if($("#t3").val().length<1){
		swal("전화번호를 작성해주세요");
		$('#t3').focus();
		
	}else if($("#t3").val().length<2){
		swal("전화번호를 최소 한 자리 이상 입력해주세요");
		$('#t3').focus();
		
	}else if($("#t3").val().length>5){
		swal("전화번호 형식에 맞지 않습니다. 다시 입력해주세요")
		$('#t3').focus();
		
	}else if($("#sample6_postcode").val().length<1){
		swal("우편번호를 작성해주세요");
		
	}else if($("#sample6_address").val().length<1){
		swal("상세주소를 작성해주세요");
		$('#sample6_address').focus();
		
	}else if($("#checkId").val() == 2){
		swal("아이디 중복검사를 해주세요");
		
	}else if($("#checkNick").val() == 2){
		swal("닉네임 중복검사를 해주세요");
		
	}else if($("#checkEmail").val() == 2){
		swal("이메일 중복검사를 해주세요");
	}else if($("#checkNum").val() != 1){
		swal("이메일 인증을 완료해주세요")
	}else if($("#sample6_address2").val().length<1){
		swal("상세주소를 작성해주세요");
		$('#sample6_address2').focus();
	}else{
		var email1 =document.getElementById("email1").value; 
		var email2 =document.getElementById("email2").value; 
		var email = email1+ "@" + email2;
		
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(email)==false){

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

			swal("이메일 형식이 올바르지 않습니다.");

			f.email2.focus();

			return false;

		}
		

		f.action= "<%=cp%>/member/join_ok.action";
		f.submit();

			}
		}
	</script>



</body>
</html>
