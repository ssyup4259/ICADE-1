<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/notice/noticeList.action";
		f.submit();

	}
</script>

</head>
<body style="font-family: LeeHyunJi; text-align: center; padding-top: 60px">
	<div>
		<h1>
		안녕<br/>
		쫌 해보시죠~!!!<br/>
		
		가시죠~~~ 잘가요~~
		</h1>
		${BN_DTO.getBN_NUM()}
		
	</div>
</body>
</html>