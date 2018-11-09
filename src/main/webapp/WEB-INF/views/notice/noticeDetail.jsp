<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">

	function noticeListSendIt(){
		
		var f = document.noticeform;
		
		f.action = "<%=cp%>/notice/faq.action";
		f.submit();
	}
	
	function noticeDeleteSendit() {
		
		var f = document.noticeform;
		
		f.action = "<%=cp%>/notice/noticeDelete.action";
		f.submit();
	}
	
	function noticeUpdateSendit() {
		
		var f = document.noticeform;
		
		f.action = "<%=cp%>/notice/noticeUpdate.action";
		f.submit();
	}
	
	
</script>
</head>
<body>
	<jsp:include page="../include/header2.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container">
			<h2><font color="#000000">공지사항</font></h2><p></p>
		</div>
		
	<form id="noticeform" name="noticeform" action="" method="post">
		<input name="BN_NUM" value="${n_dto.getBN_NUM()}" type="hidden">
	
	<div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
	
	<div class="ec-base-table typeWrite ">
	
	<table border="1" style="width: 50%; margin: auto;">
		<colgroup>
			<col style="width:130px;">
			<col style="width:auto;">
		</colgroup>
	
	<tbody>
	<tr>
		<th scope="row">제목</th>
		<td style="font-size:18px;font-weight:400;">
			<input type="text" value="${n_dto.getBN_SUBJECT()}" style="border: none; width:auto; background-color: #F2F1F0">
		</td>
	</tr>
	
	<tr>
		<th scope="row">작성자</th>
		<td><img src="<%=cp%>/resources/data/logo/logo2.png" style="width: 100px;"></td>
	</tr>
	
	<tr>
		<th scope="row">작성일</th>
	    <td><input type="text" value="${n_dto.getBN_DATE()}" style="border: none; background-color: #F2F1F0"></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<div class="detail">
		<div style="text-align: left;">
			<div style="text-align: center;">
				<span style="color: rgb(51, 51, 51); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 12.2px; white-space: pre-line;">
					안녕하세요 Icade입니다^_^ &nbsp;
				</span>
			</div>
			<div style="text-align: center;">
			<span style="color: rgb(51, 51, 51); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 12.2px; white-space: pre-line;">
					<span style="font-size: 12.2px;">${n_dto.getBN_CONTENT()}</span>
			</span>
			</div>
		</div>
		</div>
		</td>
	</tbody>
	</table>
	</div>
		<div class="ec-base-button" align="center">
			<span class="gRight">
				<input type="button" value="수정" class="btnGreen" onclick="noticeUpdateSendit()">
				<input type="button" value="삭제" class="btnGreen" onclick="noticeDeleteSendit();">
				<input type="button" value="목록" class="btnGreen" onclick="noticeListSendIt();">
			</span>
		</div>
	</div>
	</form>
</div>
	

<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>