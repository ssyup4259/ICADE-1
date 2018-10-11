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

/* function change() {
	var f = document.myForm;
			
	var fileName = f.gFile.value.replace(/^.*[\\\/]/, '');
	
	f.gFile.value = fileName;
} */

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
        
    /* str = f.gColor.value;
    str = str.trim();
    if(!str) {
        alert("상품의 색상을 입력해주세요.");
        f.gColor.focus();
        return;
    }
    f.gColor.value = str; */
    
    
    
    /* str = f.gCount.value;
    str = str.trim();
    if(!str) {
        alert("상품의 수량을 입력해주세요.");
        f.gCount.focus();
        return;
    }
    f.gCount.value = str; */   
    
	
	f.action = "<%=cp%>/admin/insertGoods.action";
	f.submit();
	
}

</script>

</head>
<body>

<h3>상품등록 테스트</h3>

<form action="" name="myForm" method="POST" enctype="multipart/form-data">

상품 이름 : <input type="text" name="G_NAME"/> <br/>
상품 가격 : <input type="text" name="G_PRICE"/> <br/>
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