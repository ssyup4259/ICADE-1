<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.textAreaGreen{
	padding-left: 10px;
	border-color: #A3C838;
	color: #8F9493;
	font-size: 16px;
	border: 3px solid #A3C838;
	border-radius: 6px;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 입력</title>

<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">

	 function sendIt(){
		
		f = document.photoReplyForm;
		
		str = f.BC_SUBJECT.value;
		str = str.trim();
		if(!str){
			swal("\n제목을 입력하세요.");
			f.BC_SUBJECT.focus();
			return;
		}
			
		
		f.name.value = str;
		
		/*if(f.email.value){
			
			if(!isValidEmail(f.email.value)){
				swal("\n정상적인 E-Mail을 입력하세요.");
				f.email.focus();
				return;
			}
		} */
		
		str = f.BC_CONTENT.value;
		str = str.trim();
		if(!str){
			swal("\n내용을 입력하세요.");
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
<jsp:include page="../include/header2.jsp" flush="false" />
<div id="" align="center">
	
	<form action="" name="photoReplyForm" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="G_NUM" value="${G_NUM}">
	
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 510px;font-size: 20px">제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd style="float: center; padding-right: 7px;">
					<input type="text" name="BC_SUBJECT" style="width: 33%" maxlength="100" class="inputBoxGreen"/>
				</dd>							
			</dl>		
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 520px;font-size: 20px">작성자</dt>
				<dd style="float: center; padding-right: 7px;">
					<input type="text" name="BC_ID" maxlength="20" class="inputBoxGreen"
					value="${sessionScope.userInfo.getM_ID()}" style="width: 33%"/>
				</dd>							
			</dl>		
		</div>
		
		<div id="bbsCreated_content" >
			<dl>
				<dt style="float: center; padding-right: 510px;font-size: 20px">내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd style="float: center;padding-right: 7px">
					<textarea rows="12" cols="63" name="BC_CONTENT" style="width: 33%" class="textAreaGreen" placeholder="내용을 입력하세요"></textarea>
				</dd>
				<dt style="float: center;padding-right: 260px">
					<input type="file" id="upload" name="bcfile" class="btnGray"><br>
					<input type="file" id="upload1" name="bcfile1" class="btnGray"><br>
					<input type="file" id="upload2" name="bcfile2" class="btnGray"><br>
					<input type="file" id="upload3" name="bcfile3" class="btnGray"><br>
				</dt>							
			</dl>		
		</div>
	</div>	
	
	<div id="bbsCreated_footer" align="center">
	<input type="button" value=" 등록하기 " class="btnGreen" onclick="sendIt();"/>
	<input type="reset" value=" 다시입력 " class="btnGreen" onclick="document.photoReplyForm.subject.focus();"/>
	<input type="button" value=" 작성취소 " class="btnGray" onclick="javascript:location.href='<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}';"/>	
	</div>
	
	</form>
	
</div>
<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>
