<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<script type="text/javascript">
	function searchFix() {
		var G_NAME = $("#g_listName").val();
		var G_NUM = $("#g_listNum").val();
		dataHandler(G_NAME,G_NUM);
		
	}

</script>

<body>

 	<div align="center" style="float: center; width: 625px;padding-left: 29px">
 		
	 	<c:forEach var="g_dto" items="${g_list}">
	 		<table>
	 			<tr>
	 				<td style="text-align: left">
	 					상품명
	 				</td>
	 				<td style="text-align: right">
		 				<a href="#g_listName" id="g_listName_fix" onclick="searchFix()">${g_dto.getG_NAME()}</a>
		 				<input type="hidden" id="g_listNum" name="g_listNum" value="${g_dto.getG_NUM()}"/>
		 				<input type="hidden" id="g_listName" name="g_listNum" value="${g_dto.getG_NAME()}"/>
	 				</td>
	 			</tr>
	 		</table>
	    </c:forEach>
 	</div>


</body>
</html>