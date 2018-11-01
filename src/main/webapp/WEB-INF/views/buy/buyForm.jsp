<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icadeStyle2.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>

<title>구매 화면</title>

<!-- 우편번호 api -->
<script type="text/javascript">
function sample6_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if (data.userSelectedType === 'R') {
					//법정동명이 있을 경우 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr
							+ ')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('sample6_address').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('sample6_address2').focus();
			}
		}).open();
}
</script>

<!-- 배송지 관련 -->
<script type="text/javascript">

	function deliveryAddr() {
		
		var f = document.myForm;
		
		f.O_NAME.value = f.name.value;
		f.O_ZIPCODE.value = f.zipcode.value;
		f.O_ADDRESS1.value = f.address1.value;
		f.O_ADDRESS2.value = f.address2.value;
		f.O_PH1.value = f.phone1.value;
		f.O_PH2.value = f.phone2.value;
		f.O_PH3.value = f.phone3.value;
		
	}
	
	function newAddr() {
		
		var f = document.myForm;
		
		f.O_NAME.value = "";
		f.O_ZIPCODE.value = "";
		f.O_ADDRESS1.value = "";
		f.O_ADDRESS2.value = "";
		f.O_PH1.value = "";
		f.O_PH2.value = "";
		f.O_PH3.value = "";
		
	}

</script>

<!-- 결제 관련 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">

	function payIt() {
		
		var total = $("#O_TOT").val();
		var name = "${b_lists[0].getName()}";
		var count = ${b_lists.size()};
		
		if (count > 1) {
			name = name + " 외 " + (count-1) + "개";
		}
		var email = "${m_dto.getM_EMAIL_ID()}@${m_dto.getM_EMAIL_DOMAIN()}";
		var tel = "${m_dto.getM_CELLPHONE1()}-${m_dto.getM_CELLPHONE2()}-${m_dto.getM_CELLPHONE3()}";
		var addr = "${m_dto.getM_ADDRESS1()} ${m_dto.getM_ADDRESS2()}";
		var zipcode = "${m_dto.getM_ZIPCODE()}";
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp79506821');  // 가맹점 식별 코드
	
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : name,
			amount : 10,
			buyer_email : email,
			buyer_name : name,
			buyer_tel : tel,
			buyer_addr : addr,
			buyer_postcode : zipcode
			
		}, function(rsp) {
			
			if ( rsp.success ) {
				
				var allData = $("#myForm").serialize();
				
				allData = allData + "&imp_uid=" + rsp.imp_uid;
				
				$.ajax({
					
		    		url: "<%=cp%>/buy/payIt.action",
		    		type: 'POST',
		    		dataType: 'text',
		    		data: allData,
		    		success: function(data) {
		    			
		    			location.href = "<%=cp%>/buy/buyOK.action";
		    			
		    		},
		    		
		    		error : function(data) {
		    			
		    			alert("Ajax Error");
		    			console.log(data);
		    			
		    		}
		    		
		    	});
				
		    } else {
		    	
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		        alert(msg);
		        
		    }
		});
	}

</script>

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<form action="" method="post" id="myForm" name="myForm">
	<div class="container-fluid text-center" style="width: 80%; margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<div class="col-sm-7">
				<table border="1" cellpadding="0" cellspacing="0" width="100%">
					<colgroup>
						<col width="15%"/>
						<col width="80%"/>
					</colgroup>
					
					<tr>
						<td colspan="2">주문자 정보</td>
					</tr>
					
					<tr>
						<td>주문하시는 분</td>
						<td align="left">
							${m_dto.getM_NAME()}
							<input type="hidden" name="name" value="${m_dto.getM_NAME()}"/>
						</td>
					</tr>
					
					<tr>
						<td>주소</td>
						<td>
							<table border="1" cellpadding="0" cellspacing="0" width="100%">
							
								<colgroup>
									<col width="82%"/>
									<col width="18%"/>
								</colgroup>
							
								<tr>
									<td align="left">
										${m_dto.getM_ZIPCODE()}
										<input type="hidden" name="zipcode" value="${m_dto.getM_ZIPCODE()}"/>
									</td>
									<td>우편번호</td>
								</tr>
								<tr>
									<td align="left">
										${m_dto.getM_ADDRESS1()}
										<input type="hidden" name="address1" value="${m_dto.getM_ADDRESS1()}"/>
									</td>
									<td>기본주소</td>
								</tr>
								<tr>
									<td align="left">
										${m_dto.getM_ADDRESS2()}
										<input type="hidden" name="address2" value="${m_dto.getM_ADDRESS2()}"/>
									</td>
									<td>나머지주소</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td>휴대전화</td>
						<td align="left">
							${m_dto.getM_CELLPHONE1()}-${m_dto.getM_CELLPHONE2()}-${m_dto.getM_CELLPHONE3()}
							<input type="hidden" name="phone1" value="${m_dto.getM_CELLPHONE1()}"/>
							<input type="hidden" name="phone2" value="${m_dto.getM_CELLPHONE2()}"/>
							<input type="hidden" name="phone3" value="${m_dto.getM_CELLPHONE3()}"/>
						</td>
					</tr>
					
				</table>
				<br/>
				<table border="1" cellpadding="0" cellspacing="0" width="100%">
					<colgroup>
						<col width="15%"/>
						<col width="80%"/>
					</colgroup>
					
					<tr>
						<td colspan="2">배송지 정보</td>
					</tr>
					
					<tr>
						<td>배송지 선택</td>
						<td align="left">
							<input type="radio" id="test1" name="test" checked="checked" onclick="deliveryAddr();"/>
							<label for="test1">주문자 정보와 동일</label> 
							<input type="radio" id="test2" name="test" onclick="newAddr();"/>
							<label for="test2">새로운배송지</label> 
						</td>
					</tr>
					
					<tr>
						<td>받으시는 분</td>
						<td align="left"><input type="text" class="inputBox" id="O_NAME" name="O_NAME" value="${m_dto.getM_NAME()}"/></td>
					</tr>
					
					<tr>
						<td>주소</td>
						<td>
							<table border="1" cellpadding="0" cellspacing="0" width="100%">
								
								<colgroup>
									<col width="70%"/>
									<col width="30%"/>
								</colgroup>
								
								<tr>
									<td colspan="2" align="left">
									<input type="text" size="7" id="sample6_postcode" name="O_ZIPCODE" class="inputBox" readonly="readonly" value="${m_dto.getM_ZIPCODE()}"/>
									<input type="button" onclick="sample6_execDaumPostcode()" style="width: 120px;" class="btn2" value="우편번호 찾기">
									</td>
								</tr>
								<tr>
									<td align="left">
									<input type="text" size="50" id="sample6_address" name="O_ADDRESS1" class="inputBox" readonly="readonly" style="text-align: left; padding-left: 10px" value="${m_dto.getM_ADDRESS1()}"/>
									</td>
									<td>기본주소</td>
								</tr>
								<tr>
									<td align="left">
									<input type="text" size="50" id="sample6_address2" name="O_ADDRESS2" class="inputBox" style="text-align: left; padding-left: 10px" value="${m_dto.getM_ADDRESS2()}"/>
									</td>
									<td>나머지주소</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td>휴대전화</td>
						<td align="left">
							<input type="text" name="O_PH1" class="inputBox" size="6" maxlength="3" value="${m_dto.getM_CELLPHONE1()}"/> -
							<input type="text" name="O_PH2" class="inputBox" size="6" maxlength="4" value="${m_dto.getM_CELLPHONE2()}"/> -
							<input type="text" name="O_PH3" class="inputBox" size="6" maxlength="4" value="${m_dto.getM_CELLPHONE3()}"/>  
						</td>
					</tr>
					
				</table>
			</div>
		
			<div class="col-sm-5">
			
				<table border="1" cellpadding="0" cellspacing="0" width="100%">
					<colgroup>
						<col width="15%"/>
						<col width="70%"/>
						<col width="15%"/>
					</colgroup>
					
					<tr>
						<td colspan="3">주문 상품</td>
					</tr>
					
					<tr>
						<td>이미지</td>
						<td>상품정보</td>
						<td>합계</td>
					</tr>
					
					<c:set var="total" value="0"/>
					<c:set var="discount" value="0"/>
					<c:forEach var="b_dto" items="${b_lists}">
						<tr>
							<td><img src="<%=cp%>/resources/goodsImage/${b_dto.getSaveFileName()}" width="80px" height="80px"/></td>
							<td align="left">
								${b_dto.getName()}<br/>
								<input type="hidden" name="code" value="${b_dto.getCode()}"/>
								<input type="hidden" name="count" value="${b_dto.getCount()}"/>
								[옵션: ${b_dto.getKind()} / ${b_dto.getColor()}]<br/>
								<fmt:formatNumber>${b_dto.getPrice()}</fmt:formatNumber>원 / ${b_dto.getCount()}개
							</td>
							<td><fmt:formatNumber>${b_dto.getPrice() * b_dto.getCount()}</fmt:formatNumber>원</td>
						</tr>
						<c:set var="discount" value="${discount + (b_dto.getPrice() * (b_dto.getDiscount() / 100) * b_dto.getCount())}"/>
						<c:set var="total" value="${total + b_dto.getPrice() * b_dto.getCount()}"/>
					</c:forEach>
				</table>
				<br/>
				<table border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>총 주문 금액</td>
						<td><fmt:formatNumber>${total}</fmt:formatNumber>원</td>
					</tr>
					<tr>
						<td>총 할인 금액</td>
						<td><fmt:formatNumber>${discount}</fmt:formatNumber>원</td>
					</tr>
					<tr>
						<td>포인트</td>
						<td>
							<input type="text" class="btn2" style="text-align: right;" size="6" value="0"/>원
							 (총 사용가능 적립금 : <span id="point"><fmt:formatNumber>${m_dto.getM_POINT()}</fmt:formatNumber></span>원)
						</td>
					</tr>
					<tr>
						<td>최종 결제 금액</td>
						<td>
							<fmt:formatNumber>${total - discount}</fmt:formatNumber>원
							<input type="hidden" id="O_TOT" name="O_TOT" value="${total - discount}"/>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="button" class="btn2" value="결제하기" onclick="payIt();"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>