<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link href="${pageContext.request.contextPath}/css/sangyeop.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

	<title>답글</title>
	
	
<script type="text/javascript">	
	function cmDelete(BC_NUM,BC_BOARD) {

		var	data={"BC_NUM":BC_NUM, "BC_BOARD":BC_BOARD};
			
		if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type :"post",
			data : data,
			url : "<%=cp%>/goods/replyDelete.action",
			success:function(result){
					alert("삭제되었습니다");
					("#replyCatalog"+BC_NUM).remove();
			},
			error: function(result) {
				alert("안된다");
	 	    }
	     });
	   }
	  }
</script>
<script type="text/javascript">
	function cmUpdateOpen(BC_NUM,BC_CONTENT) {
		$.ajax({
			type :"get",
			url : "<%=cp%>/goods/goodsReplyComment.action?BC_NUM="+BC_NUM+"&BC_CONTENT="+BC_CONTENT,
			success:function(result){
					("#goodsReplyModify").html(result);
			},
			error: function(result) {
				alert("안된다");
	 	    }
	     });
	}
</script>

</head>
<body>
	 <c:forEach var="rp_dto" items="${rp_list}">
			<!-- 대댓글 목록 -->
			<table border="1" bordercolor="#b3cccc" align="center" width="1000" style="border-radius: 20px;" id="replyCatalog">
				<!-- 댓글 목록 -->
					<tr height="60px;" class="even">
						<!-- 아이디, 작성날짜 -->
						<td width="15%" valign="top">
							<div style="width: 120px; height: 40px;">
							<div style="margin-top: 15%"></div>
								<c:if test="${rp_dto.getLevel() > 1}">
								&nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->
								</c:if>
								${rp_dto.getBC_ID()}<br> <font color="b3cccc" size="2">${rp_dto.getBC_DATE()}</font>
							</div>
						</td>
						<!-- 본문내용 -->
						<td width="70%">
							${rp_dto.getBC_CONTENT()}
						</td>
						<!-- 버튼 -->
						<td width="15%">
							<div id="btn" style="text-align: center;">
								<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
								<c:if test="${rp_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
									<a href="#" onclick="cmUpdateOpen(${rp_dto.getBC_NUM()},${rp_dto.getBC_CONTENT()})">[수정]</a>
								</c:if>
							</div> 
						</td>
					</tr>
				</table>
				<div id="goodsReplyModify"></div>
		</c:forEach> 	
</body>
</html>