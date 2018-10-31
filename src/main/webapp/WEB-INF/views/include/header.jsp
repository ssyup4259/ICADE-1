<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	function msg() {
		alert('지금은 채용 기간이 아닙니다.');
	}
</script>

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
				<a href="<%=cp%>/member/join.action">회원가입</a>
			</li>

			<li style="float: right">
				<a href="<%=cp%>/login.action">로그인</a>
			</li>

		</c:if>

		<c:if test="${sessionScope.userInfo.getM_RANK() == 'admin'}">
			<li class="dropdown" style="float: right;">
				<a href="javascript:void(0)" class="dropbtn" id="mm">관리자 메뉴</a>

				<div class="dropdown-content">
					<a href="<%=cp%>/admin/goodsList.action">관리자 상품 목록</a> <a href="<%=cp%>/admin/memberList.action">회원 목록</a><a href="<%=cp%>/logout.action">로그아웃</a>
				</div>
			</li>
		</c:if>

		<c:if test="${!empty sessionScope.userInfo}">
			<c:if test="${sessionScope.userInfo.getM_RANK() != 'admin'}">

				<li class="dropdown" style="float: right;">
					<a href="javascript:void(0)" class="dropbtn" id="mm">회원 메뉴</a>

					<div class="dropdown-content">
						<a href="<%=cp%>/cart/cartList.action">장바구니</a> <a href="<%=cp%>/myPage.action">마이페이지</a><a href="<%=cp%>/logout.action">로그아웃</a>
					</div>
				</li>

			</c:if>

			<li style="float: right;">
				<a>${sessionScope.userInfo.getM_ID()}님 환영합니다.</a>
			</li>
		</c:if>

	</ul>
</div>

<div class="container-fluid text-center" style="color: #8F9493; margin-bottom: 10px;">
	<a href="" onclick="msg();" style="cursor: pointer;">입사지원</a>&nbsp;&nbsp;<a href="">주문조회</a>
	<img src="/icade/resources/data/logo/logo1.png">
	<a href="">고객센터</a>&nbsp;&nbsp;<a href="<%=cp%>/notice/noticeList.action">공지사항</a>
</div>