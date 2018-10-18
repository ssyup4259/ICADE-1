<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%-- <jsp:include page="/ikeloom_include/header.jsp" flush="false" /> --%>
	<div class="content2">
		<form name="myForm" method="post" action="">
			<Br> <br> <br> <br>
			<table width="1000" align="center">
				<tr>
					<td colspan="2" align="center">
						<h1>상품 상세정보</h1>
					</td>
				</tr>
				<tr>
					<td width="340">
						<img src="${imagePath}/${g_dto.gCode}.jpg" width="340" height="300">
					</td>
					<td>
						<table width="100%" height="300">
							<tr align="center">
								<td>상품명</td>
								<td>${g_dto.gName}</td>
							</tr>
							<tr align="center">
								<td>가격</td>
								<td>
									<fmt:formatNumber>${g_dto.gPrice}</fmt:formatNumber>
									원
								</td>
							</tr>
							<tr align="center">
								<td>상품소개</td>
								<td>${g_dto.gContent}</td>
							</tr>
							<tr align="center">
								<td>상품크기</td>
								<td>가로 = ${g_dto.gWidth}cm, 세로 = ${g_dto.gVertical}cm, 높이 = ${g_dto.gHeight}cm</td>
							</tr>
							<tr>
								<td colspan="2" height="2" bgcolor="#b3cccc"></td>
							</tr>
							<tr align="center">
								<td align="center" colspan="2">
									<input type="hidden" name="productId" value="${g_dto.gNum}">
									수량 :
									<input type=button value="◀" class="btn" onClick="UpDownCount('-');" style="text-align:center; height: 30px; width: 30px;">
									<input type="text" value="1" name="gCount" size="4" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" 
									style="text-align: center; border-radius: 8px; border-color: #b3ccccc; color: #5c8a8a; font-size: 16px;" />
									<input type=button value="▶" class="btn" onClick="UpDownCount('+');" style="text-align:center; height: 30px; width: 30px;">
									<br /> <font color="red" size="3">재고수량 : <fmt:formatNumber>${g_dto.gCount}</fmt:formatNumber>개
									</font><br />
									<input type="button" value="구매하기" onclick="orderIt();" class="btn" />
									<input type="button" value="장바구니에 담기" onclick="insertCart();" class="btn" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" height="2" bgcolor="#b3cccc"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<c:if test="${!empty pageNum}">
							<br>
							<div id="btn">
								<a href="<%=cp %>/ikeloom/list.do?pageNum=${pageNum}&g_room=${g_room}&g_kind_num=${g_kind_num}">
									<h2>상품목록으로 돌아가기</h2>
								</a>
							</div>
							<br>
						</c:if>
						<!-- 최근본 상품목록에서 클릭했을 경우 -->
						<c:if test="${empty pageNum}">
							<br>
							<div id="btn">
								<a href="<%=cp%>/ikeloom/list.do?pageNum=1&g_room=bedroom&g_kind_num=10">
									<h2>상품목록으로 돌아가기</h2>
								</a>
							</div>
							<br>
						</c:if>
					</td>
				</tr>

			</table>
			<input type="hidden" name="gCode" value="${g_dto.gCode}" />
		</form>


</body>
</html>