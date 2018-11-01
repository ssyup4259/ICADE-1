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

	<title>댓글</title>
	
	<style type="text/css">
		#wrap {
			width: 550px;
			margin: 0 auto 0 auto;
			text-align :center;
		}
	
		#commentReplyForm{
			text-align :center;
		}
	</style>
	
<script type="text/javascript">	
	
	function checkValue() {
		
		var f = document.replyComplete;
		
		// 전송할 값을 변수에 담는다.		
		var BC_NUM = document.getElementById("replyNum").value;
		var BC_BOARD = document.getElementById("replyBoard").value;
		var BC_ID = "${sessionScope.userInfo.getM_ID()}";
		var BC_CONTENT = f.BC_CONTENT.value;
		
		alert(BC_NUM);
		alert(BC_BOARD);
		alert(BC_ID);
		
		if(!comment_content) {
			alert("내용을 입력하세요");
			return false;
		}
		
		f.action = "<%=cp%>/goods/replyComment_ok?comment_num=" + comment_num + "&comment_board_num="
				+ comment_board_num + "&comment_id=" + comment_id + "&comment_content=" + comment_content;
		f.submit();
					
	}
		
</script>
	
</head>
<body>
	<div id="wrap">
		<br>
		<b><font size="5" color="#5c8a8a">댓글</font></b>
		<hr size="1" width="550" color="#b3cccc">
		<br>
		<div id="commentReplyForm">
			<form name="replyComplete" action="" method="post">
			
				<input type="text" id="replyNum" name="BC_NUM" value="${bc_dto.getBC_NUM()}"> 		
				<input type="text" id="replyBoard" name="BC_BOARD" value="${bc_dto.getBC_BOARD()}"> 
						
				<textarea rows="7" cols="50" name="BC_CONTENT" style="border-radius : 20px; border-color: #b3cccc; padding-left: 20px; font-size: 18px;"></textarea>
				<br><br>
				<input type="button" value="등록" onclick="checkValue()" class="btn" style="width: 200px; height: 40px; font-size: 18px;">
				<input type="button" value="창닫기" onclick="window.close()" class="btn" style="width: 200px; height: 40px; font-size: 18px;">
				
			</form>
		</div>
	</div>	
</body>
</html>