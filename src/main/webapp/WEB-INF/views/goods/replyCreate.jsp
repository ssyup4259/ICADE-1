<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 입력</title>

<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">

	 function sendIt(){
		
		f = document.myForm;
		
		str = f.BC_SUBJECT.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.BC_SUBJECT.focus();
			return;
		}
			
		
		f.name.value = str;
		
		/*if(f.email.value){
			
			if(!isValidEmail(f.email.value)){
				alert("\n정상적인 E-Mail을 입력하세요.");
				f.email.focus();
				return;
			}
		} */
		
		str = f.BC_CONTENT.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.BC_CONTENT.value = str;

		f.action = "<%=cp%>/goods/replyinsert_ok.action";
		f.submit();
		
	}

</script>

</head>
<body>

<div id="bbs">
	
	<form action="" name="myForm" method="post" enctype="multipart/form-data">
	
	<input type="text" name="G_NUM" value="${G_NUM}">
	
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd>
					<input type="text" name="BC_SUBJECT" size="74" maxlength="100" class="boxTF"/>
				</dd>							
			</dl>		
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>
					<input type="text" name="BC_ID" size="35" maxlength="20" class="boxTF"
					value="${sessionScope.userInfo.getM_ID()}"/>
				</dd>							
			</dl>		
		</div>
		
		<div id="bbsCreated_content" >
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
					<textarea rows="12" cols="63" name="BC_CONTENT" class="boxTA"></textarea>
				</dd>							
			</dl>		
		</div>
		<input type="file" id="upload" name="bcFile"><br>
		<input type="file" id="upload1" name="bcFile1"><br>
		<input type="file" id="upload2" name="bcFile2"><br>
		<input type="file" id="upload3" name="bcFile3"><br>
	</div>	
	
	<div id="bbsCreated_footer">
	<input type="button" value=" 등록하기 " class="btn2" onclick="sendIt();"/>
	<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();"/>
	<input type="button" value=" 작성취소 " class="btn2"onclick="javascript:location.href='<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}';"/>	
	</div>
	
	</form>
	
</div>

</body>
</html>
