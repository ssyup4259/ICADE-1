//cp 대용
var cp = getContextPath();

function getContextPath() {

    return sessionStorage.getItem("contextpath");

}

$(document).ready(function () {
	
	$("#checkNiCK,#user_NickName").change(function() {
		
		$('#checkNick').val('2');
		$("#alert-nickfresh").css("display","");
	});
});


$(document).ready(function () {
	$("#checkEmail,#email1,#email2").change(function() {
		
		$('#checkEmail').val('2');
		
 		$("#alert-emailequals").css("display","none");
 		$("#alert-emailsuccess").css("display","none");
 		$("#alert-emaildanger").css("display","none");
 		$("#alert-emailfresh").css("display","");
 		
	});
	
});

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
						$("#alert-idsuccess").css("display","");
						$('input[id=checkId]').attr('value','1'	);
					}else if(result ==1 ){
						$("#alert-iddanger").css("display","");
					}else{
						alert("idCheck 에러가 발생했습니다.");
					}
				}
			});
		} 	
	}

//capslock 검사

	function caps_lock(event) {
        var keyCode = 0;
        var shiftKey;
        
        keyCode = event.keyCode;
        shiftKey = event.shiftKey;
        
        if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
        	$("#alert-capslock").css("display","");
        } else {
        	$("#alert-capslock").css("display","none");
        }
    }



$(function () {
	$("#alert-success").css("display","none");
	$("#alert-danger").css("display","none");
	$("input").keyup(function() {
	
	var pw1 =$("#pw1").val();
	var pw2 =$("#pw2").val();
	
		if (pw1 !="" || pw2 != ""){		
			if (pw1 ==pw2) {
				$("#alert-success").css("display","");
				$("#alert-danger").hide();
			}else{
				$("#alert-danger").css("display","");
				$("#alert-success").hide();
			}
		 }
	});
});

//비밀번호 일치확인  끝

//닉네임 중복확인 시작


 $(document).ready(function() {
 	$("#user_nickName_checkBtn").unbind("click").click(function(e) {
 		e.preventDefault();
 		nickCheck();		
 	});
 });

 function nickCheck() {
 	
	var userNick =$("#user_NickName").val();
	var checkNick =$("#checkNick").val();
	var userSessionNick = $("#user_NickName_session").val();
	
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
				
				if(userSessionNick==userNick){
					$("#alert-nickequals").css("display","");
					$("#alert-nicksuccess").css("display","none");
					$("#alert-nickdanger").css("display","none");
					$("#alert-nickfresh").css("display","none");
					$('input[id=checkNick]').attr('value','1');
				}else if(result==0) {
					$("#alert-nickequals").css("display","none");
					$("#alert-nicksuccess").css("display","");
					$("#alert-nickdanger").css("display","none");
					$("#alert-nickfresh").css("display","none");
					$('input[id=checkNick]').attr('value','1');
				}else if(result==1){
					$("#alert-nicksuccess").css("display","none");
					$("#alert-nickdanger").css("display","");
				}else{
					alert("에러가 발생했습니다.");					
				}
			}
		});
	}
}

//닉네임 중복확인 끝

//다음 api를 활용한 주소확인 -->
function sample6_execDaumPostcode() {
	new daum.Postcode({
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



//이메일 중복 및 정규식 확인

$("#alert-emailsuccess").hide();
$("#alert-emaildanger").hide();
$("#alert-emailfresh").hide();

$(document).ready(function(){
	$('#email2').change(function(){
		var email = $('#email2').val(); //id선택자로 email select box값 추출하여 저장
		var check = $("#checkNum").val();//이메일 도메인 부분 바꿀시 다시 인증 받도록 초기화
        $("#checkNum").val("0");

        if(email == 'etc'){ //selectbox value가 custom이면
			$("#email2").replaceWith("<input type = 'text' class='memberInputBox' id='email2' placeholder='직접입력'>");
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

	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var checkEmail = $("#checkEmail").val();
	var Sessionid = $("#Sessionid").val();
	var Sessiondomain = $("#Sessiondomain").val();
	var f= document.joinForm;
	
	var allData = {"M_EMAIL_ID" : email1,"M_EMAIL_DOMAIN" : email2}
	
	if (email1.length < 1) {
		swal("이메일을 입력해주세요")
		$("#email1").focus();
	}
	if (email2.length < 1) {
		swal("정확한 형식을 기입해주세요.")
		$("#email2").focus();
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
				if(email2==Sessiondomain){
					$("#alert-emailequals").css("display","");
					$("#alert-emailsuccess").css("display","none");
					$("#alert-emaildanger").css("display","none");
					$("#alert-emailfresh").css("display","none");
					$("#checkEmail").attr('value','1');
				}else if(result==0){
					$("#alert-emailequals").css("display","none");
					$("#alert-emailsuccess").css("display","");
					$("#alert-emaildanger").css("display","none");
					$("#alert-emailfresh").css("display","none");
					$("#checkEmail").attr('value','1');
				}else if(result==1){
					$("#alert-emailequals").css("display","none");
					$("#alert-emailsuccess").css("display","none");
					$("#alert-emaildanger").css("display","");
					$("#alert-emailfresh").css("display","none");
				}else{
					alert("에러가 발생했습니다.");					
				}
			}
		});
	}
} 

//이메일 보내기 -->
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
		xhttp.open("POST",cp+"/sendMail.action",true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xhttp.send("email=" + email);
		
		//팝업창 열기
		window.open(cp+"/sendMail_ok.action","이메일 인증","width=400, height=300, left=100,top=50");
			
		
	} 
 
 	
//회원가입 완료

$(document).ready(function(){
	$("#singUpBtn").unbind("click").click(function(e) {
		e.preventDefault();
		signUp();
	});
});

//회원가입 유효성 검사
function signUp() {
	
	var f = document.joinForm;
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var Sessionid = $("#Sessionid").val();
	var Sessiondomain = $("#Sessiondomain").val();
	
	if ($("#user_Id").val().length<1) {
		swal("아이디를 작성해주세요");
		 $('#user_Id').focus();
		 return;
	}else if($("#user_Id").val().length<8){
		swal("아이디는 8자리 이상으로 입력해주세요")
		$('#user_Id').focus();
		return;
	}else if($("#user_Id").val().length>16){
		swal("아이디는 16자리 이하로 입력해주세요")
		$('#user_Id').focus();
		return;
	}else if($("#pw1").val().length<1){
		swal("비밀번호를 작성해주세요");
		$('#pw1').focus();
		return;
	}else if ($("#pw1").val().length<8 ){
		swal("비밀번호는 8자리 이상으로 작성해주세요");
		$('#pw1').focus(); 
		return;
	}else if($("#pw1").val().length>16){
		swal("비밀번호는 16자리 이하로 작성해주세요");
		$('#pw1').focus();
		return;
	}else if($("#pw2").val().length<1){
		swal("비밀번호 확인을 작성해주세요");
		$('#pw2').focus();
		return;
	}else if($("#pw2").val() != $("#pw1").val()){
		swal("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$('#pw2').focus();
		return;
	}else if($("#name").val().length<1){
		swal("이름을 작성해주세요");
		$('#name').focus();
		return;
	}else if($("#name").val().length<1){
		swal("이름을 최소 1자리 이상 입력해주세요.");
		$('#name').focus();
		return;
	}else if($("#user_NickName").val().length<1){
		swal("닉네임을 작성해주세요");
		$('#user_NickName').focus();
		return;
	}else if($("#user_NickName").val().length<2){
		swal("닉네임은 최소 2글자 이상입니다.");
		$('#user_NickName').focus();
		return;
	}else if($("#user_NickName").val().length>12){
		swal("닉네임은 12글자 이하입니다.");
		$('#user_NickName').focus();
		return;
	}else if($("#email1").val().length<1){
		swal("이메일을 작성해주세요");
		$('#email1').focus();
		return;
	}else if($("#email2").val().length<1){
		swal("이메일을 작성해주세요");
		$('#email1').focus();
		return;
	}else if($("#t1").val().length<1){
		swal("전화번호를 작성해주세요");
		$('#t1').focus();
		return;
	}else if($("#t1").val().length<2){
		swal("전화번호를 최소 한 자리 이상 입력해주세요");
		$('#t1').focus();
		return;
	}else if($("#t1").val().length>5){
		swal("전화번호 형식에 맞지 않습니다. 다시 입력해주세요")
		$('#t1').focus();
		return;
	}else if($("#t2").val().length<1){
		swal("전화번호를 작성해주세요");
		$('#t2').focus();
		return;
	}else if($("#t2").val().length<2){
		swal("전화번호를 최소 한 자리 이상 입력해주세요");
		$('#t1').focus();
		return;
	}else if($("#t2").val().length>5){
		swal("전화번호 형식에 맞지 않습니다. 다시 입력해주세요")
		$('#t2').focus();
		return;
	}else if($("#t3").val().length<1){
		swal("전화번호를 작성해주세요");
		$('#t3').focus();
		return;
	}else if($("#t3").val().length<2){
		swal("전화번호를 최소 한 자리 이상 입력해주세요");
		$('#t3').focus();
		return;
	}else if($("#t3").val().length>5){
		swal("전화번호 형식에 맞지 않습니다. 다시 입력해주세요")
		$('#t3').focus();
		return;
	}else if($("#sample6_postcode").val().length<1){
		swal("우편번호를 작성해주세요");
		return;
	}else if($("#sample6_address").val().length<1){
		swal("상세주소를 작성해주세요");
		$('#sample6_address').focus();
		return;
	}else if($("#sample6_address2").val().length<1){
		swal("상세주소를 작성해주세요");
		$('#sample6_address2').focus();
		return;
	}else if($("#checkId").val() == 2){
		swal("아이디 중복검사를 해주세요");
		return;
	}else if($("#checkNick").val() == 2){
		swal("닉네임 중복검사를 해주세요");
		return;
	}else if($("#checkEmail").val() == 2){
		swal("이메일 중복검사를 해주세요");
		return;
	}else if(email1==Sessionid && email2==Sessiondomain){
		$("#checkNum").val("1");
	}else if($("#checkNum").val() != 1){
		swal("이메일 인증을 완료해주세요")
		return;
	}
		
	f.action= cp + "/changeInfo_ok.action";
	f.submit();

	
}

