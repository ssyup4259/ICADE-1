<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
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

<form action="cancelMembership_ok.action" method="post" id="cancelMembership" name="cancelMembership" onsubmit="return sendIt">

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
		<!-- <input type="text" readonly="readonly" id="Directinput2" > -->
		<textarea title="textarea" readonly="readonly" id="Directinput" cols="128" rows="7" onkeyup=""></textarea>
	</div>
	<!-- 아무런 선택이 없을시 기본값이 들어가있어야되기에 셀렉트시 기본값을 히든값의 기본을 설정 -->
	<input type="hidden" id="selected" name="selected" value="상품 다양성/가격품질 불만">
	
	<div class="bt_area3">
	<input type="submit" value="회원 탈퇴 신청"> 
	<a href="myPage.action" class=""><span>취소</span></a>
	</div>

</form>



<script type="text/javascript">

	$(function(){
		$("#Directinput").keyup(function(){
			
			var selectedVal = $("#reason option:selected").val();
			var DirectinputVar = $("#Directinput").val();
			
			if(selectedVal=="직접입력"){
				$("#selected").val(DirectinputVar);
			}
			
			//alert($("#selected").val());
			
		});
	});

	$(function(){
		$("#reason").change(function(){
			
			var selectedVal = $("#reason option:selected").val();
			
			if(selectedVal=="직접입력"){
				//$("#Directinput").removeAttr("readonly");
				//$("#Directinput2").removeAttr("readonly");
				$("#Directinput").attr("readonly",false);
				$("#Directinput2").attr("readonly",false);
				$("#selected").val("");
			}else{
				$("#Directinput").attr("readonly",true);
				$("#Directinput2").attr("readonly",true);
				$("#Directinput").val("");
				$("#Directinput2").val("");
				$("#selected").val(selectedVal);
			}
			
			//alert($("#Directinput").val());
			
			//alert($("#selected").val());
		});	
	});
</script>
<script type="text/javascript">

	var doubleSubmitFlag = false;

	function sendIt() {
		
		if(doubleSubmitFlag){
	        alert('처리 중입니다.');
	        return false;
	    }else {
	        doubleSubmitFlag = true;
	        return true;
	    }
	}

</script>
<!-- 
<script type="text/javascript">

	var doubleSubmitFlag = false;
	
	$(function(){
		$("#submit").click(function(){
		
			if(doubleSubmitFlag){
		        alert('제출 중입니다.');
		        return false;
		    }else {
		        doubleSubmitFlag = true;
		        $("#cancelMembership").submit();
		        
		    }
	    });
	});
</script> -->
</body>
</html>