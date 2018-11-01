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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<style type="text/css">
	.menu a{cursor:pointer;}
	.menu .hide{display:none;}
</style>


</head>


<script type="text/javascript">
 function replyUpdate(BC_NUM){
	 var num =BC_NUM;
	 f = document.replyForm;
	 f.action = "<%=cp%>/goods/replyUpdate.action?BC_NUM=num";
	 f.submit();
}

</script>

<script>

	function show(BC_NUM) {
		
		
		 /* $('.replyImage').attr('class', function(num){

			    alert(BC_NUM);
			    
			    return  BC_NUM;
			}); */
		        var state = $('.'+BC_NUM).css('display'); 
		        if(state == 'none'){
		            $('.'+BC_NUM).show(); 
		        }else{ 
		            $('.'+BC_NUM).hide();
		        }
     	 }
		
</script>
<!-- 대댓글 등록하기 -->
<script>
	function writeCmt(BC_BOARD,BC_NUM,BC_CONTENT) {
		
		var BC_CONTENT =$("#BC_CONTENT").val();
		var BC_ID =${sessionScope.userInfo.getM_ID()};
		var BC_NUM =BC_NUM;
		var BC_BOARD = BC_BOARD;
		
		alert(BC_ID);
		alert(BC_CONTENT);
		alert(BC_BOARD);
		
		var formData = {"BC_ID":BC_ID,"BC_CONTENT":BC_CONTENT,"BC_BOARD":BC_BOARD,"BC_NUM":BC_NUM};
		$.ajax({
			type : "post",
			url :"<%=cp%>/goods/replyComment.action",
			data : formData,
			success:function(){
				alert("댓글이 등록되었습니다.");
			},
			error: function(result) {
				alert("안된다");
				alert(result);
			}
		});
	}
</script>
<script>

	function replyDelete(BC_NUM,BC_BOARD) {

	var	data={"BC_NUM":BC_NUM, "BC_BOARD":BC_BOARD};
		
	if(confirm("삭제하시겠습니까?")) {
	$.ajax({
		type :"post",
		data : data,
		url : "<%=cp%>/goods/replyDelete.action",
		success:function(result){
				alert("삭제되었습니다");
		},
		error: function(result) {
			alert("안된다");
 	    }
     });
   }
  }
</script>

<body>
	<form id="replyForm" method="post" enctype="multipart/form-data">
		 <div id="bbs">
				<div id="bbsArticle">
				 <c:forEach var="bc_dto" items="${bc_lists}">
					<div id="replyHeader" style="padding-left: 35px; font-size: 20px">
						<ul>
							<li>
								<p style="font-size: 20px; float: left">
							 		<a id="replySubject" onclick="show(${bc_dto.getBC_NUM()});">${bc_dto.getBC_SUBJECT()}</a>
							 		<%-- <input type="button"   onclick="show(${bc_dto.getBC_NUM()});"> --%>
							 	</p>
							</li>
							
							<li style="float: right; padding-top: 16px; padding-right: 35px">
								#${bc_dto.getBC_ID()}&nbsp;&nbsp;&nbsp;&nbsp;등록일 :${bc_dto.getBC_DATE()}
							</li>
						</ul>
					</div>
				
					<div class="${bc_dto.getBC_NUM()}" style="display:none">
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
								<div>
									<textarea id="BC_CONTENT" name="BC_CONTENT" rows="2" cols="100" style="padding-left: 10px; font-size: 18px; background-color: transparent;"></textarea>&nbsp;&nbsp;&nbsp;
									<input type="button" onclick="writeCmt(${bc_dto.getBC_BOARD()},${bc_dto.getBC_NUM()})" value="[댓글등록]" class="btnGreen" height="40px" style="padding-left: 10px; font-size: 18px;">
									<input type="hidden" name="BC_ID" size="35" maxlength="20" class="boxTF"
									value="${sessionScope.userInfo.getM_ID()}"/>
								</div>
							</div>
							</td>
						</table>
					</c:forEach>
			<c:forEach var="rp_dto" items="${rp_list}">
			<table border="1" bordercolor="#b3cccc" align="center" width="1000" style="border-radius: 20px;">
				<!-- 댓글 목록 -->
						<tr height="60px;" class="even">
							<!-- 아이디, 작성날짜 -->
							<td width="15%" valign="top">
								<div style="width: 120px; height: 40px;">
								<div style="margin-top: 15%"></div>
									<%-- <c:if test="${rp_dto.getLevel() > 1}">
									&nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->
									</c:if> --%>
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
									<!-- 이부분은 확인 필요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
									<c:if test="${rp_dto.BC_ID() eq sessionScope.userInfo.getM_ID()}">
										<c:if test="${bc_dto.commentLevel eq 1}">
									<a href="#" onclick="cmReplyOpen(${rp_dto.BC_NUM});">[답변]</a>
											<br>
										</c:if>
									</c:if>

									<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
									<c:if test="${rp_dto.BC_ID() == sessionScope.userInfo.getM_ID()}">
										<a href="#" onclick="cmUpdateOpen(${rp_dto.BC_NUM},${rp_dto.getBC_CONTENT()}">[수정]</a>
								<br>
								<a href="#" onclick="cmDeleteOpen(${rp_dto.BC_NUM});">[삭제]</a>
										<Br>
									</c:if>
								</div>
							</td>
						</tr>
						</table>
					</c:forEach>
				 </div>
			</div>
		</div>
	</form>
</body>
</html>