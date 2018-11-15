//쿠키 저장
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    
    exdate.setDate(exdate.getDate() + exdays);
    
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    
    document.cookie = cookieName + "=" + cookieValue;
}

//쿠키 불러오기
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

$(function(){
    var userId = getCookie("Cookie_userid");
    $("#userId").val(userId);
    
    if($("#userId").val() != "")
        $("#saveId").attr("checked", true);
});
 
function loginProcess(){
    var id = $("#userId").val();
    var pw = $("#userPw").val();
    var loginForm = document.getElementById('loginForm');
    var checker = loginIdCheck(id,pw);
    
    if(!id){
    	swal("아이디를 입력해주세요.");
        id.focus();
        return;
    }else if(!pw){
    	swal("비밀번호를 입력해주세요.");
        password.focus();
        return;
    }else if(checker){
    	swal("아이디 혹은 비밀번호가 틀립니다");
        id.focus();
        return;
    }else if($("#saveId").is(":checked")){
        var userId = $("#userId").val();
        setCookie("Cookie_userid", userId, 30);
        loginForm.submit();
    }else{
    	var expireDate = new Date();
    	expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = "Cookie_userid= " + "; expires=" + expireDate.toGMTString();
        loginForm.submit();
    }
}

	function loginIdCheck(id,pw) {
		var checker;

		$.ajax({
			type : "POST",
			url : "loginCheckAjax.action",
			data : {"M_PW" : pw,"M_ID" : id},
			async: false,
			dataType : "json",
			error : function(error) {
				swal(error);
			},
			success : function(data) {
				checker = data;
			}
		});
		return checker;
	}


/*
   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "dnvfDSWWZdZLlC4W0n7E",
         callbackUrl: "http://localhost:8080/icade/callbackTest",
         isPopup: false,  팝업을 통한 연동처리 여부 
         loginButton: {color: "green", type: 1, height: 60}  로그인 버튼의 타입을 지정 
      }
   );
   
   naverLogin.init();

*/










