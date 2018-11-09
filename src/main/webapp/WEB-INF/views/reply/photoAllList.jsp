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
<title>아이폰 케이스는 ICADE</title>
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<script type="text/javascript">
	function login() {
		
		var f = document.replyForm;
		swal("로그인 후 작성 가능합니다.");
		
		f.action = "<%=cp%>/login.action";
		f.submit();
	}
</script>

<body>
	<jsp:include page="../include/header2.jsp" flush="false" />
	<form action="" method="post" name="replyForm">
		<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
			<div class="container-fluid" style="width: 80%;">
				<h1>포토후기</h1>

				<c:set var="i" value="0" />
				<c:set var="j" value="5" />

				<div id="" style="text-align: center;">

					<!-- 로그인 안하면 작성 불가능 -->
					<c:if test="${!empty sessionScope.userInfo.getM_ID()}">
					<p>
						<input type="button" value="포토후기 작성하기" style="width: 100%; border-radius: 12px;" onclick="javascript:location.href='<%=cp%>/goods/photoInsertData.action';" class="btnGreen" height="20px">
					</p>
					</c:if>
					<!-- 로그인 안하면 작성 불가능 -->
					<c:if test="${empty sessionScope.userInfo.getM_ID()}">
					<p>
							<input type="button" value="포토후기 작성하기" style="width: 100%; border-radius: 12px;" onclick="login();" class="btnGreen" height="20px">
							</p>
					</c:if>
				</div>


				<table align="center" style="border-radius: 12px;">
					<tr>
						<td width="20%">
						<td width="20%">
						<td width="20%">
						<td width="20%">
						<td width="20%">
					</tr>

					<c:forEach var="bc_dto" items="${bc_Alllist }">
						<c:if test="${i%j == 0} ">
							<tr align="center" style="border-bottom: none;">
						</c:if>
						<td colspan="1" style="margin: 0; padding: 0; border-bottom: none;"><a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}">
						 <img src="<%=cp%>/resources/goodsImage/${bc_dto.getG_SAVEFILENAME()}" class="img-circle" style="width: 50px; height: 60px"><font size="5">${bc_dto.getG_NAME()}</font></a>
						 <br>
						 <a href="<%=cp%>/goods/replyArticle.action?BC_NUM=${bc_dto.getBC_NUM()}&replyPageNum=${replyPageNum}"> 
						 <img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVEFILENAME()}" style="width: 100%; height: 400px; margin: 0px; border-radius: 20px;"><br><font size="5">${bc_dto.getBC_SUBJECT()}</font>
						</a></td>
						<c:if test="${i%j == j-1}">
							</tr>
						</c:if>
						<c:set var="i" value="${i+1}" />
					</c:forEach>

	
					<tr style="font-size: 20px;">
						<td colspan="5"><c:if test="${dataCount!=0 }">
						${pageIndexList}
					</c:if> <c:if test="${dataCount==0}">
						데이터가 없습니다
  			 </c:if></td>
					</tr>
				</table>
			</div>
		</div>
	</form>

	<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>