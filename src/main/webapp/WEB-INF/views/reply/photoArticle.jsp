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

<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<script>
 $(document).ready(function() {
	var BC_NUM =$("#articleBC_NUM").val();
	$.ajax({
		 type:"get",
		 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM,
		 success : function(result) {
			 //responseText가 result에 저장됨.
			 $("#photoReply").html(result);
		},error : function (result) {
			alert("로딩실패");
		}
	 });
});

</script>
<script type="text/javascript">
	function photoReplyListUpdate(){
		
		var BC_NUM =$("#articleBC_NUM").val();
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM,
			 success : function(result) {
				 
				 var BC_NUM =$("#BC_NUM").val();
				 
				 $("#replyComment").get('<%=cp%>/goods/replyCommentList.action?BC_NUM=+BC_NUM');
				 $("#replyComment").html(result);
				 
			},error : function (result) {
			}
		 });
	}
</script>




<script>
	function writePhotoReply() {
		
		var BC_CONTENT =$("#BC_CONTENT").val();
		var BC_BOARD =$("#articleBC_board").val();
		var BC_NUM =$("#articleBC_NUM").val();
		var BC_ID =${sessionScope.userInfo.getM_ID()};
		var BC_BOARD = BC_BOARD;
		
		alert(BC_ID);
		alert(BC_CONTENT);
		alert(BC_BOARD);
		
		var formData = {"BC_ID":BC_ID,"BC_CONTENT":BC_CONTENT,"BC_BOARD":BC_BOARD,"BC_NUM":BC_NUM};
		
		$.ajax({
			type : "post",
			url :"<%=cp%>/goods/commentInsert.action",
			data : formData,
			success:function(result){
				
				console.log(result);
				
				var BC_NUM =$("#articleBC_NUM").val()
				
				alert("댓글이 등록되었습니다.");
				$.ajax({
					 type:"get",
					 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM,
					 success : function(result) {
						 //responseText가 result에 저장됨.
						 $("#photoReply").html(result);
					}
				 });
			},
			error: function(result) {
				alert("안된다");
				alert(result);
			}
		});
	}

</script>

<body>
<jsp:include page="../include/header.jsp" flush="false" />

<div id="bbs">
	<div id="bbs_title" style="font-size:25px; padding-left: 35px">
	 #${bc_dto.getG_NAME()}
	 <br>
	 <a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}"><font size="5" >상품상세보기</font></a>
	</div>
	<div id="bbsArticle">
		<div id="bbsArticle_header" style="padding-left: 35px; font-size: 20px">
			<ul>
				<li>
					<p style="font-size: 20px; float: left">
				 		${bc_dto.getBC_SUBJECT()}
				 	</p>
				</li>
				
				<li style="float: right; padding-top: 17px; padding-right: 35px">
					#${bc_dto.getBC_ID()}&nbsp;&nbsp;&nbsp;&nbsp;등록일 : ${bc_dto.getBC_DATE()}
				</li>
				
			</ul>
		</div>
		
		<div id="reply_content">
			<table width="600" border="0">
			<tr>
				<td style="padding: 20px 80px 20px 62px;" valign="top" height="200">
				 <div>
					 <c:if test="${!empty bc_dto.getBC_SAVEFILENAME()}">
						<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVEFILENAME()}"  style="width:auto; height: auto" id="">
					 </c:if>
					<br>
					
					<c:if test="${!empty bc_dto.getBC_SAVE1()}">
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE1()}"  style="width: auto; ; height: auto;" id="">
					</c:if>
					<br>
					<c:if test="${!empty bc_dto.getBC_SAVE2()}">
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE2()}"  style="width: auto; height: auto" id="">
					</c:if>
					<br>
					<c:if test="${!empty bc_dto.getBC_SAVE3()}">
					<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE3()}"  style="width: auto; height: auto" id="">
					</c:if>
					<br>
					${bc_dto.getBC_CONTENT()}
				</div>
				</td>
			</tr>
			</table>
	</div>
				<div align="center">
					<textarea id="BC_CONTENT" name="BC_CONTENT" rows="2" cols="100" style="padding-left: 10px; font-size: 18px; background-color: transparent;"></textarea>&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="writePhotoReply()" value="[댓글등록]" class="btnGreen" height="40px" style="padding-left: 10px; font-size: 18px;">
					<input type="hidden" name="BC_ID" size="35" maxlength="20" class="boxTF"
					value="${sessionScope.userInfo.getM_ID()}"/>
					
				</div>
			<!-- 댓글 목록부분 -->
			<div id="photoReply"></div>
		
		
		<div class="bbsArticle_bottomLine">
				<c:if test="${!empty sub_dto.getPREV_BC_SUBJECT()}">
					이전글 : <a href ="<%=cp%>/goods/replyArticle.action?BC_NUM=${sub_dto.getPREV_BC_NUM()}"> ${sub_dto.getPREV_BC_SUBJECT()}</a>
				</c:if>	
		</div>
		
		<div class="bbsArticle_noLine">
				<c:if test="${!empty sub_dto.getNEXT_BC_SUBJECT()}">
					다음글 : <a href ="<%=cp%>/goods/replyArticle.action?BC_NUM=${sub_dto.getNEXT_BC_NUM()}"> ${sub_dto.getNEXT_BC_SUBJECT()}</a>
				</c:if>
		</div>
		
	</div>
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<ul>
				<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
				<li>
	               <input type="button" value=" 수정 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/articleUpdate.action?BC_NUM=${bc_dto.getBC_NUM()}';" />
	               <input type="button" value=" 삭제 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/articleDelete.action?BC_NUM=${bc_dto.getBC_NUM()}&BC_BOARD=${bc_dto.getBC_BOARD()}&replyPageNum=${replyPageNum}';" />
				</li>
				</c:if>
					
				<li style="float: right">
					<input type="hidden" id="articleBC_board" value="${bc_dto.getBC_BOARD()}">
					<input type="hidden" id="articleBC_NUM" value="${bc_dto.getBC_NUM()}">
					<input type="hidden" value="${replyPageNum}"/>
               	    <input type="button" value=" 목록으로 돌아가기 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyAllList.action?replyPageNum=${replyPageNum}';"/>
				</li>
			</ul>
		
		</div>
	</div>

</div>

<br/>&nbsp;<br/>


<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>