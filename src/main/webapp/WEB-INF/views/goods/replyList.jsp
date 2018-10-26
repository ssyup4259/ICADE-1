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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<table style="width: 700px">
		<c:if test="${!empty bc_lists}">
					<c:forEach var="bc_dto" items="${bc_lists}">
						<tr height="60px;" class="even">
							<!-- 아이디, 작성날짜 -->
							<td width="15%" valign="top">
								<div style="width: 120px; height: 40px;">
								<div style="margin-top: 15%"></div>
									<c:if test="${bc_dto.getLevel() > 1}">
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
									<!-- 이부분은 확인 필요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
									
									<c:if test="${bc_dto.getBC_ID() eq sessionScope.userInfo.getM_ID() || sessionScope.userInfo.getM_ID() eq 'admin'}">
										<c:if test="${bc_dto.getLevel() eq 1}">
											<a href="#" onclick="cmReplyOpen(${bc_dto.getBC_NUM()});">[답변]</a>
											<br>
										</c:if>
									</c:if>

									<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
									<c:if test="${bc_dto.getBC_ID() == sessionScope.userInfo.getM_ID()}">
										<a href="#" onclick="cmUpdateOpen(${bc_dto.getBC_NUM()},${bc_dto.getBC_CONTENT()}">[수정]</a>
											<br>
										<a href="#" onclick="cmDeleteOpen(${bc_dto.getBC_NUM()});">[삭제]</a>
										<br>
									</c:if>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
	</table>
</body>
</html>