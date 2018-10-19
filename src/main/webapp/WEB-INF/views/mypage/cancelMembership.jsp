<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<body>
<form action="cancelMembership_ok.action" method="post">

<div class="mytmall_title">
	<h3 class="t_dropOut1"><span>Icade 서비스 이용 중 불편사항을 선택해주세요.</span></h3>
		<select id="reason">
			<option value="상품 다양성/가격품질 불만">상품 다양성/가격품질 불만</option>
			<option value="교환/환불/품질불만">교환/환불/품질불만</option>
			<option value="배송지연">배송지연</option>
			<option value="이용빈도 낮음">이용빈도 낮음</option>
			<option value="개인정보유출">개인정보유출</option>
			<option value="회원특혜/쇼핑혜택 부족">회원특혜/쇼핑혜택 부족</option>
			<option value="A/S 불만">A/S 불만</option>
			<option value="쇼핑몰 속도 불만">쇼핑몰 속도 불만</option>
			<option value="직접입력">직접입력</option>
		</select>
</div>
	
	<div class="mytmall_title">
		<h3 class="t_dropOut2"><span>그 이외에 Icade에게 남기고 싶으신 의견이 있으시면 기재해주세요.</span></h3>
	</div>
	<div class="dropOut_textarea">
		<input type="text" readonly="readonly" id="Directinput" >
		<textarea title="textarea" readonly="readonly"  cols="128" rows="7" onkeyup=""></textarea>
	</div>
	
	<input type="hidden" id="selected" value="">
	
	<div class="bt_area3">
	<input type="submit" value="회원 탈퇴 신청"> 
	<a href="javascript: history.back();" class="bt_cancel" onclick="rakeLog.sendRakeLog(this);" data-log-actionid-area="cancel" data-log-actionid-label="btn" data-is-ab-send="1"><span>취소</span></a></div>

</form>

<script type="text/javascript">



$(function(){
	$("#reason").change(function(){
		
		var selectedVal = $("#reason option:selected").val();
		
		if(selectedVal=="직접입력"){
			$("#Directinput").removeAttr("readonly"); 
		}
		$("#selected").val(selectedVal);
		
		alert($("#selected").val());
	});	
});
</script>
</body>
</html>