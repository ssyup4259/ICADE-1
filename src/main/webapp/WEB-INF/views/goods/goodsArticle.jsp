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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이폰 케이스는 ICADE</title>
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<style type="text/css">
body {
	position: relative;
}

.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix ~ .container-fluid {
	position: relative;
	top: 50px;
}

#section1 {
	padding-top: 50px;
}

#section2 {
	padding-top: 50px;
}

#section3 {
	padding-top: 50px;
}

input.up {
	background: url("<%=cp%>/resources/images/btn_quantity_up.gif")
		no-repeat;
	border: none;
	width: 22px;
	height: 13px;
	cursor: pointer;
}

input.down {
	background: url("<%=cp%>/resources/images/btn_quantity_down.gif")
		no-repeat;
	border: none;
	width: 22px;
	height: 13px;
	cursor: pointer;
}
</style>


<!-- 콤보박스 연결 -->
<script type="text/javascript">
$(function() {

	var select = "<option value='none'>:: 선택 ::</option>"; 
	$("#product").change(function() {
		if($("#product").val() == "") { // select의 value가 ""이면, "선택" 메뉴만 보여줌.
			$("#sub").find("option").remove().end().append(select);
		} else {
			comboChange($(this).val());
		}
	});

	function comboChange(deviceCode) {
		
		var G_NUM = ${g_dto.getG_NUM()};
		
		var allData = {"GD_DEVICE":deviceCode, "G_NUM":G_NUM};
		
		$.ajax({
			type:"post",
			url:"<%=cp%>/goods/colorCheck.action",
			datatype:  'json',
			data: allData,
			success: function(data)
			{
				var dc_list = [];
				
				dc_list = data;
				
				if(dc_list.length > 0) {
					
					$("#sub").find("option").remove().end().append(select);
					
					$.each(dc_list, function(key, value) {
						$("#sub").append("<option value='" + value.gd_COLOR + "'>" + value.gc_COLOR + "</option>");
						$("#sub").append("<input id='code" + value.gd_COLOR + "' type='hidden' value='" + value.gd_COUNT + "'/>");
						console.log(value);
					});
					
				} else {
					$("#sub").find("option").remove().end().append("<option>-- No sub --</option>");
					return;
				}
			},
			
			error: function() {

				alert("안된다");
				
			}				
		});
	}	
});

</script>


<script type="text/javascript">

	function countUp() {
		
		var count = Number(document.getElementById("GD_COUNT").value);
		
		count = count + 1;
		
		document.getElementById("GD_COUNT").value = count;
		change();
	}
	
	function countDown() {
		
		var count = Number(document.getElementById("GD_COUNT").value);
		
		if (count <= 1) {
			return;
		}
		
		count = count - 1;
		
		document.getElementById("GD_COUNT").value = count;
		change();
	}
	
	//장바구니에 추가
	function insertCart() {
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/cart/insertCart.action";
		f.submit();
		
	}

	function change() {
		
	 	var hm = Number(document.getElementById("GD_COUNT").value);
	 	
	 	var sell_price =${g_dto.getG_PRICE()};

			if (hm < 0) {
				hm = 0;
			}
		document.getElementById("sum").value = (hm) * sell_price;
	}  

	
	
	//장바구니에 추가 전 동일품목여부 조회
	function insertCheck() {
		
		var f = document.myForm;
		
		if (f.GD_DEVICE.value == "none") {
			alert("기종을 선택 해 주세요.");
			f.GD_DEVICE.focus();
			return;
		}
		
		if (f.GD_COLOR.value == "none") {
			alert("색상을 선택 해 주세요.");
			f.GD_COLOR.focus();
			return;
		}
		
		var allData = $("#myForm").serialize();
		
		$.ajax({
			
			type:"post",
			url:"<%=cp%>/cart/insertCheck.action",
			datatype : 'json',
			data : allData,
			success : function(data) {

				if (data == "success") {
					insertCart();
				} else if (data == "reduplication") {
					alert("이미 장바구니에 존재하는 상품입니다.");
				} else if (data == "lack") {
					alert("담고자하는 수량이 재고 수량보다 많습니다.");
				} else {
					alert("로그인 후 사용 가능합니다.");
				}

				console.log(data);

			},

			error : function(data) {
	
				alert("error");
				console.log(data);

			}
		});
	}
</script>

<!-- 구매하기 -->
<script type="text/javascript">

	function orderIt() {
		
		var f = document.myForm;
		var login = "${sessionScope.userInfo.getM_ID()}";
		var code = $("#sub").val();
		
		if (f.GD_DEVICE.value == "none") {
			alert("기종을 선택 해 주세요.");
			f.GD_DEVICE.focus();
			return;
		}
		
		if (f.GD_COLOR.value == "none") {
			alert("색상을 선택 해 주세요.");
			f.GD_COLOR.focus();
			return;
		}
		
		if (f.GD_COUNT.value > $("#code"+code).val()) {
			alert("구매하고자 하는 수량이 재고 수량보다 많습니다.");
			f.GD_COUNT.value = "";
			f.GD_COUNT.focus();
			return;
		}
		
		f.action = "<%=cp%>/buy/buyForm.action";
		
		if (login != "") {
			f.submit();	
		} else {
			alert("로그인 후 사용 가능합니다.");
		}

	}

</script>

<script type="text/javascript">
function like_func(g_num) {
	
	
	$.ajax({
		url:"<%=cp%>/wish/wishInsert.action",
		type:"post",
		chache:false,
		async:false,
		data :{'g_num':g_num},
		success : function(map) {
			var msg = '';
			var like_img = '';
			var num =map.g_num;
			var like_check = map.like_check;
		if(like_check!=1){
			$("#"+num).attr("src","<%=cp%>/resources/images/like.png");
			 if(document.URL.indexOf("##")==-1)
	            {
	                // Set the URL to whatever it was plus "#".
	                url = document.URL+"##";
	                location = "##";

	                //Reload the page
	                location.reload(true);

	            }
			
		}else if(like_check==1){
			
			$("#"+num).attr("src","<%=cp%>/resources/images/dislike.png");
			 if(document.URL.indexOf("##")==-1)
	            {
	                // Set the URL to whatever it was plus "#".
	                url = document.URL+"##";
	                location = "##";

	                //Reload the page
	                location.reload(true);

	            }
		}
		
	},
	error: function(){
		
		alert("실패");
		}
		
	});
	
	
}
</script>
<script type="text/javascript">
function login_need() {
	
	alert("로그인 후 찜목록을 눌러주세요!");
	
	
}

</script>

</head>

<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container">
			<form id="myForm" name="myForm" method="post" action="" enctype="multipart/form-data">
				<div align="left" style="font-size: 30px; margin-bottom: 10px; padding-left: 80px;">${g_dto.getG_NAME()}</div>
				<div class="row">
					<div class="col-sm-5">
						<img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="border-radius: 15px; height: 90%; width: 70%;">
					</div>
					<div class="col-sm-7" style="font-size: 20px;">
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">상품명</div>
							<div class="col-sm-9" style="text-align: left">${g_dto.getG_NAME()}<input type="hidden" name="G_NAME" value="${g_dto.getG_NAME()}" />
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">소비자가</div>
							<div class="col-sm-9" style="text-align: left">
								<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>
								원
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">판매가</div>
							<div class="col-sm-9" style="text-align: left">
								<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>
								원
								<input type="hidden" name="G_PRICE" value="${g_dto.getG_PRICE()}" />
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">적립금</div>
							<div class="col-sm-9" style="text-align: left">
								<img src="<%=cp%>/resources/images/credit/icon_201612281355512700.jpg" />
								<fmt:formatNumber>${g_dto.getG_PRICE()*0.1}</fmt:formatNumber>
								원
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">기종</div>
							<div class="col-sm-9" style="text-align: left">
								<c:if test="${!empty gd_list}">
									<input type="hidden" name="GD_KIND_NUM" value="${gd_list[0].getGD_KIND_NUM()}" />
									<select name="GD_DEVICE" id="product" class="sel" style="width: 100%;">
										<option value="none">::기종을 선택하세요::</option>
										<c:forEach var="gd_dto" items="${d_list}">
											<option value="${gd_dto.getGD_DEVICE()}">${gd_dto.getDK_NAME()}</option>
										</c:forEach>
									</select>
								</c:if>
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">색상</div>
							<div class="col-sm-9" style="text-align: left">
								<select name="GD_COLOR" id="sub" class="sel" style="width: 100%;">
									<option value="none">:: 색상을 선택해주세요 ::</option>
								</select>
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">수량</div>
							<div class="col-sm-9" style="text-align: left">
								<input type="button" id="down" class="down" onclick="countDown();" />
								<input type="text" class="inputBox" id="GD_COUNT" value="1" name="GD_COUNT" size="2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onchange="change();" style="width: 50px;" />
								개
								<input type="button" id="up" class="up" onclick="countUp();" />
							</div>
						</div>
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: left;">총 상품금액</div>
							<div class="col-sm-9" style="text-align: left">
								<input type="text" id="sum" class="inputBox" name="sum" value="${g_dto.getG_PRICE()}" readonly="readonly" style="width: 100%;" />
							</div>
						</div>
						<hr style="border-top: 2px solid black">
						<div class="row" style="height: 60px;">
							<div class="col-sm-3" style="text-align: right;">
								<c:choose>
									<c:when test="${!empty sessionScope.userInfo}">
										<c:choose>
											<c:when test="${w_Check ==1}">
												<a href='#'> <img src="<%=cp%>/resources/images/like.png" style="width: 30px" id="${g_dto.getG_NUM()}" onclick="like_func(${g_dto.getG_NUM()});">
												</a>
											</c:when>
											<c:otherwise>
												<a href='#'> <img src="<%=cp%>/resources/images/dislike.png" style="width: 30px" id="${g_dto.getG_NUM()}" onclick="like_func(${g_dto.getG_NUM()});">
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<a href='javascript: login_need();'> <img src="<%=cp%>/resources/images/dislike.png" style="width: 30px">
										</a>
									</c:otherwise>
								</c:choose>
								<a href="#section3"> <img src="<%=cp%>/resources/images/speech-bubble.png" style="width: 30px">
								</a>
							</div>
							<div class="row col-sm-9" style="text-align: left">
								<input type="hidden" name="G_NUM" value="${g_dto.getG_NUM()}">
								<input type="hidden" name="GD_NUM" value="${g_dto.getG_NUM()}">
								<div class="col-sm-6">
									<input type="button" value="구매하기" onclick="orderIt('code');" class="btnGray" style="width: 100%" />
								</div>
								<div class="col-sm-6">
									<input type="button" value="장바구니에 담기" onclick="insertCheck();" class="btnGray" style="width: 100%;" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr style="border-top: 2px solid black">
				<!-- divison 이동 -->
				<div class="conatiner-fluid sticky text-center" id="menu" style="z-index: 999; background-color: transparent; padding-top: 8px;">
					<a href="#section1"> <input type="button" class="btnGreen" value="상품상세정보" style="width: 200px;">
					</a>&nbsp;<a href="#section2"> <input type="button" class="btnGreen" value="상품구매안내" style="width: 200px;">
					</a>&nbsp;<a href="#section3"> <input type="button" class="btnGreen" value="상품사용후기" style="width: 200px;">
					</a>&nbsp;<a href="javascript:history.back();"><input type="button" class="btnGreen" value="상품목록으로 돌아가기" style="width: 200px;"></a>
				</div>

				<div id="section1" class="container-fluid">
					<div align="left">
						<h1>상품상세정보</h1>
					</div>
					<div>
						<img alt="" src="<%=cp%>/resources/goodsContentImage/${g_dto.getG_CONTENT_SAVE_FILE()}" />
					</div>
				</div>
				<hr>
				<!-- 상품구매안내 -->
				<div id="section2" class="container-fluid">
					<div align="left">
						<h1>상품구매안내</h1>
					</div>
					<div id="prdInfo" class="ec-base-tab grid5">
						<div class="cont">
							<h3>상품결제정보</h3>

							<div align="left">
								무통장 입금은 인터넷뱅킹, 텔레뱅킹, 스마트폰뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.
								<br>
								주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 3일 이내 로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
							</div>
						</div>
						<br>
						<br>
						<div class="cont">
							<h3>배송정보</h3>
							<div align="left">
								배송 방법 : 택배
								<br>
								배송 지역 : 전국지역
								<br>
								배송 비용 : 3000원
								<br>
								배송 기간 : 1일~3일
								<br>
								<div class="row" style="margin-left: 0;">
									<div>배송 안내 :</div>
									<div style="margin-left: 5px;">
										고객님께서 주문하신 상품은 입금 확인 후, 제작하여 발송처리합니다.
										<br>
										배송기간은 1일~3일입니다. 우체국택배를 이용하여 일요일,공휴일은 쉽니다.
									</div>
								</div>
							</div>
						</div>
						<br>
						<br>
						<div class="cont">
							<h3>교환 및 반품정보</h3>
							<div align="left">
								<div>
									<b style="font-size: 9pt;">현재 저희는 상품수령 즉시 불량이나 문제가 있을 경우 교환,환불처리가 가능하지만, 사용하시다가 생긴 고장은 A/S처리가 불가능합니다 더나은 서비스를 드리지못해 죄송합니다!</b>
								</div>
								<div>
									<b><br></b>
								</div>
								<div>※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.</div>
								<div>&nbsp; (색상 교환, 사이즈 교환 등 포함)(5,000원)</div>
							</div>
						</div>
						<br>
						<br>

						<div class="cont">
							<h3>서비스문의</h3>
							<div align="left">서비스 문의 안내는 고객센터 문의쪽에 남겨주시거나 카카오톡,페이스북 페이지로 글남겨주시면 바로답변드리겠습니다!!</div>
						</div>
					</div>
				</div>
				<hr>

			</form>
		</div>
	</div>



	<!-- 댓글부분 -->
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-bottom: 50px;">
		<div id="section3" class="container-fluid" style="width: 80%;">
			<ul style="background: transparent">
				<li style="float: left; padding-left: 15px">
					<p style="font-size: 30px">REVIEW | 포토리뷰 작성하고 적립금 받자!</p>
				</li>

				<li style="float: right; padding-top: 6px; padding-right: 15px">
					<input type="button" value="전체리뷰보기" class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyAllList.action';" />
				</li>
				<li style="float: right; padding-top: 6px; padding-right: 11px">
					<input type="button" value="포토후기 작성하기" class="btnGreen" onclick="javascript:location.href='<%=cp%>/goods/replyinsert.action?G_NUM=${g_dto.getG_NUM()}';" class="btn" height="20px">
				</li>
			</ul>
			<div id="comment" class="container-fluid">
				<input type="hidden" name="BC_ID" value="${sessionScope.userInfo.getM_ID()}">
				<input type="hidden" name="BC_BOARD" value="${g_dto.getG_NUM()}">

				<form id="commentForm" method="post" enctype="multipart/form-data">
					<table border="1" bordercolor="#b3cccc" align="center" width="1000" style="border-radius: 20px;">
						<!-- 로그인 했을 경우만 댓글 작성가능 -->
						<c:if test="${!empty sessionScope.userInfo.getM_ID()}">
							<%-- 	<tr>
									<tr bgcolor="lightgray" height="60px;">
										<!-- 아이디-->
										<td width="15%">
											<div>${sessionScope.userInfo.getM_ID()}</div>
										</td>
										<!-- 본문 작성-->
										<td width="75%">
											<div>
												<textarea id="inputbox" name="BC_CONTENT" rows="2" cols="100" style="padding-left: 10px; font-size: 18px; background-color:transparent;"></textarea>
												<input type="file" id="upload" name="bcFile">
											</div>
										</td>
										<!-- 댓글 등록 버튼 -->
										
									</tr> --%>
						</c:if>


						<!-- 로그인 하지 않았을때만 보이는 화면 -->
						<c:if test="${empty sessionScope.userInfo.getM_ID()}">
							<tr bgcolor="lightgray" height="60px;">
								<!-- 본문 작성-->
								<td width="100%">
									<div>
										<p>
											<input type="button" value="포토후기 작성하기" onclick="javascript:location.href='<%=cp%>/login.action';" class="btn" height="20px">
										</p>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
					<div id="replyList"></div>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
<!-- 댓글에 띄울 리스트 작성 -->
<script>
$(document).ready(function() {
	$.ajax({
		 type:"get",
		 url :"<%=cp%>/goods/replyList.action?G_NUM=${g_dto.getG_NUM()}",
		 success : function(result) {
			 //responseText가 result에 저장됨.
			 $("#replyList").html(result);
		}
	 });
});
</script>

</html>
