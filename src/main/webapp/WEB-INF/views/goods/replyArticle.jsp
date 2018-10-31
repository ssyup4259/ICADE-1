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
<title>포토후기</title>

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

<div id="bbs">
	<div id="bbs_title" align="">
	 #${bc_dto.getG_NAME()}
	 <br>
	 <font size="3" ><a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}">상품상세보기</a></font>
	</div>
	<div id="bbsArticle">
		<div id="bbsArticle_header">
			<h3>${bc_dto.getBC_SUBJECT()}</h3>
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>${bc_dto.getBC_ID()}</dt>
			</dl>
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일 : ${bc_dto.getBC_DATE()}</dt>
			</dl>
		</div>
		<div id="bbsArticle_content">
			<table width="600" border="0">
			<tr>
				<td style="padding: 20px 80px 20px 62px;" valign="top" height="200">
				 <div>
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVEFILENAME()}"  style="width:auto; height: auto" id="">
					<br>				
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE1()}"  style="width: auto; ; height: auto;" id="">
					<br>
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE2()}"  style="width: auto; height: auto" id="">
					<br>
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE3()}"  style="width: auto; height: auto" id="">
					<br>
					${bc_dto.getBC_CONTENT()}
				</div>
				</td>
			</tr>
			</table>
		</div>
		<!-- <div class="bbsArticle_bottomLine">
			이전글 : 작업중
		</div>
		<div class="bbsArticle_noLine">
			다음글 : 작업중
		</div> -->
	</div>
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<ul>
				<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
				<li>
	               <input type="button" value=" 수정 " class="btn2" onclick="javascript:location.href='<%=cp%>/goods/articleUpdate.action?BC_NUM=${bc_dto.getBC_NUM()}';" />
	               <input type="button" value=" 삭제 " class="btn2" onclick="javascript:location.href='<%=cp%>/goods/articleDelete.action?BC_NUM=${bc_dto.getBC_NUM()}&BC_BOARD=${bc_dto.getBC_BOARD()}&replyPageNum=${replyPageNum}';" />
				</li>
				</c:if>
					
				<li style="float: right">
					<input type="text" value="${replyPageNum}"/>
               	    <input type="button" value=" 리스트 " class="btn2" onclick="javascript:location.href='<%=cp%>/goods/replyAllList.action?replyPageNum=${replyPageNum}';"/>
				</li>
			</ul>
		
		</div>
	</div>

</div>

<br/>&nbsp;<br/>


<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>