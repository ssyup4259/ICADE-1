<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>상품목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/sangyeop.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function sendIt() {

		var f = document.searchForm;

		f.submit();

	}
</script>
<style type="text/css">
.sticky {
	position: sticky;
	top: 0px;
}

.sticky2 {
	position: sticky;
	top: 3px;
}

table {
	border-collapse: collapse;
	width: 100%;
	border: 3px solid #A3C838;
	border-top-left-radius: 12px;
	text-align: center;
}

th, td {
	padding: 8px;
	border-bottom: 1px solid #A3C838;
}

tr:hover {
	background-color: white;
}

/* 
모달 */
.modal-open {
	overflow: hidden
}

.modal-open .modal {
	overflow-x: hidden;
	overflow-y: auto
}

.modal {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1050;
	display: none;
	overflow: hidden;
	outline: 0
}

.modal-dialog {
	position: relative;
	width: auto;
	margin: .5rem;
	pointer-events: none
}

.modal.fade .modal-dialog {
	transition: -webkit-transform .3s ease-out;
	transition: transform .3s ease-out;
	transition: transform .3s ease-out, -webkit-transform .3s ease-out;
	-webkit-transform: translate(0, -25%);
	transform: translate(0, -25%)
}

@media screen and (prefers-reduced-motion:reduce) {
	.modal.fade .modal-dialog {
		transition: none
	}
}

.modal.show .modal-dialog {
	-webkit-transform: translate(0, 0);
	transform: translate(0, 0)
}

.modal-dialog-centered {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	min-height: calc(100% - ( .5rem * 2))
}

.modal-dialog-centered::before {
	display: block;
	height: calc(100vh - ( .5rem * 2));
	content: ""
}

.modal-content {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 100%;
	pointer-events: auto;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: .3rem;
	outline: 0
}

.modal-backdrop {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1040;
	background-color: #000
}

.modal-backdrop.fade {
	opacity: 0
}

.modal-backdrop.show {
	opacity: .5
}

.modal-header {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: start;
	align-items: flex-start;
	-ms-flex-pack: justify;
	justify-content: space-between;
	padding: 1rem;
	border-bottom: 1px solid #e9ecef;
	border-top-left-radius: .3rem;
	border-top-right-radius: .3rem
}

.modal-header .close {
	padding: 1rem;
	margin: -1rem -1rem -1rem auto
}

.modal-title {
	margin-bottom: 0;
	line-height: 1.5
}

.modal-body {
	position: relative;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1rem
}

.modal-footer {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: end;
	justify-content: flex-end;
	padding: 1rem;
	border-top: 1px solid #e9ecef
}

.modal-footer
>
:not


(
:first-child


){
margin-left


:


.25rem


}
.modal-footer
>
:not


(
:last-child


){
margin-right


:


.25rem


}
.modal-scrollbar-measure {
	position: absolute;
	top: -9999px;
	width: 50px;
	height: 50px;
	overflow: scroll
}

@media ( min-width :576px) {
	.modal-dialog {
		max-width: 500px;
		margin: 1.75rem auto
	}
	.modal-dialog-centered {
		min-height: calc(100% - ( 1.75rem * 2))
	}
	.modal-dialog-centered::before {
		height: calc(100vh - ( 1.75rem * 2))
	}
	.modal-sm {
		max-width: 300px
	}
}

@media ( min-width :992px) {
	.modal-lg {
		max-width: 800px
	}
}
</style>
<script type="text/javascript">
function sendIt() {
	
	var f = document.myForm;
	        
	f.action = "<%=cp%>/admin/updateGoodsDetailCount.action";
	f.submit();

}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container">
		<h2>Modal Example</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>
					<div class="modal-body">
						<h3>상품 재고 수정</h3>
						<h1>${g_name}</h1>
						<form action="" method="post" name="myForm">

							<c:set var="i" value="plz" />

							<c:forEach var="gd_dto" items="${gd_lists}">

								<c:if test="${i ne gd_dto.DK_NAME}">
									<br />
									<br />${gd_dto.DK_NAME}<br />
								</c:if>

								<c:if test="${i eq gd_dto.DK_NAME}">
									<br />
								</c:if>

								<c:set var="i" value="${gd_dto.DK_NAME}" />
		
		${gd_dto.GC_COLOR} : <input type="text" name="GD_COUNT" value="${gd_dto.GD_COUNT}" size="3" />개&nbsp;
		<input type="hidden" name="GD_CODE" value="${gd_dto.GD_CODE}" />

							</c:forEach>
							<br />
							<br />
							<input type="button" onclick="sendIt()" value="재고 수정" />
							<input type="button" onclick="javascript:history.back();" value="취 소" />

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

	</div>

	<div class="container-fluid" style="background-color: #F2F1F0;">

		<div class="container-fluid text-center">
			<br>
			<h1>상품 목록</h1>
			<form action="" name="searchForm" method="post">
				<select name="GD_KIND_NUM" class="sel">
					<option value="">전체</option>
					<c:forEach var="gk_dto" items="${gk_lists}">
						<c:if test="${gdKindNum eq gk_dto.GK_NUM}">
							<option value="${gk_dto.GK_NUM}" selected="selected">${gk_dto.GK_KIND}</option>
						</c:if>
						<c:if test="${gdKindNum ne gk_dto.GK_NUM}">
							<option value="${gk_dto.GK_NUM}">${gk_dto.GK_KIND}</option>
						</c:if>
					</c:forEach>
				</select>

				<select name="searchKey" class="sel" style="width: 150px;">
					<option value="G_NAME">상품명</option>
					<option value="G_CONTENT">내용</option>
				</select>

				<input type="text" name="searchValue" class="inputBox">
				<input type="button" value=" 검색 " class="btn" onclick="sendIt();" style="width: 150px;" />

				<input type="button" value=" 상품 등록 " class="btn" onclick="javascript:location.href='<%=cp%>/admin/insertGoods.action';" style="width: 150px;" />

			</form>

			<table cellpadding="10" cellspacing="0">
				<thead style="border: none;">
					<tr>
						<th>상품 종류</th>
						<th>상품 이름</th>
						<th>상품 개수</th>
						<th>상품 가격</th>
						<th>판매 개수</th>
						<th>상품 내용</th>
						<th>할인율</th>
						<th>섬네일</th>
						<th>수정/삭제</th>
					</tr>
				</thead>
				<tbody style="border: none;">

					<c:forEach var="g_dto" items="${g_lists}">
						<tr>
							<td>${g_dto.getGK_KIND()}</td>
							<td><a href="#">${g_dto.getG_NAME()}</a></td>
							<td><a href="<%=cp%>/admin/updateGoodsDetailCount.action?g_num=${g_dto.getG_NUM()}">${g_dto.getG_COUNT()}</a></td>
							<td>${g_dto.getG_PRICE()}</td>
							<td>${g_dto.getG_SELLCOUNT()}</td>
							<td>${g_dto.getG_CONTENT()}</td>
							<td>${g_dto.getG_DISCOUNT()}</td>
							<td><img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" width="100" height="100" /></td>
							<td><a href="<%=cp%>/admin/updateGoods.action?g_num=${g_dto.getG_NUM()}">수정</a> / <a href="<%=cp%>/admin/deleteGoods.action?g_num=${g_dto.getG_NUM()}">삭제</a></td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="9"><c:if test="${dataCount!=0 }">
				${pageIndexList }
					</c:if> <c:if test="${dataCount==0 }">
				등록된 상품이 없습니다.
					</c:if></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>