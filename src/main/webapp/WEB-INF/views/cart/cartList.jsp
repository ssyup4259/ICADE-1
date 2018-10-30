<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle2.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<title>장바구니</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

function updateCartItem(c_code) {
	
	var f = document.myForm;
	
	var c_count = document.getElementById(c_code).value;
	
	var pageNum = "${pageNum}";
	
	f.action = "<%=cp%>/cart/updateCartItem.action?c_code=" + c_code + "&c_count=" + c_count + "&pageNum=" + pageNum;
	f.submit();
	
}


function updateCheck(c_code, count) {
	
	var pageNum = ${pageNum};
	
	var allData = {"c_code":c_code, "c_count":$("#" + c_code).val(), "pageNum":pageNum};
	
	$.ajax({
		
		type:"post",
		url:"<%=cp%>/cart/updateCheck.action",
		datatype:  'json',
		data: allData,
		success: function(data) {
			
			if (data == 'false') {
				
				alert("재고 수량 부족");
				$("#" + c_code).val(count);
				
			} else if (data == 'true') {
				
				updateCartItem(c_code);
				
			}
			
		},
		
		error: function() {

			alert("안된다");
			
		}				
	});
}	

function countUp(g_code) {
	
	var count = Number(document.getElementById(g_code).value);
	
	count = count + 1;
	
	document.getElementById(g_code).value = count;
	
}

function countDown(g_code) {
	
	var count = Number(document.getElementById(g_code).value);
	
	if (count <= 1) {
		return;
	}
	
	count = count - 1;
	
	document.getElementById(g_code).value = count;
	
}

function buyIt() {
	
	var f = document.myForm;
	
	f.action = "<%=cp%>/buy/buyForm.action";
	
	if ($("input:checkbox[id='chk']").is(":checked") == true) {
		f.submit();
	} else {
		alert("상품을 선택 해 주세요.");
	}
	
	
	
	
}

</script>

<style type="text/css">

input.up {
        background: url("<%=cp%>/resources/images/btn_quantity_up.gif") no-repeat;
        border: none;
        width: 22px;
        height: 13px;
        cursor: pointer;
}

input.down {
        background: url("<%=cp%>/resources/images/btn_quantity_down.gif") no-repeat;
        border: none;
        width: 22px;
        height: 13px;
        cursor: pointer;
}

input[type=checkbox] {
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;
}

</style>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<h3>장바구니 리스트</h3>
<form action="" method="post" name="myForm">
<input type="hidden" name="pageNum" value="${pageNum}"/>
<c:forEach var="c_dto" items="${c_lists}">
	<label>
		<input type="checkbox" id="chk" name="chk" value="${c_dto.getC_NUM()}"/>
		<img src="<%=cp%>/resources/goodsImage/${c_dto.getC_SAVEFILENAME()}" width="100" height="100" align="middle"/>&nbsp;
	</label>
	<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${c_dto.getC_GNUM()}">
		${c_dto.getC_NAME()}&nbsp;
		[${c_dto.getC_DEVICE()} / ${c_dto.getC_COLOR()}]&nbsp;&nbsp;&nbsp;
	</a>
	<fmt:formatNumber>${c_dto.getC_PRICE()}</fmt:formatNumber>원&nbsp;&nbsp;&nbsp;
	<input type="button" id="down" class="down" onclick="countDown('${c_dto.getC_CODE()}');"/>
	<input type="text" id="${c_dto.getC_CODE()}" value="${c_dto.getC_COUNT()}" size="2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>개
	<input type="button" id="up" class="up" onclick="countUp('${c_dto.getC_CODE()}');"/>
	<input type="button" value="변경" onclick="updateCheck('${c_dto.getC_CODE()}', ${c_dto.getC_COUNT()})" class="btn"/>	
	<fmt:formatNumber>${c_dto.getC_PRICE() * c_dto.getC_COUNT()}</fmt:formatNumber>원&nbsp;&nbsp;
	<a href="<%=cp%>/cart/deleteCartItem.action?c_num=${c_dto.getC_NUM()}&pageNum=${pageNum}">삭제</a>
	<br/>
</c:forEach>

</form>

<c:if test="${dataCount!=0 }">
	<br/>
	<input type="button" value="모두 비우기" onclick="javascript:location.href='<%=cp%>/cart/deleteCartAll.action';" class="btn"/>
	<input type="button" value="구매하기" onclick="buyIt();" class="btn"/>
	<br/><br/>
</c:if>
<c:if test="${dataCount!=0 }">
	${pageIndexList }
</c:if>
<c:if test="${dataCount==0 }">
	등록된 상품이 없습니다.
</c:if>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>