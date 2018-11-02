<%@ page contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

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
								${bc_dto.getBC_ID()}<br> <font color="b3cccc" size="2">${bc_dto.getBC_DATE()}</font>
							</div>
						</td>
						<!-- 본문내용 -->
						<td width="70%">
							${bc_dto.getBC_CONTENT()}
						</td>
						<!-- 버튼 -->
						<td width="15%">
							<div id="btn" style="text-align: center;">
								<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
								<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
									<a href="#" onclick="cmUpdateOpen(${bc_dto.getBC_NUM()},${bc_dto.getBC_CONTENT()}">[수정]</a>
								</c:if>
							</div> 
						</td>
					</tr>
	</table>
</body>
</html>