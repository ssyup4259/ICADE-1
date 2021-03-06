<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<link rel="shortcut icon" type="image⁄x-icon" href="<%=cp%>/resources/images/logo3.png">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function msg() {
		swal('지금은 채용 기간이 아닙니다.');
	}
</script>
<style type="text/css">
.animation1{
	position: relative;
    animation-name: example1;
    animation-duration: 6s;
    animation-delay: 2s;
}

.animation2{
	position: relative;
    animation-name: example2;
    animation-duration: 6s;
    animation-delay: 2s;
}


/* Standard syntax */
@keyframes example1 {
    0%   {left:0px; top:0px;}
    20%  {left:400px; top:0px;}
    40%  {left:-400px; top:0px;}
    60%  {left:800px; top:0px;}
    80% {left:-800px; top:0px;}
    100% {left:0px; top:0px;}
    from {transform: rotate(0deg);}
    to {transform: rotate(360deg);}
}

@keyframes example2 {
    0%   {left:0px; top:0px;}
    100% {left:0px; top:0px;}
    from {transform: rotate(0deg);}
    to {transform: rotate(360deg);}
}

</style>

<div class="navbar container-fluid sticky" style="z-index: 90;">
	<ul>
		<li>
			<img src="/icade/resources/data/logo/logo2.png" class="animation2" width="140" height="47" style="cursor: pointer;" onclick="javascript:location.href='<%=cp%>';">
		</li>

		<li class="dropdown">
			<c:forEach var="gk_dto" items="${gk_lists}" end="0">
				<a href="<%=cp%>/goods/goodsList.action?GK_KIND_NUM=${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</a>
			</c:forEach>
		</li>

		<li class="dropdown">
			<c:forEach var="gk_dto" items="${gk_lists}" begin="1" end="1">
				<a href="<%=cp%>/goods/goodsList.action?GK_KIND_NUM=${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</a>
			</c:forEach>
		</li>

		<li class="dropdown">
			<a href="javascript:void(0)" class="dropbtn">악세서리</a>
			<div class="dropdown-content">
				<c:forEach var="gk_dto" items="${gk_lists}" begin="2">
					<a href="<%=cp%>/goods/goodsList.action?GK_KIND_NUM=${gk_dto.getGK_NUM()}">${gk_dto.getGK_KIND()}</a>
				</c:forEach>
			</div>
		</li>

		<c:if test="${empty sessionScope.userInfo}">

			<li style="float: right">
				<a href="<%=cp%>/member/agree.action">회원가입</a>
			</li>

			<li style="float: right">
				<a href="<%=cp%>/login.action">로그인</a>
			</li>

		</c:if>

		<c:if test="${sessionScope.userInfo.getM_RANK() == 'admin'}">
			<li class="dropdown" style="float: right;">
				<a href="javascript:void(0)" class="dropbtn" id="mm">관리자 메뉴</a>

				<div class="dropdown-content">
					<a href="<%=cp%>/faq.action">공지사항 등록</a> <a href="<%=cp%>/admin/goodsList.action">관리자 상품 목록</a> <a href="<%=cp%>/admin/memberList.action">회원 목록</a> <a href="<%=cp%>/admin/payments.action">회원 결제 내역</a> <a href="<%=cp%>/logout.action">로그아웃</a>
				</div>
			</li>
		</c:if>

		<c:if test="${!empty sessionScope.userInfo}">
			<c:if test="${sessionScope.userInfo.getM_RANK() != 'admin'}">

				<li class="dropdown" style="float: right;">
					<a href="javascript:void(0)" class="dropbtn" id="mm">회원 메뉴</a>

					<div class="dropdown-content">
						<a href="<%=cp%>/cart/cartList.action">장바구니</a> <a href="<%=cp%>/myPage.action?m_id=${sessionScope.userInfo.getM_ID()}">마이페이지</a><a href="<%=cp%>/logout.action">로그아웃</a>
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
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<a onclick="msg();" style="cursor: pointer;">입사지원</a>&nbsp;&nbsp;<a href="<%=cp%>/faq.action">FAQ&공지사항</a>
				<img src="/icade/resources/data/logo/logo1.png" class="animation1" onclick="javascript:location.href='<%=cp%>';" style="cursor: pointer;">
				<a href="<%=cp%>/orderHistory.action">주문조회</a>&nbsp;&nbsp;&nbsp;<a href="<%=cp%>/goods/replyAllList.action">포토후기</a>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</div>