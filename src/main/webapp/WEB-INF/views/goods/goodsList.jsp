<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/sangyeop.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
.sticky {
	position: sticky;
	top: 0px;
}

.sticky2 {
	position: sticky;
	top: 3px;
}
</style>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/goods/goodsList.action";
		f.submit();
		
	}

</script>

</head>
<body>
	<div class="navbar container-fluid sticky" style="z-index: 90;">
		<ul>
			<li>
				<img src="/icade/resources/data/logo/logo2.png" width="140" height="47" style="cursor: pointer;" onclick="';">
			</li>

			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">케이스</a>
				<div class="dropdown-content">
					<a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">일반</a> <a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">주문제작</a>
				</div>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">필름</a>
			</li>
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">악세서리</a>
				<div class="dropdown-content">
					<a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">케이블</a> <a href="<%=cp%>/ikeloom/list.do?g_room=livingroom&g_kind_num=11">충전기</a>
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

	<div class="container-fluid text-center" style="margin-top: 57px;">
		<img src="/icade/resources/data/logo/logo1.png">
	</div>

	<div class="container-fluid sticky2" style="width: 700px; z-index: 999;">
		<div class="collapse navbar-collapse" id="myNavbar">
			<div align="center" style="margin-top: 25px;">
				<form class="form-inline" action="" name="searchForm" method="post">
					<input type="hidden" name="GK_KIND_NUM" value="${GK_KIND_NUM}" />
					<select name="searchKey" class="sel1" style="width: 100px;">
						<option value="G_NAME">상품명</option>
						<option value="G_CONTENT">내용</option>
					</select>
					<input type="text" class="inputBox" name="searchValue" placeholder="검색할 단어를 입력하세요" style="width: 300px;">
					<button type="button" class="btn" style="width: 100px;" onclick="sendIt();">검색</button>
				</form>
			</div>
		</div>
	</div>

	<div class="container-fluid" style="background-color: #F2F1F0;">
		<div class="container-fluid col-sm-8">

			<div class="row">
				<div class="container-fluid" style="width: 120%;">
					<font style="color: #8F949; font-size: 30px;">상품 리스트</font>
					<br>
					<br>
					<c:set var="i" value="0" />
					<c:forEach var="g_dto" items="${g_lists}">

						<c:if test="${i % 4 == 0}">
							<div class="row">
						</c:if>

						<div class="col-sm-3 thumbnail" style="border-radius: 30px; padding: 6px;">
							<a href="#"> <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="width: 100%; height: 380px; border-top-left-radius: 30px; border-top-right-radius: 30px;" alt="Image">
								<div class="caption">
									<p>${g_dto.getG_NAME()}</p>
									남은 수량 : ${g_dto.getG_COUNT()}
								</div>
							</a>
						</div>
						<br>


						<c:if test="${i % 4 == 3 || g_lists.size() == i+1}">
				</div>
				</c:if>

				<c:set var="i" value="${i+1}" />

				</c:forEach>
				<c:if test="${dataCount!=0 }">
	${pageIndexList }
</c:if>
				<c:if test="${dataCount==0 }">
	등록된 상품이 없습니다.
</c:if>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	<br>
	<br>


</body>
</html>