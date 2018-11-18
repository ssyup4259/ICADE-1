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
<title>포토리뷰</title>

<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		 url :"<%=cp%>/goods/photoReplyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+1,
		 success : function(result) {
			 //responseText가 result에 저장됨.
			 $("#photoReply").html(result);
		},error : function (result) {
		}
	 });
});

</script>
<script type="text/javascript">
	function prReplyLoder(num) {
		
		var BC_NUM =$("#articleBC_NUM").val();
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/photoReplyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+num,
			 success : function(result) {
				 //responseText가 result에 저장됨.
				 $("#photoReply").html(result);
			},error : function (result) {
			}
		 });
	}
</script>

<script>
	function photoReplyListUpdate(){
		var BC_NUM =$("#articleBC_NUM").val();
		var num = $("#prNum").val();
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/photoReplyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+num,
			 success : function(result) {
				 
				 var BC_NUM =$("#BC_NUM").val();
				 
				 $("#photoReply").get('<%=cp%>/goods/photoReplyCommentList.action?BC_NUM=+BC_NUM+&num=+num');
				 $("#photoReply").html(result);
				 
			},error : function (result) {
			}
		 });
	}
</script>

<script>
	function writePhotoReply() {
		
		var BC_CONTENT =$("#PhotoReply_CONTENT").val();
		var BC_BOARD =$("#articleBC_board").val();
		var BC_NUM =$("#articleBC_NUM").val();
		var BC_ID =${sessionScope.userInfo.getM_ID()};
		var BC_BOARD = BC_BOARD;
		
		if (BC_CONTENT.length<1) {
			swal("내용을 입력해주세요!");
			f.BC_CONTENT.focus();
		}
		
		BC_CONTENT = BC_CONTENT.replace(/\r\n/g, '<br>');
		BC_CONTENT = BC_CONTENT.replace(/\r/g, '<br>');
		BC_CONTENT = BC_CONTENT.replace(/\n/g, '<br>')
		
		var formData = {"BC_ID":BC_ID,"BC_CONTENT":BC_CONTENT,"BC_BOARD":BC_BOARD,"BC_NUM":BC_NUM};
		
		$.ajax({
			type : "post",
			url :"<%=cp%>/goods/commentInsert.action",
			data : formData,
			success:function(result){
				
				
				var BC_NUM =$("#articleBC_NUM").val()
				swal("댓글이 등록되었습니다.");
				$.ajax({
					 type:"get",
					 url :"<%=cp%>/goods/photoReplyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+1,
					 success : function(result) {
						 //responseText가 result에 저장됨.
						 $("#photoReply").html(result);
					}
				 });
				$("#PhotoReply_CONTENT").val("");
			},
			error: function(result) {
				swal("안된다");
				swal(result);
			}
		});
	}

</script>

<body>
	<jsp:include page="../include/header2.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container-fluid" style="width: 80%;">
			
		<!-- 	<h1>포토리뷰</h1><font size="5" color="#8F9493">ICADE 포토리뷰 상품후기 게시판</font> -->
			
			<div class="row" style="text-align:left">
				<div class="col-sm-7" style="text-align: left; padding-right: 20px">
					<h2>
						<font color="#000000" size="7">포토리뷰</font>
						<font size="5" color="#8F9493">ICADE 포토리뷰 상품후기 게시판</font>
					</h2>
				</div>
			</div>


			<div style="font-size: 25px; margin: none">
				<div class="row">
					<div class="col-sm-1" style="float: left; height: 130px;">
						<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}" style="padding-top: 10px;"><img src="<%=cp%>/resources/goodsImage/${bc_dto.getG_SAVEFILENAME()}" class="img-thumbnail" style="width: 130px; height: 190px"></a>
					</div>
					&nbsp;&nbsp;
					<div class="col-sm-3" style="float: right;">
						<h3>
							<a href="<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}" style="padding-top: 10px">#${bc_dto.getG_NAME()}</a>
						</h3>
						<p class="price">
							₩<fmt:formatNumber>${bc_dto.getG_PRICE()}</fmt:formatNumber>
							<span id="sPrdTaxText"></span>
						</p>
						<input type="button" class="btnGray" value="상품상세보기" onclick="javascript:location.href='<%=cp%>/goods/goodsArticle.action?G_NUM=${bc_dto.getBC_BOARD()}';">
					</div>
				</div>
			</div>


			<hr style="border: 1px solid #A3C838;">
			<div id="bbsArticle">
				<div id="bbsArticle_header" style="padding-left: 35px; font-size: 20px">
					<ul style="background: transparent;">
						<li>
							<p style="font-size: 20px; float: left">${bc_dto.getBC_SUBJECT()}</p>
						</li>

						<li style="float: right; padding-top: 17px; padding-right: 35px">#${bc_dto.getBC_ID()}&nbsp;&nbsp;&nbsp;&nbsp;등록일 : ${bc_dto.getBC_DATE()}</li>

					</ul>
				</div>

				<div id="reply_content">
					<table width="90%" border="0">
						<tr>
							<td style="padding: 20px 80px 20px 62px;" valign="top" height="200">
								<div>
									<c:if test="${!empty bc_dto.getBC_SAVEFILENAME()}">
										<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVEFILENAME()}" style="width: auto; height: auto" id="">
									</c:if>
									<br>

									<c:if test="${!empty bc_dto.getBC_SAVE1()}">
										<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE1()}" style="width: auto;; height: auto" id="">
									</c:if>
									<br>
									<c:if test="${!empty bc_dto.getBC_SAVE2()}">
										<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE2()}" style="width: auto; height: auto" id="">
									</c:if>
									<br>
									<c:if test="${!empty bc_dto.getBC_SAVE3()}">
										<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE3()}" style="width: auto; height: auto" id="">
									</c:if>
									<br>
									${bc_dto.getBC_CONTENT()}
								</div>
							</td>
						</tr>
					</table>
				</div>
				<c:if test="${!empty sessionScope.userInfo.getM_ID()}">
					<div align="center">
						<!-- 댓글 목록부분 -->
						<textarea id="PhotoReply_CONTENT" class="textAreaGray" name="BC_CONTENT" rows="2" cols="100" style="padding-left: 10px; font-size: 18px; background-color: transparent;"></textarea>
						<br>
						<input type="button" onclick="writePhotoReply(${bc_dto.getBC_BOARD()},${bc_dto.getBC_NUM()})" value="댓글등록" class="btnGreen" class="btnGreen" height="40px" style="width: 15%" />
						<input type="hidden" name="BC_ID" size="35" maxlength="20" class="boxTF" value="${sessionScope.userInfo.getM_ID()}" />
					</div>
				</c:if>

				<c:if test="${empty sessionScope.userInfo.getM_ID()}">
					<div align="center">
						<p>
							<input type="button" style="width: 80%;height: 60px" value="로그인 하고 댓글작성하기" onclick="javascript:location.href='<%=cp%>/login.action';" class="btnGreen" >
						</p>
					</div>
				</c:if>

				<input type="hidden" id="BC_NUM" value="${bc_dto.getBC_NUM()}">
				<input type="hidden" id="BC_BOARD" value="${bc_dto.getBC_BOARD()}">
				<!-- 댓글 목록부분 -->
				<br>
				<div id="photoReply"></div>

				<div class="row">
					<div class="col-sm-12">
						<ul style="background: transparent;">
							<li>
								<c:if test="${!empty sub_dto.getPREV_BC_SUBJECT()}">
									<strong style="font-size: 25px"><a href="<%=cp%>/goods/replyArticle.action?BC_NUM=${sub_dto.getPREV_BC_NUM()}"><img src="<%=cp%>/resources/data/img/up-arrow.png" style="width: 30px;height: 30px;">&nbsp;&nbsp;이전글 :
									${sub_dto.getPREV_BC_SUBJECT()}</a></strong>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<ul style="background: transparent;">
							<li>
								<c:if test="${!empty sub_dto.getNEXT_BC_SUBJECT()}">
									<strong style="font-size: 25px"><a href="<%=cp%>/goods/replyArticle.action?BC_NUM=${sub_dto.getNEXT_BC_NUM()}"><img src="<%=cp%>/resources/data/img/down-arrow.png" style="width: 30px;height: 30px;">&nbsp;&nbsp;다음글 :
									${sub_dto.getNEXT_BC_SUBJECT()}</a></strong>
								</c:if>
							</li>
						</ul>		
					</div>
				</div>
			</div>
			<div id="bbsArticle_footer">
				<div id="leftFooter">
					<ul style="background: transparent;">
						<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
							<li>
								<input type="button" value=" 수정 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/articleUpdate.action?BC_NUM=${bc_dto.getBC_NUM()}&replyPageNum=${replyPageNum}';" />
								<input type="button" value=" 삭제 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/articleDelete.action?BC_NUM=${bc_dto.getBC_NUM()}&BC_BOARD=${bc_dto.getBC_BOARD()}&replyPageNum=${replyPageNum}';" />
							</li>
						</c:if>

						<li style="float: right">
							<input type="hidden" id="articleBC_board" value="${bc_dto.getBC_BOARD()}">
							<input type="hidden" id="articleBC_NUM" value="${bc_dto.getBC_NUM()}">
							<input type="hidden" value="${replyPageNum}" />
							<input type="button" value=" 목록으로 돌아가기 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyAllList.action?replyPageNum=${replyPageNum}';" />
						</li>
					</ul>

				</div>
			</div>

		</div>
	</div>


	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>