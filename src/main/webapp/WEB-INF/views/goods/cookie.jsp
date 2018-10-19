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

	function sendIt(g_num) {
		
		
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/goods/cookieDelete.action?g_num=" + g_num;
		f.submit()
		
	} 

</script>

</head>
<body>
<form action="" name="searchForm" method="post">

<c:forEach var="ck" items="${ck_lists}" varStatus="status">
${ck_lists}<br/>
${status.index}<br/>
${ck_lists.size()-1}<br/>
g_num : ${ck.getG_NUM()}<br/>
g_name : ${ck.getG_NAME()}<br/>
<img src="<%=cp%>/resources/goodsImage/${ck.getG_SAVEFILENAME()}" width="100" height="100"><br/><br/>
<input type="button" value=" 삭제 " class="btn2" onclick="sendIt(${ck.getG_NUM()});"/>
<br/><br/>
</c:forEach>

</form>
</body>
</html>