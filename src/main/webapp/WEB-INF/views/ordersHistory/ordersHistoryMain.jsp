<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<title>주문 내역 조회</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=cp%>/resources/data/js/ordersHistoryScript.js"></script>

<script type="text/javascript">

	function cancelIt(imp_uid, o_num) {
		
		var refund = confirm("환불 하시겠습니까?");
		
		if(refund == true){
			
		  $.ajax({			
				type : "post",
				url :"<%=cp%>/payment/cancel.action",
				data : {"imp_uid":imp_uid, "o_num":o_num},
				datatype : "text",
				success : function(data) {
					cancelOK(data);
				},
				error : function(data) {
					alert("error");
					alert(data);
				}
			});
		}
	}
	
	function cancelOK(o_num) {
		
		$.ajax({			
			type : "post",
			url :"<%=cp%>/payment/cancelOK.action",
			data : {"o_num":o_num},
			datatype : "text",
			success:function(data){
				
				if (data == "success") {
					location.href="<%=cp%>/orderHistory.action";
				}
				console.log(data);
			},
			error: function(data) {
				alert("error");
				alert(data);
			}
		});
	}
	
</script>

<script type="text/javascript">
	$('.btnGray').on('click', function() {
		$(this).toggleClass('active');
	});
</script>
<style type="text/css">
.btnGray {
	border-radius: 6px;
	width: 50px;
	height: 30px;
}

.btnGray.active {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
	background-color: #8F9493;
	color: white;
}
</style>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<div class="container-fluid" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
	<div class="container">
		<div class="titleArea">
			<h2>주문조회</h2>
		</div>

<form method="post" id="OrderHistoryFormId" name="OrderHistoryForm" action="orderHistory.action">
	<div class="container-fluid" style="border: 2px solid black; border-radius: 6px; padding-bottom: 30px;">
		<h2>검색기간설정</h2>
		<!-- 오늘,1주일,1개월,3개월,6개월 이미지 버튼 -->
		<div class="row">
			<div class="col-sm-4">
				<input type="button" class="btnGray" value="오늘" id="today">
				<input type="button" class="btnGray" value="1주일" id="oneWeek">
				<input type="button" class="btnGray" value="1개월" id="oneMonth">
				<input type="button" class="btnGray" value="3개월" id="threeMonth">
				<input type="button" class="btnGray" value="6개월" id="sixMonth">
			</div>
		<!-- 기간 지정부분 -->
			<div class="col-sm-6" style="text-align: left;">
				<input type="text" id="sdate" class="inputBoxGray" name="startDay" style="width: 200px; height: 30px;">
				~
				<input type="text" id="edate" class="inputBoxGray" name="endDay" style="width: 200px; height: 30px;">
			</div>
		<!-- 조회 버튼 -->
			<div class="col-sm-2">
				<input type="button" class="btnGreen" value="조회" id="order_search_btn" style="width: 100px; height: 30px; font-size: 8px;">
			</div>
		</div>
		<div>
			기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.
			<br />
			주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.
		</div>
	</div>
</form>
	<div class="container-fluid" style="border: 2px solid black; border-radius: 6px; padding-bottom: 30px;">
		<h2>주문 상품 정보</h2>
			<table border="1" style="width: 100%;">
				<colgroup>
					<col style="width: 14.5%;">
					<col style="width: 10.5%;">
					<col style="width: 16.5%;">
					<col style="width: 8.5%;">
					<col style="width: 12.5%;">
					<col style="width: 12.5%;">
					<col style="width: 12.5%;">
				</colgroup>

				<thead>
					<tr>
						<th scope="col">주문일자<br>[주문번호]</th>
						<th scope="col">이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">상품구매금액</th>
						<th scope="col">주문처리상태</th>
						<th scope="col">취소/교환/반품</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="map" items="${hashMap}">
						<c:forEach var="dto" items="${map.value }">
							<tr>
								<td class="gubun">
									<p>${dto.getO_DATE()}<br />
										<a href="ordersHistoryDetail.action?o_num=${dto.getO_NUM()}" class="line">[${dto.getO_NUM()}]</a>
									</p> 
										<a href="#none" class="line" onclick="location.href='ordersHistoryDetail.action?o_num=${dto.getO_NUM()}'">[상세정보]</a>
								</td>
								<td>
									<a href="/icade/goods/goodsArticle.action?G_NUM=${dto.getGD_NUM()}"> <img src="/icade/resources/goodsImage/${dto.getG_SAVEFILENAME()}" width="80" height="80"></a>
								</td>
								<td>
									<a href="/icade/goods/goodsArticle.action?G_NUM=${dto.getGD_NUM()}"> <strong>${dto.getOD_NAME()}</strong></a>
										<div class="option ">[옵션: ${dto.getOD_NAME()}-${dto.getOD_DEVICE()}-${dto.getOD_COLOR()}]</div></td>
								<td>${dto.getOD_COUNT()}</td>
								<td><strong><fmt:formatNumber>${dto.getOD_PRICE()}</fmt:formatNumber>원</strong></td>
								<td class="gubun">
									<p style="display: none;">${dto.getO_IMP()}</p>
									<p>${dto.getO_STATUS()}</p>
								</td>
								<td class="gubun">
									<p style="display: none;">${dto.getO_IMP()}</p>
									<form action="" method="post" name="myForm">										
										<c:if test="${dto.getO_STATUS() eq '배송준비중'}">
											<input type="button" value="환불 하기" onclick="cancelIt('${dto.getO_IMP()}', ${dto.getO_NUM()});" />
										</c:if>
									</form>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				<tr>
					<td colspan="7">
						<c:if test="${dataCount==0}">
							<p class="message ">주문 내역이 없습니다.</p>
						</c:if> 
						<c:if test="${dataCount!=0 }">
							${pageIndexList}
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

<br/><br/>

<form method="get">
	<input type="hidden" name="endPage" value="${endPgae}">
</form>

	</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false" />
<script type="text/javascript">

	$(window).load(function () {
	    $(".gubun").each(function () {
	        var rows = $(".gubun:contains('" + $(this).text() + "')");
	        if (rows.length > 1) {
	          rows.eq(0).attr("rowspan", rows.length);
	          rows.not(":eq(0)").remove();
	        }
	    });
	});

<%-- 	
	$(document).ready(function (){
		var startDate = <%=request.getParameter("startDate")%>
		
		if(!startDate){
			alert("없다");
		}else{
			alert("있다?");
		}
	});
 --%>	
</script>
</body>
</html>