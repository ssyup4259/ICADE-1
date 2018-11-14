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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<title>상품 수정 화면</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=cp%>/resources/data/js/fileBox.js"></script>

<!-- 상품수정하기 버튼 submit -->
<script type="text/javascript">

function goodsUpdateIt() {
	
	var f = document.updateGoodsForm;
    
    str = f.G_NAME.value;
    str = str.trim();
    if(!str) {
        swal("상품명을 입력하세요.");
        f.G_NAME.focus();
        return;
    }
    f.G_NAME.value = str;
    
    str = f.G_PRICE.value;
    str = str.trim();
    if(!str) {
        swal("상품의 가격을 입력해주세요.");
        f.G_PRICE.focus();
        return;
    }
    f.G_PRICE.value = str;
    
	f.action = "<%=cp%>/admin/updateGoods.action";
	f.submit();
	
	window.opener.top.location.reload();
	
	$.ajax({
		url : 'sub/data.json',
		type : 'get', dataType : 'json',
		success : function () { window.close(); },
		error : function () { window.close(); }
	});

	
}



</script>

</head>
<body>

<h3>상품수정 테스트</h3>

<form action="" name="updateGoodsForm" method="POST" enctype="multipart/form-data">

<input type="hidden" name="G_NUM" value="${g_dto.getG_NUM()}"/>
상품 종류 : ${g_dto.getGK_KIND()} <br/>
상품 이름 : <input type="text" name="G_NAME" value="${g_dto.getG_NAME()}" class="inputBoxGreen"/> <br/>
상품 가격 : <input type="text" name="G_PRICE" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" value="${g_dto.getG_PRICE()}" class="inputBoxGreen">원 <br/>
<div style="display: none;">상품 설명 : <textarea rows="30" cols="50" name="G_CONTENT" class="textAreaGreen">${g_dto.getG_CONTENT()}</textarea></div>
상품 설명 사진 : 
<div class="filebox bs3-primary preview-image1">
	<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
	<label for="input_file">업로드</label> 
	<input type="file" name="gFile2" placeholder="클릭후 이미지를 업로드해 주세요" id="input_file" class="upload-hidden"/>
	<input type="hidden" name="G_CONTENT" value=""/>
</div>
할인율 : <input type="text" name="G_DISCOUNT" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" value="${g_dto.getG_DISCOUNT()}" class="inputBoxGreen"/>% <br/>
상품 사진 : 
<div class="filebox bs3-primary preview-image2">
	<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
	<label for="input_file2">업로드</label> 
	<input type="file" name="gFile" placeholder="클릭후 이미지를 업로드해 주세요" id="input_file2" class="upload-hidden"/>
	<input type="hidden" name="G_CONTENT" value=""/>
</div>

<input type="button" onclick="goodsUpdateIt();" value="상품수정" class="btnGray">
<input type="button" onclick="javascript:window.close();" value="취 소" class="btnGray"/>

</form>


</body>
</html>