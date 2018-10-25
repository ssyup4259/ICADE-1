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

//쿠키 삭제
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
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
    
    if(!id){
        alert("Enter ID");
        id.focus();
        return false;
    }else if(!pw){
        alert("Enter password");
        password.focus();
        return false;
    }else if($("#saveId").is(":checked")){
        var userId = $("#userId").val();
        setCookie("Cookie_userid", userId, 30);
        loginForm.submit();
    }else{
        deleteCookie("Cookie_userid");
        loginForm.submit();
    }
}
