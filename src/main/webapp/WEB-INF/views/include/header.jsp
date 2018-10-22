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

		<li style="float: right">
			<a href="<%=cp%>/ikeloom/created.do">회원가입</a>
		</li>
		<li style="float: right">
			<a href="<%=cp%>/ikeloom/login.do">로그인</a>
		</li>
	</ul>
</div>

<div class="container-fluid text-center">
	<img src="/icade/resources/data/logo/logo1.png">
</div>