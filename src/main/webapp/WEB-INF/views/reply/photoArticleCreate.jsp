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
<title>포토리뷰 작성하기</title>

<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
	$("#goodsInfo").hide();


	 function sendPhotoCreate(){
		
		f = document.photoInsertForm;
		
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
		
		
		fileUpload = $("#prUpload").val();
		
		if (prUpload.length<1) {
			swal("메인사진을 등록해주세요");
			f.bcfile.focus();
			return;
		}
		
		
		

		f.action = "<%=cp%>/goods/photoInsertData_ok.action?replyPageNum=${replyPageNum}";
		f.submit();
		
	}
	 function photoGoodsSearch() {
		 
		 var data = $("#searchForm").serialize();
		 
		 $.ajax({
				type :"get",
				data : data,
				url : "<%=cp%>/goods/searchGoodsList.action?curPage="+1,
				success:function(result){
						 $("#searchList").html(result); 
						$('#searchList').show();
				},
				error: function(result) {
					swal("안된다");
		 	    }
		     });
		}

</script>

<script type="text/javascript">
	function insertReplySearchGoods(num) {
		
		var searchUser = $("#searchUser").val();
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/searchGoodsList.action?curPage="+num+"&searchValue="+searchUser,
			 success : function(result) {
				 $("#searchList").html(result);
			}
		 });
	}


</script>

<script src="<%=cp%>/resources/data/js/fileBox.js"></script>
</head>
<body>
<jsp:include page="../include/header2.jsp" flush="false" />
<div id="" align="center" style="float: center;padding-right: 30px">
	<form action="" name="searchForm" id="searchForm" method="post">
		<input type="hidden" name="replyPageNum"  value="${replyPageNum}"/>
		<div style="float: center; padding-right: 480px;font-size: 20px">
		 	상품정보선택
		</div>
		<div style="float: center;padding-left: 32px">
			<input type="text" name="searchValue" class="inputBoxGray" id="searchUser" style="width: 21%;" placeholder="검색할 단어를 입력해주세요.">&nbsp;&nbsp;
			<input type="button" value=" 검색 " class="btnGreen" onclick="photoGoodsSearch();" style="width: 11%;padding-bottom: 2px;text-align: center" />
		</div>
	</form>
	
	<div id="searchList"></div>
	
	<form  name="photoInsertForm" method="post" enctype="multipart/form-data">
	
	<div id="photoCreted">
		<div  class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 500px;font-size: 20px" >상품정보</dt>
				<dd id="goodsInfo">
					<input type="text"  id="photoG_NAME" name="G_NAME" style="width: 33%" maxlength="100" class="inputBoxGreen" value=""/>
					<br>
					<input type="hidden" id="photoG_NUM" name="G_NUM" style="width: 33%" maxlength="100" class="inputBoxGreen" value=""/>
				</dd>							
			</dl>		
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 500px;font-size: 20px">제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd style="float: center; padding-right: 7px;">
					<input type="text" name="BC_SUBJECT" style="width: 33%" maxlength="100" class="inputBoxGreen" placeholder="제목을 입력해주세요" />
				</dd>							
			</dl>		
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt style="float: center; padding-right: 495px;font-size: 20px">작&nbsp;성&nbsp;자</dt>
				<dd style="float: center; padding-right: 7px;">
					<input type="text" name="BC_ID" style="width: 33%" maxlength="100" class="inputBoxGreen" 
					value="${sessionScope.userInfo.getM_ID()}"/>
				</dd>							
			</dl>		
		</div>
		
		<div id="bbsCreated_content" >
			<dl>
				<dt style="float: center; padding-right: 500px;font-size: 20px">내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd style="float: center; padding-right: 7px;">
					<textarea rows="12" cols="63" name="BC_CONTENT" class="textAreaGreen" style="width: 33%" placeholder="내용을 입력하세요"></textarea>
				</dd>
				<dd style="float: center; padding-right: 260px;">
				<div class="filebox bs3-primary preview-image1">
				메인사진 :
					<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
					<label for="prUpload">업로드</label> 
					<input type="file"  name="bcfile" id="prUpload" class="upload-hidden"><br>
				</div>
				<div class="filebox bs3-primary preview-image2">
				내용사진 :
					<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
					<label for="prUpload1">업로드</label> 
					<input type="file"  name="bcfile1" id="prUpload1" class="upload-hidden"><br>
				</div>
				<div class="filebox bs3-primary preview-image3">
				내용사진 :
					<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
					<label for="prUpload2">업로드</label> 
					<input type="file"  name="bcfile2" id="prUpload2" class="upload-hidden"><br>
				</div>
				<div class="filebox bs3-primary preview-image4">
				내용사진 :
					<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
					<label for="prUpload3">업로드</label> 
					<input type="file"  name="bcfile3" id="prUpload3" class="upload-hidden"><br>
				</div>
				</dd>							
			</dl>		
		</div>
		
	</div>	
	
	<div id="bbsCreated_footer" align="center" style="margin-left: 80px">
		<input type="button" value=" 등록하기 " class="btnGreen" onclick="sendPhotoCreate();"/>
		<input type="reset" value=" 다시입력 " class="btnGray" onclick="document.searchForm.subject.focus();"/>
		<input type="button" value=" 작성취소 " class="btnGray"onclick="javascript:location.href='<%=cp%>/goods/replyAllList.action?replyPageNum=${replyPageNum}';"/>	
	</div>
	
	</form>
	
</div>
<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>
