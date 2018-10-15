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
<title>상품 등록 화면</title>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 상품등록하기 버튼 submit -->
<script type="text/javascript">

function sendIt() {
	
	var f = document.myForm;
    
    str = f.G_NAME.value;
    str = str.trim();
    if(!str) {
        alert("상품명을 입력하세요.");
        f.G_NAME.focus();
        return;
    }
    f.G_NAME.value = str;
    
    str = f.G_PRICE.value;
    str = str.trim();
    if(!str) {
        alert("상품의 가격을 입력해주세요.");
        f.G_PRICE.focus();
        return;
    }
    f.G_PRICE.value = str;
    
    str = f.G_CONTENT.value;
    str = str.trim();
    if(!str) {
        alert("상품의 설명을 입력해주세요.");
        f.G_CONTENT.focus();
        return;
    }
    f.G_CONTENT.value = str;
	
    str = f.gFile.value;
    str = str.trim();
    if(!str) {
        alert("이미지를 선택해주세요.");
        f.gFile.focus();
        return;
    }
        
	f.action = "<%=cp%>/admin/insertGoods.action";
	f.submit();
	
}

</script>

<!-- 상품종류 셀렉트박스 -->
<!-- <script type="text/javascript">

function showSub(obj) {

    var f = document.myForm;

    if(obj == 900) {
    
        f.SUB1.style.display = "";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "none";

    } else if (obj == 901) {

        f.SUB1.style.display = "none";
        f.SUB2.style.display = "";
        f.SUB3.style.display = "none";

    } else if (obj == 902) {
    	
    	f.SUB1.style.display = "none";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "";
        
    } else {
		
    	f.SUB1.style.display = "none";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "none";
    	
	}
    
}

</script> -->

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

<h3>상품등록 테스트</h3>

<form action="" name="myForm" method="POST" enctype="multipart/form-data">

상품 종류 : 
<!-- <select onChange="showSub(this.options[this.selectedIndex].value);">
	<option>선택해주세요</option>
	<option value="900">케이스</option>
	<option value="901">필름</option>
	<option value="902">액세서리</option>
</select> -->


<!-- <select name="SUB1" style="display: none;">
	<option>선택해주세요</option>
	<option value="1">기본 케이스</option>
	<option value="2">주문제작 케이스</option>
</select> -->


<!-- <select name="SUB2" style="display: none;">
	<option value="3">필름</option>
</select> -->


<!-- <select name="SUB3" style="display: none;">
	<option>선택해주세요</option>
	<option value="4">셀카봉/삼각대</option>
	<option value="5">케이블/충전기</option>
	<option value="6">이어폰</option>
</select> -->

<c:forEach var="gk_dto" items="${gk_lists}">
	<c:if test="${gk_dto.GK_NUM == 1}">
		<label><input type="radio" name="GD_KIND_NUM" value="${gk_dto.GK_NUM}" checked="checked"/>${gk_dto.GK_KIND}</label>
	</c:if>
	<c:if test="${gk_dto.GK_NUM > 1}">
		<label><input type="radio" name="GD_KIND_NUM" value="${gk_dto.GK_NUM}"/>${gk_dto.GK_KIND}</label>
	</c:if>
</c:forEach>

<br/>
상품 이름 : <input type="text" name="G_NAME"/> <br/>
상품 가격 : <input type="text" name="G_PRICE" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>원 <br/>
지원 기종 : <br/>

<c:forEach var="dk_dto" items="${dk_lists}">

	<label><input type="checkbox" id="${dk_dto.DK_CODE}" name="GD_DEVICE" value="${dk_dto.DK_CODE}" onclick="toggleShow('${dk_dto.DK_CODE}')"/>${dk_dto.DK_NAME}</label><br/>
	
	<div id="D${dk_dto.DK_CODE}" class="subCats" style="display: none;">
	
		<c:forEach var="gc_dto" items="${gc_lists}">
		
			<label>
			<input type="checkbox" name="${dk_dto.DK_CODE}_GD_COLOR" value="${gc_dto.GC_CODE}" onclick="enableTextBox('${dk_dto.DK_CODE}_${gc_dto.GC_CODE}')"/>
			${gc_dto.GC_COLOR}
			</label>
			<input type="text" id="${dk_dto.DK_CODE}_${gc_dto.GC_CODE}" name="${dk_dto.DK_CODE}_GD_COUNT" size="3" disabled="disabled" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
				
		</c:forEach>
		
	<br/><br/>
	
	</div>

</c:forEach>

<br/>
상품 설명 : <textarea rows="30" cols="50" name="G_CONTENT"></textarea> <br/>
할인율 : <input type="text" name="G_DISCOUNT" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>% <br/>
상품 사진 : 
<input type="file" name="gFile" placeholder="클릭후 이미지를 업로드해 주세요" onchange="change();"/> <br/>

<input type="button" onclick="sendIt()" value="상품등록">
<input type="reset" value=" 다시입력 " onclick="document.myForm.G_NAME.focus();"/>
<input type="button" onclick="javascript:location.href='<%=cp%>';" value="취 소"/>

</form>


</body>
</html>