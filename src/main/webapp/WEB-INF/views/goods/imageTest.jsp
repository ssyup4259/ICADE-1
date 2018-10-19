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
function OpenWindow() {
	
	
	
	
	window.open("<%=cp%>/goods/cookieTest.action","_blank","top=500,left=1500,width=200,heigth=500,resizable=1,scrollbars=yes");
	
	
	
}

</script>

</head>
<body onload="OpenWindow()">


<img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}">


</body>
</html>