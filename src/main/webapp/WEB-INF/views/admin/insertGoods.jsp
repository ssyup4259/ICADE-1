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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>

<title>상품 등록 화면</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script src="<%=cp%>/resources/data/js/fileBox.js"></script>

<!-- 상품등록하기 버튼 submit -->
<script type="text/javascript">

function insertIt() {
	
	var f = document.gInsertForm;
    
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
    
    str = f.gFile.value;
    str = str.trim();
    if(!str) {
        swal("이미지를 선택해주세요.");
        f.gFile.focus();
        return;
    }
        
	f.action = "<%=cp%>/admin/insertGoods.action";
	f.submit();
	
}

</script>

<!-- 체크박스관련 -->
<script type="text/javascript">

//기종 체크박스 선택시 색상 표시
function toggleShow (checkbox) {
	
	var id = document.getElementById(checkbox).value;
	var divId = "D" + id;
	
	var subCats = document.all ? document.all[id] :	document.getElementById ? document.getElementById(id) :	null;
	
	if (subCats) {
		
		
		if (document.getElementById(divId).style.display == '' || document.getElementById(divId).style.display == 'none')
			document.getElementById(divId).style.display = 'block'; 
		else 
			document.getElementById(divId).style.display = 'none';
		
	}
	
}


//색상 체크박스 선택시 텍스트박스 활성화
function enableTextBox(name) {
	
	var txtBox = document.getElementById(name);
	
	if (txtBox.disabled == true) {
		txtBox.disabled = false;
	} else {
		txtBox.value = "";
		txtBox.disabled = true;
	}
	
}



</script>

</head>
<body>

<jsp:include page="../include/header2.jsp" flush="false" />

<form action="" name="gInsertForm" method="POST" enctype="multipart/form-data">

<table style="width: 55%; margin: auto;">

	<colgroup>
	    <col style="width: 20%;"/>
	    <col style="width: 80%;"/>
	</colgroup>

	<tr>
		<td colspan="2">
			<h1>상품등록</h1>
		</td>
	</tr>
	
	<tr>
		<td>상품 종류</td>
		<td align="left">
			<c:forEach var="gk_dto" items="${gk_lists}">
				<c:if test="${gk_dto.GK_NUM == 1}">
					<input type="radio" id="A${gk_dto.GK_NUM}" name="GD_KIND_NUM" value="${gk_dto.GK_NUM}" checked="checked"/>
					<label for="A${gk_dto.GK_NUM}"><span></span>&nbsp;${gk_dto.GK_KIND}</label>
				</c:if>
				<c:if test="${gk_dto.GK_NUM > 1}">
					<input type="radio" id="A${gk_dto.GK_NUM}" name="GD_KIND_NUM" value="${gk_dto.GK_NUM}"/>
					<label for="A${gk_dto.GK_NUM}"><span></span>&nbsp;${gk_dto.GK_KIND}</label>
				</c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>상품 이름</td>
		<td align="left">
			<input type="text" name="G_NAME" class="inputBoxGreen"/>
		</td>
	</tr>
	<tr>
		<td>상품 가격</td>
		<td align="left">
			<input type="text" name="G_PRICE" class="inputBoxGreen" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>원
		</td>
	</tr>
	<tr>
		<td>지원 기종</td>
		<td align="left">
			<c:forEach var="dk_dto" items="${dk_lists}">
				<input type="checkbox" id="${dk_dto.DK_CODE}" name="GD_DEVICE" value="${dk_dto.DK_CODE}" onclick="toggleShow('${dk_dto.DK_CODE}')"/>
				<label for="${dk_dto.DK_CODE}">
					<span></span>&nbsp;${dk_dto.DK_NAME}
				</label>
				<br/>
				<div id="D${dk_dto.DK_CODE}" class="subCats" style="display: none; width: 100%;">
					<c:forEach var="gc_dto" items="${gc_lists}">
						<input type="checkbox" id="${dk_dto.DK_CODE}${gc_dto.GC_CODE}" name="${dk_dto.DK_CODE}_GD_COLOR" value="${gc_dto.GC_CODE}" onclick="enableTextBox('${dk_dto.DK_CODE}_${gc_dto.GC_CODE}')"/>
						<label for="${dk_dto.DK_CODE}${gc_dto.GC_CODE}">
							<span></span>&nbsp;${gc_dto.GC_COLOR}
						</label>
						<input type="text" id="${dk_dto.DK_CODE}_${gc_dto.GC_CODE}" class="inputBoxGreen" name="${dk_dto.DK_CODE}_GD_COUNT" size="3" disabled="disabled" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
					</c:forEach>
					<br/><br/>
				</div>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>상품 설명 사진</td>
		<td align="left">
			<div class="filebox bs3-primary preview-image1">
				<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
				<label for="input_file">업로드</label> 
				<input type="file" name="gFile2" placeholder="클릭후 이미지를 업로드해 주세요" id="input_file" class="upload-hidden"/>
				<input type="hidden" name="G_CONTENT" value=""/>
			</div>
		</td>
	</tr>
	<tr>
		<td>할인율</td>
		<td align="left">
			<input type="text" name="G_DISCOUNT" class="inputBoxGreen" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" value="0"/>%
		</td>
	</tr>
	<tr>
		<td>상품 사진</td>
		<td align="left">
			<div class="filebox bs3-primary preview-image2">
				<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
				<label for="input_file2">업로드</label> 
				<input type="file" name="gFile" placeholder="클릭후 이미지를 업로드해 주세요" id="input_file2" class="upload-hidden"/>
				<input type="hidden" name="G_CONTENT" value=""/>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="btnGray" onclick="insertIt()" value="상품등록">
			<input type="reset" class="btnGray" value=" 다시입력 " onclick="document.gInsertForm.G_NAME.focus();"/>
			<input type="button" class="btnGray" onclick="javascript:history.back();" value="취 소"/>
		</td>
	</tr>
</table>

</form>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>