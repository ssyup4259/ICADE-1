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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function photoUpdateOpen(BC_NUM) {
		var num = $("#prNum").val();
		$.ajax({
			type :"GET",
			url : "<%=cp%>/goods/photoReplyComment.action?BC_NUM="+BC_NUM+"&curPage="+num,
			success:function(result){
					$("#photoReplyModifier").html(result); 
					$('#photoReplyModifier').css('visibility','visible');
			},
			error: function(result) {
				swal("안된다");
	 	    }
	     });
	}
</script>


</head>
<body>
	<form action="" name="replylistForm" method="post">
	 <c:forEach var="rp_dto" items="${rp_list}">
			<!-- 대댓글 목록 -->
			<table border="1" bordercolor="#b3cccc" align="center" width="80%" style="border-radius: 20px;" id="replyCatalog">
				<!-- 댓글 목록 -->
					<tr height="60px;" class="even">
						<!-- 아이디, 작성날짜 -->
						<td width="15%" valign="top" style="border:none">
							<div style="width: 120px; height: 40px;">
							<div style="margin-top: 15%"></div>
								${rp_dto.getBC_ID()}<br> <font color="b3cccc" size="2">${rp_dto.getBC_DATE()}</font>
							</div>
						</td>
						<!-- 본문내용 -->
						<td width="70%">
							${rp_dto.getBC_CONTENT()}
						</td>
						<!-- 버튼 -->
						<td width="15%" style="border: none">
							<div id="btn" style="text-align: center;">
								<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
								<c:if test="${rp_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
									<button type="button"  onclick="photoUpdateOpen(${rp_dto.getBC_NUM()})" class="btnGray" style="width: 100%;height: 70px">수정</button>
								</c:if>
							</div> 
									<input type="hidden" id="BC_UPDATE" value="${rp_dto.getBC_NUM()}">
						</td>
					</tr>
					<br>
				</table>
		</c:forEach> 
		<table style="border: none;color: black;font-size: 20px">
				<tr>
					<c:if test="${count != 0 }">
		            <td style="border-bottom: none;background: transparent;">
		                <!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
		                <c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
		                    <c:choose>
		                        <c:when test="${num == replyPager.curPage}">
					                <input type="hidden" name="prNum" id="prNum" value="${num}"/>
		                            ${num}&nbsp;
		                        </c:when>
		                        <c:otherwise>
		                            <a href="javascript:prReplyLoder('${num}')">${num}</a>&nbsp;
		                        </c:otherwise>
		                    </c:choose>
		                </c:forEach>
		            </td>
		            </c:if>
		        </tr>
		          <tr>
				      <c:if test="${count == 0 }">
				        	<td style="border-bottom: none">
				        		등록된 댓글이 없습니다.
				        	</td>
			        	</c:if>
			        </tr>
		</table>	
	<div id="photoReplyModifier"></div>
</form>
</body>
</html>