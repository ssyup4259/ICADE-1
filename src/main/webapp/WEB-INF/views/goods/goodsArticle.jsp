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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle.css">
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

.navbar {
	margin-bottom: 0p x;
}

.affix ~ .container-fluid {
	position: relative;
	top: 50px;
}

#section1 {
	padding-top: 50px;
	height: 500px;
	width: 33% color: #000000;
}

#section2 {
	padding-top: 50px;
	height: 500px;
	color: #000000;
}

#section3 {
	padding-top: 50px;
	height: 500px;
	color: #000000;
}
</style>

<style type="text/css">
a {
	text-decoration: none;
	color: #000;
}

.menu_ul {
	border: 1px solid #ddd;
	border-left: none;
	background: #fff;
	overflow: hidden;
}

.menu_ul li {
	float: left;
	width: 33.3%;
	border-left: 1px solid #ddd;
	text-align: center;
	box-sizing: border-box;
}

.menu_ul li {
	display: inline-block;
	padding: 20px;
	cursor: pointer;
}

.menu_ul li.on {
	background-color: #eee;
	color: #f00;
}

table {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

th, td {
	padding: 8px;
}
</style>

<style type="text/css">
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

table {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

th, td {
	padding: 8px;
}
</style>

<!-- 탭 메뉴 적용 -->
<script type="text/javascript">
		$(function () {	
			tab('#tab',0);	
		});
		
		function tab(e, num){
		    var num = num || 0;
		    var menu = $(e).children();
		    var con = $(e+'_con').children();
		    var select = $(menu).eq(num);
		    var i = num;
		
		    select.addClass('on');
		    con.eq(num).show();
		
		    menu.click(function(){
		        if(select!==null){
		            select.removeClass("on");
		            con.eq(i).hide();
		        }
		
		        select = $(this);	
		        i = $(this).index();
		
		        select.addClass('on');
		        con.eq(i).show();
		    });
		}

</script>


<!-- 콤보박스 연결 -->
<script type="text/javascript">
$(function() {

	var select = "<option>:: 선택 ::</option>"; 
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
		
		var allData = $("#myForm").serialize();
		
		$.ajax({
			
			type:"post",
			url:"<%=cp%>
	/cart/insertCheck.action",
			datatype : 'json',
			data : allData,
			success : function(data) {

				if (data == "success") {
					insertCart();
				} else if (data == "reduplication") {
					alert("이미 장바구니에 존재하는 상품입니다.");
				} else if (data == "lack") {
					alert("담고자하는 수량이 재고 수량보다 많습니다.");
				}

				console.log(data);

			},

			error : function(data) {

				console.log(data);

			}
		});
	}
</script>

</head>

<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid text-center" style="background-color: #F2F1F0; padding-top: 50px; padding-bottom: 50px;">
		<div class="container">
			<form id="myForm" name="myForm" method="post" action="">
				<table width="100%" align="center" style="border: none;">
					<tr>
						<td colspan="2" align="center">
							<h1>${g_dto.getG_NAME()}</h1>
						</td>
					</tr>
					<tr>
						<td width="350px;" height="500px;"><img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" style="border-radius: 15px; height: 90%; width: 90%;"></td>


						<td>
							<table width="100%" height="300" style="border: none;">
								<tr align="center">
									<td>상품명</td>
									<td align="left">${g_dto.getG_NAME()}<input type="hidden" name="G_NAME" value="${g_dto.getG_NAME()}" />
									</td>
								</tr>
								<tr align="center">
									<td>소비자가</td>
									<td align="left"><fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>원</td>
								</tr>

								<tr align="center" onclick="discount();">
									<td>판매가</td>
									<td align="left"><fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>원 <input type="hidden" name="G_PRICE" value="${g_dto.getG_PRICE()}" /></td>
								</tr>
								<tr align="center">
									<td>적립금</td>
									<td align="left"><img src="<%=cp%>/resources/images/credit/icon_201612281355512700.jpg" /> <fmt:formatNumber>${g_dto.getG_PRICE()*0.1}</fmt:formatNumber>원</td>
								</tr>


								<!--  기종 선택 -->
								<tr align="center">
									<td>기종</td>
									<td align="left"><c:if test="${!empty gd_list}">
											<input type="hidden" name="GD_KIND_NUM" value="${gd_list[0].getGD_KIND_NUM()}" />
											<select name="GD_DEVICE" id="product" class="sel" style="width: 40%;">
												<option value="">::기종을 선택하세요::</option>
												<c:forEach var="gd_dto" items="${d_list}">
													<option value="${gd_dto.getGD_DEVICE()}">${gd_dto.getDK_NAME()}</option>
												</c:forEach>
											</select>
										</c:if></td>
								</tr>

								<!--  색상 선택 -->
								<tr align="center">
									<td>색상</td>
									<td align="left"><select name="GD_COLOR" id="sub" class="sel" style="width: 40%;">
											<option>:: 색상을 선택해주세요 ::</option>
										</select></td>
								</tr>

								<tr align="center">
									<td>수량</td>
									<td align="left"><input type="text" class="inputBox" id="GD_COUNT" value="1" name="GD_COUNT" size="2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onchange="change();" /> <input type="button" id="up" class="up" onclick="countUp();" /> <input type="button" id="down" class="down" onclick="countDown();" />개</td>
								</tr>

								<tr align="center">
									<td>총 상품금액</td>
									<td align="left"><input type="text" id="sum" class="inputBox" name="sum" value="" readonly="readonly" /></td>
								</tr>

								<tr>
									<td colspan="2" height="1" bgcolor="black"></td>
								</tr>

								<tr align="center">
									<td align=""><c:choose>
											<c:when test="">
												<a href='javascript:like_func();'>
													<img src="<%=cp%>/resources/images/dislike.png" id="heart.png">
												</a>
											</c:when>
											<c:otherwise>
												<a href='javascript: login_need();'>
													<img src="<%=cp%>/resources/images/dislike.png" style="width: 30px">
												</a>
											</c:otherwise>
										</c:choose> <a href="댓글목록">
											<img src="<%=cp%>/resources/images/speech-bubble.png" style="width: 30px">
										</a></td>
									<td align="left" colspan="2"><input type="hidden" name="G_NUM" value="${g_dto.getG_NUM()}"> <input type="button" value="구매하기" onclick="orderIt();" class="btn" /> <input type="button" value="장바구니에 담기" onclick="insertCheck();" class="btn" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr height="1">
						<td colspan="2" height="1" bgcolor="black"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><c:if test="${!empty pageNum}">
								<br>
								<div id="btn">
									<a href="<%=cp%>/list.action?pageNum=${pageNum}&G_NUM=${g_dto.getG_NUM()}">
										<h2>상품목록으로 돌아가기</h2>
									</a>
								</div>
								<br>
							</c:if> <!-- 최근본 상품목록에서 클릭했을 경우 --> <c:if test="${empty pageNum}">
								<br>
								<div id="btn">
									<%-- <a href="<%=cp%>/list.action?pageNum=${pageNum}&G_NUM=${g_dto.getG_NUM()}">
										<h2>상품목록으로 돌아가기</h2></a> --%>
								</div>
								<br>
							</c:if></td>
					</tr>
				</table>

				<!-- divison 이동 -->
				<div class="conatiner-fluid sticky text-center" id="menu" style="z-index: 999; background-color: transparent; padding-top: 8px;" >
					<a href="#section1">
						<input type="button" class="btn" value="상품상세정보" style="width: 200px;">
					</a>
					&nbsp;&nbsp;&nbsp;
					<a href="#section2">
						<input type="button" class="btn" value="상품구매안내" style="width: 200px;">
					</a>
					&nbsp;&nbsp;&nbsp;
					<a href="#section3">
						<input type="button" class="btn" value="상품사용후기" style="width: 200px;">
					</a>
				</div>

				<div id="section1" class="container-fluid" style="margin: auto">
					<h1>상품상세정보</h1>
					<p></p>
				</div>

				<!-- 상품구매안내 -->
				<div id="section2" class="container-fluid">
					<h1>상품구매안내</h1>

					<div id="prdInfo" class="ec-base-tab grid5">
						<div class="cont">
							<h3>상품결제정보</h3>

							<div>무통장 입금은 인터넷뱅킹, 텔레뱅킹, 스마트폰뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;</div>
							<div>주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 3일 이내 로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.</div>
						</div>

						<div class="cont">
							<h3>배송정보</h3>

							<ul class="delivery">
								<li>배송 방법 : 택배</li>
								<li>배송 지역 : 전국지역</li>
								<li>배송 비용 : 3,000원</li>
								<li>배송 기간 : 1일 ~ 3일</li>
								<br>
								<li>
									배송 안내 :
									<div>
										<span style="font-size: 9pt;">고객님께서 주문하신 상품은 입금 확인 후, 제작하여 발송처리합니다.</span>
									</div>
									<div>배송기간은 1일~3일입니다. 우체국택배를 이용하여 일요일,공휴일은 쉽니다.</div>
								</li>
							</ul>
						</div>

						<div class="cont">
							<h3>교환 및 반품정보</h3>
							<div>
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

						<div class="cont">
							<h3>서비스문의</h3>
							서비스 문의 안내는 고객센터 문의쪽에 남겨주시거나 카카오톡,페이스북 페이지로 글남겨주시면 바로답변드리겠습니다!!
						</div>
					</div>
				</div>

				<!-- divison 이동 -->
				<div>
					<div>
						<b><br></b>
					</div>
					<div>
						<b><br></b>
					</div>
					<div>
						<b><br></b>
					</div>
					<div>
						<b><br></b>
					</div>
					<div>
						<b><br></b>
					</div>
					<div>
						<b><br></b>
					</div>
					<div>
						<b><br></b>
					</div>
				</div>
				<div id="section3" class="container-fluid">
					<h1>REVIEW | 포토리뷰 작성하고 적립금 받자!</h1>
					<p></p>
					<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>

</html>