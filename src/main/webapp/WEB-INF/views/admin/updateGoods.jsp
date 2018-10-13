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
        
	f.action = "<%=cp%>/admin/updateGoods.action";
	f.submit();
	
}

</script>

</head>
<body>

<h3>상품등록 테스트</h3>

<form action="" name="myForm" method="POST" enctype="multipart/form-data">

상품 종류 : ${g_dto.GK_KIND} <br/>
상품 이름 : <input type="text" name="G_NAME" value="${g_dto.G_NAME}"/> <br/>
상품 가격 : <input type="text" name="G_PRICE" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" value="${g_dto.G_PRICE}">원 <br/>
상품 설명 : <textarea rows="30" cols="50" name="G_CONTENT">${g_dto.G_CONTENT}</textarea> <br/>
할인율 : <input type="text" name="G_DISCOUNT" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" value="${g_dto.G_DISCOUNT}"/>% <br/>
상품 사진 : 
<input type="file" name="gFile" placeholder="클릭후 이미지를 업로드해 주세요" value=""/> <br/>

<input type="button" onclick="sendIt()" value="상품수정">
<input type="button" onclick="javascript:history.back();" value="취 소"/>

</form>


</body>
</html>