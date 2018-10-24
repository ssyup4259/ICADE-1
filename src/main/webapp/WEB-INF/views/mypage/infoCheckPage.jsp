<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 본인 인증</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	function sendIt() {
		
		var msg = $("#msg").val();
		var f = document.myForm;
		
		if(msg){
			alert(msg);
		}else{
			f.action="infoCheckPage_ok.action";
			f.submit();
		}
		
	}

</script>
</head>
<body>
<form action="" method="post" name="myForm">

<input type="hidden" id="mode" name="mode" value="${mode}">
<input type="hidden" id="msg" name="msg" value="${msg}">

<table border="1" style="margin-left: auto; margin-right: auto;">
	<tr >
		<td rowspan="2">
			아이디 : ${sessionScope.userInfo.getM_ID()}
			비밀번호 : <input type="password" name="M_PW" id="pw">
		</td>
		<td>
			<input type="button" value="본인인증" onclick="sendIt();">
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="취소" onclick="location.href='myPage.action';">
		</td>
	</tr>
</table>
<br/>

<br/>

</form>

<script type="text/javascript">

$("#pw").keyup(function(event){
	var pw = $("#pw").val();
	
	//alert(pw);
	
	$.ajax({
		type : "POST",
		url : "testAjax.action",
		data : {"pw":pw},
		dataType :"json",
		error : function(error) {
			alert(error);
		},
		success : function(data) {
			if(data==false){
				//alert("false : " + data);
				$("#msg").val("비밀번호가 틀립니다.");
			}else if(data==true){
				$("#msg").empty();
			}
		}
	});
});

</script>
</body>
</html>