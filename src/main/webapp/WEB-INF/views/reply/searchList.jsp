<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	function searchFix(G_NUM,G_NAME) {
		
		$("#photoG_NAME").val("");
		$("#photoG_NUM").val("");
		
		
		$("#photoG_NAME").val(G_NAME);
		$("#photoG_NUM").val(G_NUM);
		
	}

</script>

<body>

 	<div align="center" style="float: center; width: 625px;padding-left: 29px">
 		
	 		<p>후기를 작성할 상품을 선택하세요</p>
	 	<c:forEach var="bc_dto" items="${g_list}">
			<div style="font-size:25px; margin: none">
				<div class="row">
					<div class="col-sm-1" style="float: left;height: 130px;">
							<a><img src="<%=cp%>/resources/goodsImage/${bc_dto.getG_SAVEFILENAME()}" class="img-circle" style="width: 50px; height: 60px"></a>
					</div>
					<div class="col-sm-6" style="float: right;text-align: left">
						<h3><a href="#searchFix" onclick="searchFix('${bc_dto.getG_NUM()}','${bc_dto.getG_NAME()}');" style="padding-top: 10px;font-size: 15px;">#${bc_dto.getG_NAME()}</a><font size="3">&nbsp;₩<fmt:formatNumber>${bc_dto.getG_PRICE()}</fmt:formatNumber></font></h3>
						<input type="button" class="btnGray" value="상품상세보기" onclick="javascript:location.href='<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}';">
					</div>
				</div>	
			</div>
	    </c:forEach>
 	</div>


</body>
</html>