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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/reply.js"></script>



</head>
<script>
$("#btnReplyUpdate").click(function() {
	var updateReply = $("#updateReply").val();
	var BC_BOARD = $("#inputBC_BOARDdetale").val();
	var BC_NUM =$("#inputBC_NUMdetale").val();
	$.ajax({
		type:"post",
		url : "<%=cp%>/goods/goodsReplyUpdate.action",
		data:{"BC_CONTENT":updateReply,"BC_BOARD":BC_BOARD,"BC_NUM":BC_NUM},
		success : function(result) {
				$("#goodsReplyModifier").html(result);
				$("#replyComment").html($("#replyComment").html());
				alert("성공");
				alert("div 새로고침");
				$('#goodsReplyModifier').css('visibility','hidden');
				$("#replyComment").load("<%=cp%>/goods/replyCommentList.action");
				replyListUpdate();
		},error: function(result) {
			alert("실패");
		}
	});
});


</script>
<script>
$("#btnReplyDelete").click(function() {
	var BC_BOARD = $("#inputBC_BOARDdetale").val();
	var BC_NUM =$("#inputBC_NUMdetale").val();
	$.ajax({
		type:"post",
		url : "<%=cp%>/goods/goodsReplyDelete.action",
		data:{"BC_BOARD":BC_BOARD,"BC_NUM":BC_NUM},
		success : function(result) {
			var BC_NUM =$("#inputBC_NUMdetale").val();
				alert("성공");
				$("#goodsReplyModifier").html(result);
				$("#goodsReplyModifier").css("visibility","hidden");
			<%-- 	$("#replyComment").load("<%=cp%>/goods/replyCommentList.action"); --%>
				$("#replyComment").html(result);
				
		},error: function(result) {
			alert("실패");
		}
	});
});

</script>

<body>
	<textarea id="updateReply" rows="5" cols="82">${bc_dto.getBC_CONTENT()}</textarea>
	<div style="text-align: center;">
		<!-- 작성자만 댓글 수정 삭제가 가능하도록 처리 -->
		<c:if test="${sessionScope.userInfo.getM_ID() == bc_dto.getBC_ID()}">
			<button type="button" id="btnReplyUpdate" class="btnGreen">수정</button>
			<button type="button" id="btnReplyDelete"  class="btnGray">삭제</button>
		</c:if>
		<button type="button" id="btnReplyClose"class="btnGray">닫기</button>
		<input type="hidden" id="inputBC_BOARDdetale" value="${bc_dto.getBC_BOARD()}">
		<input type="hidden" id="inputBC_NUMdetale" value="${bc_dto.getBC_NUM()}">
	</div>

</body>
</html>