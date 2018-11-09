<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 본인 인증</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

	function changInfoAuthorization_sendIt() {
		
		var f = document.myForm;
		var mode = $("#mode").val();
		
		if(mode=="changeInfo"){
			f.action = "changeInfo.action";
			f.submit();
		}else if(mode=="cancelMembership"){	
			f.action = "cancelCheckStep1.action";
			f.submit();
		}
		
		if(!mode){
			swal("mode가 널이다");
		}
		
	}

</script>
</head>
<body>
<form action="" method="post" name="myForm">

${mode}

<input type="hidden" id="mode" value="${mode}">

<table border="1" style="margin-left: auto; margin-right: auto;">
	<tr >
		<td >
			아이디 : ${sessionScope.userInfo.getM_ID()}
			비밀번호 : <input type="password" name="M_PW">
		</td>
		<td rowspan="2">
			<input type="button" value="본인인증" onclick="changInfoAuthorization_sendIt();">
		</td>
	</tr>
	<tr>
		<td align="center">
			${msg }
		</td>
	</tr>
</table>
<br/>

<br/>

</form>


</body>
</html>