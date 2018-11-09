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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
			<div style="font-size:25px; margin: none">
				<div class="row">
					<div class="col-sm-1" style="float: left;height: 130px;">
							<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}" style="padding-top: 10px;padding-left: 35px"><img src="<%=cp%>/resources/reply/${bc_dto.getG_SAVEFILENAME()}" class="img-circle" style="width: 130px; height: 190px"></a>
					</div>
					<div class="col-sm-2" style="float: right;">
						<h3><a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}" style="padding-top: 10px">#${bc_dto.getG_NAME()}</a></h3>
							<p class="price" >₩${bc_dto.getG_PRICE()}<span id="sPrdTaxText"></span></p>
							<input type="button" class="btnGray" value="상품상세보기" onclick="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}">
					</div>
				</div>	
			</div>
	    </c:forEach>
 	</div>


</body>
</html>