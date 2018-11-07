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


<script>
 $(document).ready(function() {
	var BC_NUM =$("#BC_NUM").val();
	$.ajax({
		 type:"get",
		 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM,
		 success : function(result) {
			 //responseText가 result에 저장됨.
			 $("#replyComment").html(result);
		},error : function (result) {
		}
	 });
});

</script>
<script type="text/javascript">
	function replyListUpdate(){
		
		var BC_NUM =$("#BC_NUM").val();
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
			url :"<%=cp%>/goods/commentInsert.action",
			data : formData,
			success:function(result){
				
				console.log(result);
				
				var BC_NUM =$("#BC_NUM").val()
				
				alert("댓글이 등록되었습니다.");
				$.ajax({
					 type:"get",
					 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM,
					 success : function(result) {
						 //responseText가 result에 저장됨.
						 $("#replyComment").html(result);
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
	<form id="replyForm" method="post" enctype="multipart/form-data">
		 <div id="bbs">
				<div id="bbsArticle">
				 <c:forEach var="bc_dto" items="${bc_lists}">
				 	<c:if test="${!empty bc_dto.getBC_SUBJECT()}">
					<div id="replyHeader" style="padding-left: 35px; font-size: 20px">
						<ul>
							<li>
								<p style="font-size: 20px; float:left">
							 		<a id="replySubject" onclick="show(${bc_dto.getBC_NUM()});">${bc_dto.getBC_SUBJECT()}</a>
							 		<%-- <input type="button"   onclick="show(${bc_dto.getBC_NUM()});"> --%>
							 		
							 	</p>
							</li>
							
							<li style="float: right; padding-top: 16px; padding-right: 35px">
								#${bc_dto.getBC_ID()}&nbsp;&nbsp;&nbsp;&nbsp;등록일 :${bc_dto.getBC_DATE()}
								<br>
								<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
									 <input type="button" value=" 수정 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyUpdate.action?BC_NUM=${bc_dto.getBC_NUM()}';" />
			              			 <input type="button" value=" 삭제 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyDelete.action?BC_NUM=${bc_dto.getBC_NUM()}&BC_BOARD=${bc_dto.getBC_BOARD()}&replyPageNum=${replyPageNum}';" />
		              			 </c:if>
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
								
								<c:if test="${!empty sessionScope.userInfo.getM_ID()}">
									<div>
										<textarea id="BC_CONTENT" name="BC_CONTENT" rows="2" cols="100" style="padding-left: 10px; font-size: 18px; background-color: transparent;"></textarea>&nbsp;&nbsp;&nbsp;
										<input type="button" onclick="writeCmt(${bc_dto.getBC_BOARD()},${bc_dto.getBC_NUM()})" value="[댓글등록]" class="btnGreen" height="40px" style="padding-left: 10px; font-size: 18px; padding-bottom: 20px">
										<input type="hidden" name="BC_ID" size="35" maxlength="20" class="boxTF"
										value="${sessionScope.userInfo.getM_ID()}"/>
									</div>
								</c:if>
								
								<c:if test="${empty sessionScope.userInfo.getM_ID()}">
									<div style="float: right;">
										<p>
											<input type="button" value="댓글작성하기" onclick="javascript:location.href='<%=cp%>/login.action';" class="btnGreen" height="20px">
										</p>
									</div>
								</c:if>
									
									<input type="hidden" id="BC_NUM" value="${bc_dto.getBC_NUM()}">
									<input type="hidden" id="BC_BOARD" value="${bc_dto.getBC_BOARD()}"> 
									
							</c:if>
							</c:forEach>
							
						<div id="replyComment"></div>
							</div>
							</td>
						</table>
						</div>
				 </div>
			</div>
		</div>
	</form>
</body>
</html>