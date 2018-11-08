<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포토후기 작성</title>

<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


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

		f.action = "<%=cp%>/goods/photoInsertData_ok.action";
		f.submit();
		
	}
	 function photoGoodsSearch() {
		 
		 var data = $("#searchForm").serialize();
		 
		 $.ajax({
				type :"post",
				data : data,
				url : "<%=cp%>/goods/searchGoodsList.action",
				success:function(result){
						 $("#searchList").html(result); 
						$('#searchList').css('visibility','visible');
				},
				error: function(result) {
					alert("안된다");
		 	    }
		     });
		 
		 
			
			<%-- var f = document.searchForm;
			
			f.action = "<%=cp%>/ikeloom/list.do";

			f.submit(); --%>

		}

</script>
<script type="text/javascript">
	function dataHandler(G_NAME,G_NUM) {
		
		$("#photoG_NAME").val(G_NAME);
		$("#photoG_NUM").val(G_NUM);
		
	}

</script>

</head>
<body>

<div id="bbs">
	<form action="" name="searchForm" id="searchForm" method="post">
		<div>
		 	상품정보선택
		</div>
		<div >
			<input type="text" name="searchValue" class="inputBoxGray" style="width: 400px;" placeholder="검색한 단어를 입력해주세요.">
			<input type="button" value=" 검색 " class="btnGreen" onclick="photoGoodsSearch();" style="width: 150px;" />
		</div>
	</form>
	
	<div id="searchList"></div>
	
	<form action="" name="photoInsertForm" method="post" enctype="multipart/form-data">
	
	<div id="bbsCreated">
		<div  class="bbsCreated_bottomLine">
			<dl>
				<dt>상품정보</dt>
				<dd id="goodsInfo">
					<input type="text" id="photoG_NAME" name="G_NAME" size="74" maxlength="100" class="boxTF" value=""/>
					<input type="text" id="photoG_NUM" name="G_NUM" size="74" maxlength="100" class="boxTF" value=""/>
				</dd>							
			</dl>		
		</div>
		
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
		<input type="file" id="upload" name="bcfile"><br>
		<input type="file" id="upload1" name="bcfile1"><br>
		<input type="file" id="upload2" name="bcfile2"><br>
		<input type="file" id="upload3" name="bcfile3"><br>
	</div>	
	
	<div id="bbsCreated_footer">
		<input type="button" value=" 등록하기 " class="btn2" onclick="sendPhotoCreate();"/>
		<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();"/>
		<input type="button" value=" 작성취소 " class="btn2"onclick="javascript:location.href='<%=cp%>/goods/goodsArticle.action?G_NUM=${g_dto.getG_NUM()}';"/>	
	</div>
	
	</form>
	
</div>

</body>
</html>
