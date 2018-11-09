<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포토후기</title>
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

	 function updateSend(){
		
		f = document.updateForm;
		
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
				alert("\n정상적인 E-Mail을 입력하세요.");
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

		f.action = "<%=cp%>/goods/replyUpdate_ok.action";
		f.submit();
		
	}

</script>

</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
<div id="" align="center" style="float: center;padding-right: 30px">
	<form action="" name="updateForm" method="post" enctype="multipart/form-data">
	
	<div id="bbs">
	
	<input type="hidden" name="BC_BOARD" value="${bc_dto.getBC_BOARD()}">
	<input type="hidden" name="BC_NUM" value="${bc_dto.getBC_NUM()}">
	
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 510px;font-size: 20px">제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd style="float: center; padding-right: 7px;">
					<input type="text" name="BC_SUBJECT" value="${bc_dto.getBC_SUBJECT()}" size="74" maxlength="100" class="inputBoxGreen"/>
				</dd>							
			</dl>		
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 515px;font-size: 20px">작성자</dt>
				<dd style="float: center; padding-right: 7px;">
					<input type="text" name="BC_ID" size="74" maxlength="20" class="inputBoxGreen"
					value="${sessionScope.userInfo.getM_ID()}"/>
				</dd>							
			</dl>		
		</div>
		
		<div id="bbsCreated_content" >
			<dl>
				<dt style="float: center; padding-right: 510px;font-size: 20px">내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd style="float: center; padding-right: 7px;">
					<textarea rows="12" cols="63" name="BC_CONTENT" class="textAreaGreen" style="width: 33%">${bc_dto.getBC_CONTENT()}</textarea>
				</dd>							
			</dl>		
		</div>
		<div id="bbsCreated_image" >
			<dl>
				<dt style="float: center; padding-right: 510px;font-size: 20px">사&nbsp;&nbsp;&nbsp;&nbsp;진</dt>
					<dd style="float: center; padding-right: 300px;" >
						<input type="file"  name="bcfile" class="btnGray"><br>
						${bc_dto.getBC_IMAGE()}
					</dd>
					<dd style="float: center; padding-right: 300px;" >							
						<input type="file"  name="bcfile1"class="btnGray"><br>
						${bc_dto.getBC_CONTENTFILE1()}
					</dd>
					<dd style="float: center; padding-right: 300px;" >
						<input type="file"  name="bcfile2"class="btnGray"><br>
						${bc_dto.getBC_CONTENTFILE2()}
					</dd>
					<dd style="float: center; padding-right: 300px;" >
						<input type="file"  name="bcfile3"class="btnGray"><br>
						${bc_dto.getBC_CONTENTFILE3()}
					</dd>
			</dl>		
		</div>
		
	</div>	
	
	<div  align="center" style="padding-left: 60px">
	<input type="button" value="수정하기" class="btnGreen" onclick="updateSend();"/>
	<input type="reset" value="다시입력" class="btnGray" onclick="document.updateForm.subject.focus();"/>
	<input type="button" value="작성취소" class="btnGray"onclick="javascript:location.href='<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}&#section3';"/>	
	</div>
	
	</div>
	</form>
	</div>
<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>
