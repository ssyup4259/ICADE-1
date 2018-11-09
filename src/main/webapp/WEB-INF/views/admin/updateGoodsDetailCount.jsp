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

<title>상품 재고 수정</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 재고 수정하기 버튼 submit -->
<script type="text/javascript">

function countUpdateIt() {
	
	var f = document.myForm;
	        
	f.action = "<%=cp%>/admin/updateGoodsDetailCount.action";
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
<div>

	<h1>${g_name}</h1>

	<form action="" method="post" name="myForm">
	
		<c:set var="i" value="plz"/>
		
		<table style="border: 0px solid;">
			<c:forEach var="gd_dto" items="${gd_lists}">
				<tr>
					<td colspan="2">
						<c:if test="${i ne gd_dto.DK_NAME}">
							<br/>${gd_dto.DK_NAME}
						</c:if>
						
					</td>
				</tr>
				
				<tr>
					<td style="padding-top: 0px; padding-bottom: 0px;">
						${gd_dto.GC_COLOR}
					</td>
					<td style="padding-top: 0px; padding-bottom: 0px;">
						<c:set var="i" value="${gd_dto.DK_NAME}"/>
						<input type="text" name="GD_COUNT" value="${gd_dto.GD_COUNT}" size="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" class="inputBoxGray"/>개
						<input type="hidden" name="GD_CODE" value="${gd_dto.GD_CODE}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<input type="button" onclick="countUpdateIt()" class="btnGray" value="재고 수정"/>
		<input type="button" onclick="javascript:window.close();" class="btnGray" value="취 소"/>
	
	</form>
	
</div>
</body>
</html>