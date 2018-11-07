<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String cp = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- daum api -->
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막는다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
<style type="text/css">
* { margin:0; padding:0; }
ul,li { list-style:none; }
a { text-decoration:none; color:#000; }
.tab { border:1px solid #8F9493; border-left:none; background:white; overflow:hidden; }
.tab li { float:left; width:25%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
.tab li { display:inline-block; padding:20px; cursor:pointer; }
.tab li.on { background-color:#eee; color:#f00; }
.tab_con { clear:both; margin-top:5px; border:1px solid #ddd; }
.tab_con div { display:none; height:100px; background:#fff; line-height:100px; text-align:center; }

</style>


</head>

<script>
$(document).ready(function () {
	
	for (var i = 0; i < 11; i++) {
		$('#answer'+ i).hide();
	}
 });

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
	
	
		
		
	<!-- SHOW.HIDE -->

	function faqMove(num) {
		
	var num = num;
	var other;	
	
	if (num.length != 0) {
		$('#answer'+num).show("fast");
		for (var i = 0; i < 11; i++) {
			 if (num != i) {
			$('#answer'+ i).hide("slow");
			}	
		}
	}else{
		alert("에러발생");
	}
	}
		


</script>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container">
	  <div  class="container-fluid">
		<div align="left" style="font-size: 6px">
			FAQ:자주묻는질문 답변
		</div>

		<div>
			<ul class="tab" id="tab">
				<li>주문/결제</li>
				<li>배송</li>
				<li>교환/환불</li>
				<li>적립금/혜택</li>
			</ul>
		</div>
	
		<!-- SHOW.HIDE -->
		  <!-- division1 -->
		<div class="tab_con" id="tab_con">
		    <div style="float: left; font-size: 14px">
		    <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer1" onclick="faqMove(1);"><font style="font-size: 13">1.주문방법</font></a>
			      	<ul id="answer1">
			             <li class="">
			             상품검색 → 장바구니에 담기 → 회원ID 로그인 또는 비회원 주문 → 주문서 작성 → 결제방법선택 및 결제 → 주문 성공 화면 (주문번호)
			             <br/>
						 ※비회원 주문인경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 단, 회원인 경우 자동 저장
						 되므로 따로 관리하실 필요가 없습니다.※
			             </li>   
			        </ul>
			      </li>
		     </ul>
		     <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer2" onclick="faqMove(2);">2. 결제안내</a>
			      	<ul id="answer2">
			             <li class="" style="text-align: left;">
			             상품검색 → 장바구니에 담기 → 회원ID 로그인 또는 비회원 주문 → 주문서 작성 → 결제방법선택 및 결제 → 주문 성공 화면 (주문번호)
			             <br/>
						 ※비회원 주문인경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 단, 회원인 경우 자동 저장
						 되므로 따로 관리하실 필요가 없습니다.※
			             </li>   
			        </ul>
			      </li>
		     </ul>
		     <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer3" onclick="faqMove(3);">3. 주문조회</a>
			      	<ul id="answer3">
			            <li class="" style="text-align: left;">
			             상품검색 → 장바구니에 담기 → 회원ID 로그인 또는 비회원 주문 → 주문서 작성 → 결제방법선택 및 결제 → 주문 성공 화면 (주문번호)
			             <br/>
						 ※비회원 주문인경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 단, 회원인 경우 자동 저장
						 되므로 따로 관리하실 필요가 없습니다.※
			             </li>   
			        </ul>
			      </li>
		     </ul>
		     <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer4" onclick="faqMove(4);">4. 주문 후 옵션변경</a>
			      	<ul id="answer4">
			              <li class="" style="text-align: left;">
			             상품검색 → 장바구니에 담기 → 회원ID 로그인 또는 비회원 주문 → 주문서 작성 → 결제방법선택 및 결제 → 주문 성공 화면 (주문번호)
			             <br/>
						 ※비회원 주문인경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 단, 회원인 경우 자동 저장
						 되므로 따로 관리하실 필요가 없습니다.※
			             </li>   
			        </ul>
			      </li>
		     </ul>
		     </div>	
		     <!-- division2 -->
		   <div style="float: left; font-size: 14px">
		    <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer5" onclick="faqMove(5);"><font style="font-size: 13">배송</font></a>
			      	<ul id="answer5">
			             <li class="">
			            배송안내
						배송안내 월요일 오전10시 , 화요일~금요일 오후2시 이전 결제완료 주문건은 당일발송이진행되며,발송후 1일-2일정도의 배송기간이 소요됩니다. 우체국택배를 이용하여,일요일,공휴일은 쉽니다. ※상품의 재고상황에따라 당일발송이 불가능할수있습니다.※ 2.주문상품 배송안내 주문제작상품의 제작기간은 주문후 익일로부터 주말,공휴일 제외 1일~3일 정도 소요되며, 제작상황에따라 제작기간이 변동될수있습니다. 제작기간동안 배송상태는 [배송보류]로 표시되며, 제작후 발송기간은 1일-2일정도 소요됩니다.
			             </li>   
			        </ul>
			      </li>
		     </ul>
		    </div>
		    <!-- division3 -->
		   <div style="float: left; font-size: 14px">
		    <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer6" onclick="faqMove(6);"><font style="font-size: 13">1.교환/환불</font></a>
			      	<ul id="answer6">
			             <li class="">
						 1.교환/환불 안내<br>
						단순변심,기종/옵션변경 등 교환/환불을 원하실 경우 고객님께서 받아보신 상품의<br>
						구성품과 포장상태가 온전한 상태로 배송완료후 10일 이내 아이몰에 도착을 해야 교환/ 환불이 가능하십니다.
			             </li>   
			        </ul>
			      </li>
		     </ul>
		      <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer7" onclick="faqMove(7);"><font style="font-size: 13">2.불량 교환/환불안내</font></a>
			      	<ul id="answer7">
			             <li class="">
			             아이몰의 판매제품은 소모품으로 수령즉시 확인된 불량 상품에대해서만 교환/환불 처리가 가능하십니다.
						 사용중 발생된 손상은 교환/환불 또는 A/S가 불가능한점 양해부탁드립니다.<br>
	
						 불량상품 또는 오배송 확인시 해당제품은 약식서를 작성후 상품과 함께포장하여 우체국택배를통해 착불접수후
						 아이몰반품주소로 보내주시면 제품확인후 교환 또는 환불 처리를 도와드리도록하겠습니다.
						 보내주실때 꼭 약식서를 필수로 작성부탁드립니다!
						 우체국 반품택배접수 ☎ 1588-1300
			             </li>   
			        </ul>
			      </li>
		     </ul>
		      <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer8" onclick="faqMove(8);"><font style="font-size: 13">3.교환/환불 처리 일정 </font></a>
			      	<ul id="answer8">
			             <li class="">
			             교환_제품을 아이몰에서 수령후 , 1일-2일후 교환상품이 출고가 진행됩니다.<br>
						 환불_제품을 아이몰에서 수령후 ,1일-2일후 환불처리가 진행됩니다.<br>
					     환불금액은 결제상태에 따라 3일-7일정도 후 환급처리가 될수있으며,<br>
						 자사몰을 통해 무통장입금 주문건의 경우<br>
					     환불처리 당일 오후6시 환불요청 계좌로 환급처리가 됩니다.<br>
			             </li>   
			        </ul>
			      </li>
		     </ul>
		    </div>
		    <!-- division4 -->
		     <div style="float: left; font-size: 14px">
		    <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer9" onclick="faqMove(9);"><font style="font-size: 13"> 1. 적립금</font></a>
			      	<ul id="answer9">
			             <li class="">
	 				출석체크 , 더 러너(모바일게임) , 결제금액 , 이벤트, 포토리뷰작성 등을 통해 적립이 가능하며, 5000원이상 적립금부터 사용 가능합니다.
			             </li>   
			        </ul>
			      </li>
		     </ul>
		      <ul>
			    <li class="dropbtn" style="text-align: left">
			        <a href="#answer10" onclick="faqMove(10);"><font style="font-size: 13">2. 회원혜택</font></a>
			      	<ul id="answer10">
			             <li class="dropdown" style="font-size: 13">
			 				[silver] 첫 회원가입시 적용, 구매금액의 10%가 적립금으로 적립이 됩니다.<br>
							[gold] 실결제금액 5만원이상 누적시,평생무료배송+15%구매금액 적립금+2%모든제품할인 으로 업그레이드 됩니다.<br>
							[platinum] 실결제금액 30만원이상 누적시,평생무료배송+15%구매금액 적립금+5%모든제품할인 으로 업그레이드 됩니다.<br>
							[diamond] 실결제금액 50만원이상 누적시,평생무료배송+18%구매금액 적립금+10%모든제품할인 으로 업그레이드 됩니다.<br>
			             </li>   
			        </ul>
			      </li>
		     </ul>
		    </div>
		</div>
	</div>
</div>
<%--  <jsp:include page="../include/footer.jsp" flush="false" />  --%>

</body>
</html>