<%@ page language="java"
 contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

 	String cp  = request.getContextPath();
 %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원정보수정" />
<meta name="Description" content="회원정보수정" />
<title>회원정보수정</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- daum api -->
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>

</head>


<body onload="msgView();">



<!-- 본문 시작 -->
<h1>정보수정양식</h1>
 	<span style="font-size:15px;font-weight:300;">icade의 다양한 혜택을 즐기세요</span>

<form name="infoChange" action="" method="post">

<input type="hidden" value="${msg}" id="msg">

<table>

	<!-- 아이디입력 -->
	<tr>
		<td width="100" align="center">
			<h4>아이디</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" id="user_Id" name="M_ID" value="${sessionScope.userInfo.getM_ID()}" readonly="readonly" maxlength="10" size="15" style="padding-left:10px; width: 280px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
	</tr>
	
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>	
	
	<!-- 비밀번호 입력 -->
	
	<tr>
		<td width="100" align="center">
			<h4>패스워드</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="password" name="M_PW" id="pw1"  maxlength="10" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
	</tr>
	
	
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>	
	
	<!-- 비밀번호 확인 -->
	<tr>
		<td width="100" align="center">
		 	<h4>패스워드 확인</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
		 	 <input type="password" name="M_PWCorre" id="pw2" maxlength="10" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		 	 <br>
		 	 <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
		 	 <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
		</td>
	</tr>
	
	
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td >
	</tr>
	
	
	<!-- 이름 -->
	<tr>
		<td width="100" align="center">
			<h4>이름</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" value="${sessionScope.userInfo.getM_NAME()}" name="M_NAME" readonly="readonly" maxlength="10" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
	</tr>
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
	
	<tr>
		<td width="100" align="center">
			<h4>닉네임</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" id="user_NickName" value="${sessionScope.userInfo.getM_NICKNAME()}" name="M_NICKNAME" value="" maxlength="10" size="15" style="padding-left:10px; width: 280px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
			<td><a href="#" id="user_nickName_checkBtn" class="btn">중복확인</a>
		</td>
	</tr>
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
	
	<tr>
		<td width="100" align="center">
			<h4>이메일</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text"  value="${sessionScope.userInfo.getM_EMAIL_ID()}" id="email1"  name="M_EMAIL_ID" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
		
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" value="${sessionScope.userInfo.getM_EMAIL_DOMAIN()}" id="email2"  name="M_EMAIL_DOMAIN" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
		<td><input type="button" value="인증하기" onclick="checkMail();"/></td>
		
		<!-- <td><a href="#" id="user_Email_checkBtn" class="btn">중복확인</a>
		</td> -->
		 <br>
		 <div></div>
			
	</tr>
	<tr id="joincode">
		<th>인증번호</th>
		<td>
			<input type='number' name="inputCode" id="inputCode" class="form-control" style="margin-right: 10px; width:300px;" placeholder="Enter code"/ >
			<input type="button" value="확인" class="btn btn-primary btn-sm" onclick="checkJoinCode();">
		</td>
	
	</tr>
	

	
	<tr height="3">
		<td colspan="4" bgcolor="#cccccc"></td>
	</tr>
	
	<tr>
		<td width="100" align="center">
			<h4>전화번호</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" value="${sessionScope.userInfo.getM_CELLPHONE1()}" name="M_CELLPHONE1" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />-
		</td>
		
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" value="${sessionScope.userInfo.getM_CELLPHONE2()}" name="M_CELLPHONE2" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />-
		</td>
		
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" value="${sessionScope.userInfo.getM_CELLPHONE3()}" name="M_CELLPHONE3" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>			
	</tr>
	
	<tr height="3">
		<td colspan="4" bgcolor="#cccccc"></td>
	</tr>
	
	<h3>추가정보</h3>
	<tr>
		<td>
			<input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기">
		</td>
		<td style="padding-left: 5px;">
			<input type="text" name="M_ZIPCODE" class="form-control" value="${sessionScope.userInfo.getM_ZIPCODE()}" id="sample6_postcode"  style="padding-left:10px; width: 130px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px">
		</td>
		<td>
			<input type="text" name="M_ADDRESS1" class="form-control" value="${sessionScope.userInfo.getM_ADDRESS1()}" id="sample6_address" style="padding-left:10px; width: 260px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px">
		</td>
	</tr>
	
	<tr>
		<td colspan="3">
			<input type="text" name="M_ADDRESS2" class="form-control" value="${sessionScope.userInfo.getM_ADDRESS2()}" id="sample6_address2" style="padding-left:10px; width: 520px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px">
		</td>
	</tr>
	
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="button" value="정보수정" style="width: 200px;" height="40px" onclick="sendIt();"/>
    <input type="button" value="취소" style="width: 200px; height: 40px" onclick="javascript:location.href='<%=cp%>'">
</div>
</form>
<!-- 본문 끝 -->

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- 스크립트 부분 -->
<!-- 아이디 중복확인 -->
<script >
	$(document).ready(function() {
		$("#user_id_checkBtn").unbind("click").click(function(e) {
			e.preventDefault();
			idCheck();			
		});
	});
	
/* function idCheck() {
	
	var userId =$("#user_Id").val();
	
	if(userId.length <1){
		alert("아이디를 입력해주세요.");
	}else{
		$.ajax({
			type : "POST",
			async : false,
			url : "/icade/idcheck.action",
			data : {"M_ID":userId},
			dataType : "json",
			error : function (error) {
				alert("서버가 응답하지 않습니다");
			},
			success : function(result) {
				if (result == 0) {
					alert("사용 가능한 아이디입니다");
				}else if(result ==1 ){
					alert("이미 존재하는 아이디입니다.");
				}else{
					alert("에러가 발생했습니다.");
				}
			}
		});
	}
} */

</script>
<!-- 아이디 중복확인 끝 -->

<!-- 비밀번호 일치확인 자바스크립트 -->
<script>
 $(function () {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		
		var pw1 =$("#pw1").val();
		var pw2 =$("#pw2").val();
		
		if (pw1 !="" || pw2 != "") {
			
			if (pw1 ==pw2) {
				
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled",disabled);
			}
		}
	});
});
</script>
<!-- 비밀번호 일치확인  끝-->

<!-- 닉네임 중복확인 시작 -->
<script >
$(document).ready(function() {
	$("#user_nickName_checkBtn").unbind("click").click(function(e) {
		e.preventDefault();
		nickCheck();		
	});
});

function nickCheck() {
	
	var userNick =$("#user_NickName").val();
	
	if (userNick.length <1) {
		alert("닉네임을 입력해주세요.")
	}else{
		$.ajax({
			type : "POST",
			async : false,
			url : "/icade/nickcheck.action",
			data : {"M_NICKNAME" : userNick},
			dataType :"json",
			error : function(error) {
				alert("서버가 응답하지 않습니다");
			},
			success : function(result) {
				if (result==0) {
					alert("사용가능한 닉네임 입니다");
				}else if(result==1){
					alert("이미 존재하는 닉네임입니다")
				}else{
					alert("에러가 발생했습니다.");					
				}
			}
		});
	}
}

</script>
<!-- 닉네임 중복확인 끝 -->

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


<!-- 이메일 확인 -->
<script type="text/javascript">
/*
$(document).ready(function() {
	$("#user_nickName_checkBtn").unbind("click").click(function(e) {
		e.preventDefault();
		nickCheck();		
	});
});
 function nickCheck() {
	
	var params = $("#email").val() +""
	
	if (userEmail.length <1) {
		alert("닉네임을 입력해주세요.")
	}else{
		$.ajax({
			type : "POST",
			url : "/icade/mailcheck.action",
			data : {"" : userNick},
			dataType :"json",
			error : function(error) {
				alert("서버가 응답하지 않습니다");
			},
			success : function(result) {
				if (result==0) {
					alert("사용가능한 닉네임 입니다");
				}else if(result==1){
					alert("이미 존재하는 닉네임입니다")
				}else{
					alert("에러가 발생했습니다.");					
				}
			}
		});
	}
} */
	
	function checkMail(email1,email2){
		
		var email1 =document.getElementById("email1").value; 
		var email2 =document.getElementById("email2").value; 
	
		var email = email1+ "@" + email2; 
			
		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange =function(){
			if (xhttp.readyState == 4 ) {
				if (xhttp.status== 200) {
					alert("메일을 정상적으로 보냈습니다.");
				}else{
					alert("올바른 메일 형식이 아닙니다.");
				}
				
			}			
			
		};
		xhttp.open("POST","checkCode.action",true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8")
		xhttp.send("email=" + email);
		return false;
	}
	
	function checkJoinCode() {
		
		
	}
	
</script>

<script type="text/javascript">

	function msgView() {
		
		var msg =document.getElementById("msg").value;
		
		if(!msg){
			
			//alert("if문 탔다");
			
			//alert(msg);
			
		}else{
		
			//alert("else 탄경우");
			
			alert(msg);	
		}
		
		
	}

</script>

<!-- 정보수정 완료 -->
<script type="text/javascript">
	
	function sendIt() {
	
		var f = document.infoChange;
		
		f.action = "<%=cp%>/changeInfo_ok.action";
		f.submit();
		
	} 
</script>
</body>
</html>
