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

<style type="text/css">
	.menu a{cursor:pointer;}
	.menu .hide{display:none;}
</style>
</head>


<script type="text/javascript">
	function replyListUpdate(){
		
		var BC_NUM = $("#BC_UPDATE").val();
		var num = $("#gaPrNum").val();
		
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+num,
			 success : function(result) {
				 
				 $("#"+BC_NUM).get('<%=cp%>/goods/replyCommentList.action?BC_NUM=+BC_NUM');
				 $("#"+BC_NUM).html(result);
				 
			},error : function (result) {
			}
		 });
	}
</script>
<script type="text/javascript">
	function goodsPhotoReplylist(num) {
		
		var BC_NUM = $("#BC_UPDATE").val();
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+num,
			 success : function(result) {
				 //responseText가 result에 저장됨.
				 $("#"+BC_NUM).html(result);
			}
		 });
	}
</script>
<script>
	function show(BC_NUM) {
		        var state = $('.'+BC_NUM).css('display');
		        if(state == 'none'){
		            $('.'+BC_NUM).toggle("slow"); 
		        } else {
		        	$('.'+BC_NUM).hide("slow");
		        }
		    	$.ajax({
		    		 type:"get",
		    		 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+1,
		    		 success : function(result) {
		    			 $("#"+BC_NUM).html(result);
		    		},error : function (result) {
		    		}
		    	 });
     	 }
		
</script>
<!-- 대댓글 등록하기 -->
<script>
	function writeCmt(BC_NUM) {
		
		var BC_CONTENT = $("#txt"+BC_NUM).val();
		
		if ($("#sessionID").val()) {
			var BC_ID = $("#sessionID").val();
		}
		
		var BC_BOARD =  $("#BC_BOARD").val();
		var num = $("#gaPrNum").val();
		
 		if (BC_CONTENT.length<1) {
			swal("내용을 입력해주세요!");
			return;
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
				
				
				swal("댓글이 등록되었습니다.");
				$.ajax({
					 type:"get",
					 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM+"&curPage="+1,
					 success : function(result) {
						 $("#"+BC_NUM).html(result);
					}
				 });
				$("#txt"+BC_NUM).val("");
			},
			error: function(jqXHR,result) {
				if(jqXHR.status==911){
					location.href="<%=cp%>/login.action";
				}else{
					swal("error : " + result + "jqXHR.status : " + jqXHR.status);
					console.log(result);
				}
			}
		});
	
	}
</script>


<body>
	<form id="replyForm" name="replyForm" method="post" enctype="multipart/form-data">
		 <div id="bbs" align="center">
			<div id="bbsArticle">
					<br><br><br><br>
				 <c:forEach var="bc_dto" items="${bc_lists}">
					<div id="replyHeader" style="font-size: 20px; background: transparent;">
						<ul style="background: transparent;">
	                		<li style="margin-top: none;height: 94px">
								<p style="font-size: 20px; float:left">
							 		<a id="replySubject" onclick="show(${bc_dto.getBC_NUM()});"style="padding-top: 10px;cursor: pointer;" >${bc_dto.getBC_SUBJECT()}</a>
							 	</p>
							</li>
							<li style="float: right; padding-right: 35px;height: 94px">
								<br>
								#${bc_dto.getBC_ID()}&nbsp;&nbsp;&nbsp;&nbsp;등록일 :${bc_dto.getBC_DATE()}
								<br>
								<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
									 <input type="button" value=" 수정 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyUpdate.action?BC_NUM=${bc_dto.getBC_NUM()}';" />
			              			 <input type="button" value=" 삭제 " class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyDelete.action?BC_NUM=${bc_dto.getBC_NUM()}&BC_BOARD=${bc_dto.getBC_BOARD()}&replyPageNum=${replyPageNum}';" />
		              			 </c:if>
							</li>
						</ul>
					</div>
				
					<div class="${bc_dto.getBC_NUM()}" style="display:none" align="center">
						<table width="600" border="0">
							<tr>
								<td style="padding: 20px 62px 20px 62px;" valign="top" height="200">
									 <c:if test="${!empty bc_dto.getBC_SAVEFILENAME()}">
										<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVEFILENAME()}"  style="width:800px; height: auto" id="">
									 </c:if>
									<br>  
									<c:if test="${!empty bc_dto.getBC_SAVE1()}">
									<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE1()}"  style="width: 800px; ; height: auto;" id="">
									</c:if>
									<br>
									<c:if test="${!empty bc_dto.getBC_SAVE2()}">
									<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE2()}"  style="width: 800px; height: auto" id="">
									</c:if>
									<br>
									<c:if test="${!empty bc_dto.getBC_SAVE3()}">
									<img src="<%=cp%>/resources/reply/${bc_dto.getBC_SAVE3()}"  style="width: 800px; height: auto" id="">
									</c:if>
									<br>
									<span id="gBC_CONTENT">${bc_dto.getBC_CONTENT()}</span>
								</td>
							</tr>
						</table>
							<br>
									<div align="center" style="float: center">
										<textarea id="txt${bc_dto.getBC_NUM()}" class="textAreaGreen" name="BC_CONTENT"  rows="2" cols="100"  placeHolder="댓글을 입력하세요"></textarea>
										<br>
										<input type="button" onclick="writeCmt(${bc_dto.getBC_NUM()});" value="[댓글등록]" class="btnGreen" style="width: 15%">
										<input type="hidden" id="BC_NUM" value="${bc_dto.getBC_NUM()}">
										<input type="hidden" id="BC_BOARD" value="${bc_dto.getBC_BOARD()}"> 
										<input type="hidden" id="sessionID" value="${sessionScope.userInfo.getM_ID()}"/>
									</div>
							<br>	
					<div id="${bc_dto.getBC_NUM()}"></div>
					</div>
				</c:forEach>
				<div></div>
				<br>
				<br>
				<table style="background: transparent;color: #A8C838;font-size: 20px;border-color: #A8C837;border-radius: 12px">
					
					<tr>
					 <c:if test="${count != 0 }">
			            <td style="background: transparent;border-bottom: none">
			                <c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
			                    <c:choose>
			                        <c:when test="${num == replyPager.curPage}">
			                            ${num}&nbsp;
			                        </c:when>
			                        <c:otherwise>
			                            <a href="javascript:listReply('${num}')">${num}</a>&nbsp;
			                        </c:otherwise>
			                    </c:choose>
			                </c:forEach>
			            </td>
			           </c:if>
			        </tr>
			        <tr>
				        <c:if test="${count == 0 }">
				        	<td style="border-bottom: none">
				        		등록된 포토리뷰가 없습니다.
				        	</td>
			        	</c:if>
			        </tr>
				</table>	
			</div>
		</div>
	</form>
</body>
</html>