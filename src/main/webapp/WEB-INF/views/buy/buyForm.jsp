<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>Insert title here</title>

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

</head>
<body>

<jsp:include page="../include/header.jsp" flush="false" />

<div style="margin: 3%">

	<table border="1" cellpadding="0" cellspacing="0" width="38%">
		<colgroup>
			<col width="15%"/>
			<col width="80%"/>
		</colgroup>
		
		<tr>
			<td colspan="2">주문자 정보</td>
		</tr>
		
		<tr>
			<td>주문하시는 분</td>
			<td>ㅇㅇㅇ</td>
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
						<td>00000</td>
						<td>우편번호</td>
					</tr>
					<tr>
						<td>서울시 ~~~ !!! @@@@</td>
						<td>기본주소</td>
					</tr>
					<tr>
						<td>1234번지 1234호</td>
						<td>나머지주소</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td>휴대전화</td>
			<td>010-1234-5678</td>
		</tr>
		
	</table>
	<br/>
	<table border="1" cellpadding="0" cellspacing="0" width="38%">
		<colgroup>
			<col width="15%"/>
			<col width="80%"/>
		</colgroup>
		
		<tr>
			<td colspan="2">배송지 정보</td>
		</tr>
		
		<tr>
			<td>배송지 선택</td>
			<td>
				<input type="radio" id="test1" name="test" checked="checked"/>
				<label for="test1">주문자 정보와 동일</label> 
				<input type="radio" id="test2" name="test"/>
				<label for="test2">새로운배송지</label> 
			</td>
		</tr>
		
		<tr>
			<td>받으시는 분</td>
			<td><input type="text" class="inputBox"/></td>
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
						<td colspan="2"><input type="text" size="7" id="sample6_postcode" class="inputBox" readonly="readonly"/>
						<input type="button" onclick="sample6_execDaumPostcode()" style="width: 120px;" class="btn2" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td><input type="text" size="50" id="sample6_address" class="inputBox" readonly="readonly" style="text-align: left; padding-left: 10px"/></td>
						<td>기본주소</td>
					</tr>
					<tr>
						<td><input type="text" size="50" id="sample6_address2" class="inputBox" style="text-align: left; padding-left: 10px"/></td>
						<td>나머지주소</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td>휴대전화</td>
			<td>
				<input type="text" class="inputBox" size="6" maxlength="3"/> -
				<input type="text" class="inputBox" size="6" maxlength="4"/> -
				<input type="text" class="inputBox" size="6" maxlength="4"/>  
			</td>
		</tr>
		
	</table>

</div>

<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>