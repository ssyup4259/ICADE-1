<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">

	function change(kind) {
		
		if (kind == "email") {
			
			document.getElementById("email_view").style.display = "block";
			document.getElementById("phone_view").style.display = "none";
			
			document.getElementById("M_CELLPHONE1").value = "";
			document.getElementById("M_CELLPHONE2").value = "";
			document.getElementById("M_CELLPHONE3").value = "";
			
			document.getElementById("M_ID").focus();
			
		} else if (kind == "phone") {
			
			document.getElementById("email_view").style.display = "none";
			document.getElementById("phone_view").style.display = "block";
			
			document.getElementById("M_EMAIL_ID").value = "";
			document.getElementById("M_EMAIL_DOMAIN").value = "";
			
			document.getElementById("M_ID").focus();
			
		}
		
	}

</script>

<script type="text/javascript">

function idFind() {
	
	var allData = $("#findPwdForm").serialize();
	
	$("#result").empty();
	
	$.ajax({
		
		type:"post",
		url:"<%=cp%>/find/pwdFind.action",
		datatype:  'json',
		data: allData,
		success: function(data) {
			
			if (data == null || data == "") {
				
				var tag = "정보가 일치하지 않습니다.<br/><br/>";
				
				$("#result").append(tag);
				
			} else {
				
				var tag = "찾으시는 ID의 비밀번호는 '" + data + "' 입니다.<br/><br/>";
				
				$("#result").append(tag);
				
			}
			
		},
		
		error: function(data) {
	
			alert("error");
			alert(data);
			console.log(data);
			
		}				
	});
}

</script>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<div style="margin-left: 15%;">
	<h2>비밀번호 찾기</h2>
</div>

<br/><br/>

<div style="margin: 0 auto; width: 70%">
	<form id="findPwdForm" name="findPwdForm" action="" method="post">
		<fieldset>
			<div style="width: 30%; margin: 0 auto;">
				<br/>
				<div style="padding: 10px 0px 10px 0px; width: 170px; margin: 0 auto;">
					<input id="check_email" name="check" value="2" type="radio" checked="checked" onclick="change('email')">
					<label for="check_email">이메일</label>
					<input id="check_phone" name="check" value="3" type="radio" onclick="change('phone')">
					<label for="check_phone">
						<span style="display: inline;">휴대폰번호</span>
					</label>
				</div>
				
				<div style="margin: 10px 0px 10px 0px;">
					<strong style="margin-right: 20%;">아이디</strong>
					<input type="text" id="M_ID" name="M_ID" class="inputBox" style="width: 257px;" autofocus>
				</div>
				
				<div style="margin: 10px 0px 10px 0px;">
					<strong style="margin-right: 23%;">이름</strong>
					<input type="text" id="M_NAME" name="M_NAME" class="inputBox" style="width: 257px;">
				</div>
				
				<div id="email_view" style="margin: 10px 0px 10px 0px;">
					<strong style="margin-right: 8%;">이메일로 찾기</strong>
					<input id="M_EMAIL_ID" name="M_EMAIL_ID" style="width: 115px;" class="inputBox" fw-filter="isEmail" value="" type="text"> @ 
					<input id="M_EMAIL_DOMAIN" name="M_EMAIL_DOMAIN" style="width: 115px;" class="inputBox" fw-filter="isEmail" value="" type="text">
				</div>
				
				<div id="phone_view" style="margin: 10px 0px 10px 0px; display: none;">
					<strong>휴대폰 번호로 찾기</strong>
					<input id="M_CELLPHONE1" name="M_CELLPHONE1" style="width: 73px;" class="inputBox" maxlength="3" value="" type="text">
					 - 
					<input id="M_CELLPHONE2" name="M_CELLPHONE2" style="width: 73px;" class="inputBox" maxlength="4" value="" type="text">
					 - 
					<input id="M_CELLPHONE3" name="M_CELLPHONE3" style="width: 73px;" class="inputBox" maxlength="4" value="" type="text">
				</div>
				<br/>
				
				<div id="result" style="width: 100%; text-align: center;"></div>
				
				<div style="width: 100%; text-align: center;">
					<input type="button" value="확인" class="btn" onclick="idFind();" style="width: 150px;"/>
				</div>
				<br/>
			</div>
		</fieldset>
	</form>
</div>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>