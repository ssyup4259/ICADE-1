<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<div class="navbar container-fluid sticky" style="z-index: 90;">
	<ul>
		<li>
			<img src="/icade/resources/data/logo/logo2.png" width="140" height="47" style="cursor: pointer;" onclick="javascript:location.href='<%=cp%>';">
		</li>
		
		<li class="dropdown">
			<a href="javascript:void(0)" class="dropbtn">케이스</a>
			<div class="dropdown-content">
				<c:forEach var="gk_dto" items="${gk_lists}" end="1">
					<a href="<%=cp%>/goods/goodsList.action?GK_KIND_NUM=${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</a>
				</c:forEach>
			</div>
		</li>
		
		<li class="dropdown">
			<c:forEach var="gk_dto" items="${gk_lists}" begin="2" end="2">
				<a href="<%=cp%>/goods/goodsList.action?GK_KIND_NUM=${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</a>
			</c:forEach>
		</li>
		
		<li class="dropdown">
			<a href="javascript:void(0)" class="dropbtn">악세서리</a>
			<div class="dropdown-content">
				<c:forEach var="gk_dto" items="${gk_lists}" begin="3">
					<a href="<%=cp%>/goods/goodsList.action?GK_KIND_NUM=${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</a>
				</c:forEach>
			</div>
		</li>
		
		<c:if test="${empty sessionScope.userInfo}">
		
			<li style="float: right">
				<a href="<%=cp%>/join.action">회원가입</a>
			</li>
			
			<li style="float: right">
				<a href="<%=cp%>/login.action">로그인</a>
			</li>
			
		</c:if>
		
		<c:if test="${!empty sessionScope.userInfo}">
			<li style="float: right">
				<a href="<%=cp%>/logout.action">로그아웃</a>
			</li>
			<li style="float: right">
				<a href="<%=cp%>/cart/cartList.action">장바구니</a>
			</li>
		</c:if>
		
		
		
		
		<c:if test="${sessionScope.userInfo.getM_RANK() == 'admin'}">
			<li style="float: right">
				<a href="<%=cp%>/admin/goodsList.action">관리자 상품 목록</a>
			</li>
			
			<li style="float: right">
				<a href="<%=cp%>/admin/memberList.action">회원 목록</a>
			</li>
		</c:if>
		
	</ul>
</div>

<div class="container-fluid text-center">
	<img src="/icade/resources/data/logo/logo1.png">
</div>