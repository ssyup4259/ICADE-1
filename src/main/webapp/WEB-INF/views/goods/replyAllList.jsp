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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
	<table width="700" cellpadding="0" cellspacing="3" align="center" bgcolor="e4e4e4">
		<tr height="50">
			<td bgcolor="#ffffff" style="padding-left: 10px;">
			<b>이미지 게시판</b>
			</td>
		</tr>
	</table>
 
  <form action="" method="post" name="myForm">
  
  <c:set var = "i" value="0" />
  <c:set var = "j" value="3" />
  
  <table  align="center">
	 <tr>
		 <td width="33%">
		 <td width="33%">
		 <td width="33%">
	 </tr>
	 
  <c:forEach var="bc_dto" items="${bc_Alllist }">
	  <c:if test="${i%j == 0} ">
	 <tr align="center">
	  </c:if>
      	<td colspan="1" >
      	 <a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}">${bc_dto.getG_NAME()}</a><br>
     	 <a href="<%=cp%>/goods/replyArticle.action?BC_NUM=${bc_dto.getBC_NUM()}"><img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVEFILENAME()}" style="width: 300px; height: 400px" id=""><br>
    	 ${bc_dto.getBC_SUBJECT()}</a>
    	</td>
  	<c:if test="${i%j == j-1}">
    </tr>
  	</c:if>
  	<c:set var ="i" value="${i+1}" />
  </c:forEach>
   
  </table>
  
  <table align="center">
	<tr>
		<td>
	
			<c:if test="${dataCount!=0 }">
						${pageIndexList}
					</c:if>
					<c:if test="${dataCount==0}">
						데이터가 없습니다
  			 </c:if>
   
   		</td>
   </tr>
	</table>
  </form>



 

<jsp:include page="../include/footer.jsp" flush="false" />


</body>
</html>