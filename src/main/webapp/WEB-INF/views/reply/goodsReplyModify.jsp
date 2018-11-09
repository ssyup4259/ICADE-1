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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</head>
<script src="<%=cp%>/resources/data/js/reply.js"></script>
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
				$('#goodsReplyModifier').css('visibility','hidden');
				replyListUpdate();
		},error: function(result) {
			swal("실패");
		}
	});
});


</script>
<script>
$("#btnReplyClose").click(function() {
	$('#goodsReplyModifier').css('visibility','hidden');
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
				$("#goodsReplyModifier").html(result);
				$("#goodsReplyModifier").css("visibility","hidden");
				replyListUpdate();
		},error: function(result) {
			swal("실패");
		}
	});
});

</script>

<body>
	<div align="center">
	<textarea id="updateReply" rows="5" cols="82" class="textAreaGreen">${bc_dto.getBC_CONTENT()}</textarea>
	</div>
	<div style="text-align: center;" align="center">
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