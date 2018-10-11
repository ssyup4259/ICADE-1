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
<title>Insert title here</title>

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

<script type="text/javascript">

function showSub(obj) {

    var f = document.myForm;

    if(obj == 1) {
    
        f.SUB1.style.display = "";
        f.SUB2.style.display = "none";

    } else if (obj == 2) {

        f.SUB1.style.display = "none";
        f.SUB2.style.display = "";

    } else {
    	
    	f.SUB1.style.display = "none";
        f.SUB2.style.display = "none";
        
    }
}

</script>

</head>
<body>

<h3>상품등록 테스트</h3>

<form action="" name="myForm" method="POST" enctype="multipart/form-data">

상품 종류 : 
<select onChange="showSub(this.options[this.selectedIndex].value);">
	<option>선택해주세요</option>
	<option value="1">케이스</option>
	<option>필름</option>
	<option value="2">액세서리</option>
</select>
 
<select name="SUB1" style="display: none;">
	<option value="">선택해주세요</option>
	<option value="">일반케이스</option>
	<option value="">주문제작 케이스</option>
</select>

<select name="SUB2" style="display: none;">
	<option value="">선택해주세요</option>
	<option value="">셀카봉/삼각대</option>
	<option value="">케이블/충전기</option>
	<option value="">이어폰</option>
</select>
<br/>
상품 이름 : <input type="text" name="G_NAME"/> <br/>
상품 가격 : <input type="text" name="G_PRICE"/> <br/>
지원 기종 : <br/>
<label><input type="checkbox" name=""  value=""/>전체</label>&nbsp;<br/>
<c:forEach var="dk_dto" items="${dk_lists}">

	<label><input type="checkbox" name="${dk_dto.DK_CODE}" value="${dk_dto.DK_CODE}"/>${dk_dto.DK_NAME}</label>&nbsp;<br/>

</c:forEach>
<label><input type="checkbox" name=""  value=""/>아이폰5s</label>&nbsp;
<label><input type="checkbox" name=""  value=""/>아이폰6/6s</label>&nbsp;
<label><input type="checkbox" name=""  value=""/>아이폰6s+</label>&nbsp;
<label><input type="checkbox" name=""  value=""/>아이폰7/7s</label>&nbsp;
<label><input type="checkbox" name=""  value=""/>아이폰7s+</label>&nbsp;
<label><input type="checkbox" name=""  value=""/>아이폰8/8s</label>&nbsp;
<label><input type="checkbox" name=""  value=""/>아이폰8s+</label>&nbsp;

<br/>
상품 설명 : <textarea rows="30" cols="50" name="G_CONTENT"></textarea> <br/>
할인율 : <input type="text" name="G_DISCOUNT"/> <br/>
상품 사진 : 
<input type="file" name="gFile" placeholder="클릭후 이미지를 업로드해 주세요" onchange="change();"/> <br/>

<input type="button" onclick="sendIt()" value="상품등록">
<input type="reset" value=" 다시입력 " onclick="document.myForm.G_NAME.focus();"/>
<input type="button" onclick="javascript:location.href='<%=cp%>';" value="취 소"/>

</form>


</body>
</html>