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
</head>
<body>

<c:forEach var="ck" items="${ck_lists}">
g_num : ${ck.getG_NUM()}<br/>
g_name : ${ck.getG_NAME()}<br/>
<img src="<%=cp%>/resources/goodsImage/${ck.getG_SAVEFILENAME()}" width="300" height="300"><br/><br/>
</c:forEach>

</body>
</html>