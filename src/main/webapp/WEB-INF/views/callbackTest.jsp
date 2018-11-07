<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<div class="ec-solution-layer" id="mCafe24SnsAgree" style="display: block; position: absolute; top: 0px;">
	<div class="header">
		<h3>회원가입</h3>
	</div>
<div class="content">
	<div class="ec-solution-box">
		<p class="desc">이용약관, 개인정보 수집 및 이용에 동의하신 후<br>
			<strong class="snsName" id="sns_name">NAVER</strong> 계정을 사용하여 회원가입이 가능합니다.
		</p>
	</div>
<div class="agreeArea">
<h4>회원정보</h4>
<div class="ec-solution-table typeWrite">
<form id="joinForm" name="joinForm" action="" method="post" enctype="multipart/form-data" target="ifrm_temp">
	<input id="useSimpleSignin" name="useSimpleSignin" value="F" type="hidden">
	<input id="member_name_cert_flag" name="member_name_cert_flag" value="F" type="hidden">
	<input id="is_name_auth_use" name="is_name_auth_use" value="F" type="hidden">
	<input id="is_ipin_auth_use" name="is_ipin_auth_use" value="F" type="hidden">
	<input id="is_mobile_auth_use" name="is_mobile_auth_use" value="F" type="hidden">
	<input id="is_email_auth_use" name="is_email_auth_use" value="F" type="hidden">
	<input id="default_auth_reg_page_flag" name="default_auth_reg_page_flag" value="E" type="hidden">
	<input id="realNameEncrypt" name="realNameEncrypt" value="" type="hidden">
	<input id="add1_name" name="add1_name" value="" type="hidden">
	<input id="add2_name" name="add2_name" value="" type="hidden">
	<input id="add3_name" name="add3_name" value="" type="hidden">
	<input id="add4_name" name="add4_name" value="" type="hidden">
	<input id="is_display_register_business" name="is_display_register_business" value="F" type="hidden">
	<input id="is_display_register_foreign" name="is_display_register_foreign" value="F" type="hidden">
	<input id="idDuplCheck" name="idDuplCheck" value="T" type="hidden">
	<input id="useCheckEmailDuplication" name="useCheckEmailDuplication" value="F" type="hidden">
	<input id="emailDuplCheck" name="emailDuplCheck" value="T" type="hidden">
	<input id="login_id_type" name="login_id_type" value="id" type="hidden">
	<input id="display_agree_information_check_flag" name="display_agree_information_check_flag" value="F" type="hidden">
	<input id="display_agree_consignment_check_flag" name="display_agree_consignment_check_flag" value="F" type="hidden">
	<input id="display_required_job" name="display_required_job" value="F" type="hidden">
	<input id="display_required_reco_id" name="display_required_reco_id" value="F" type="hidden">
	<input id="display_required_school" name="display_required_school" value="F" type="hidden">
	<input id="display_required_earning" name="display_required_earning" value="F" type="hidden">
	<input id="display_required_interest" name="display_required_interest" value="F" type="hidden">
	<input id="display_required_region" name="display_required_region" value="F" type="hidden">
	<input id="display_required_job_class" name="display_required_job_class" value="F" type="hidden">
	<input id="display_required_child" name="display_required_child" value="F" type="hidden">
	<input id="display_required_car" name="display_required_car" value="F" type="hidden">
	<input id="display_required_sex" name="display_required_sex" value="F" type="hidden">
	<input id="display_required_internet" name="display_required_internet" value="F" type="hidden">
	<input id="required_is_sms_flag" name="required_is_sms_flag" value="F" type="hidden">
	<input id="required_is_news_mail_flag" name="required_is_news_mail_flag" value="F" type="hidden">
	<input id="is_display_register_wedding" name="is_display_register_wedding" value="F" type="hidden">
	<input id="display_required_is_wedding_anniversary" name="display_required_is_wedding_anniversary" value="F" type="hidden">
	<input id="is_display_register_life_partner" name="is_display_register_life_partner" value="F" type="hidden">
	<input id="display_required_is_life_partner" name="display_required_is_life_partner" value="F" type="hidden">
	<input id="is_display_register_birthday" name="is_display_register_birthday" value="F" type="hidden">
	<input id="display_required_is_birthday" name="display_required_is_birthday" value="F" type="hidden">
	<input id="nick_name_flag" name="nick_name_flag" value="F" type="hidden">
	<input id="nick_name_confirm" name="nick_name_confirm" value="F" type="hidden">
	<input id="display_required_nick_name_flag" name="display_required_nick_name_flag" value="F" type="hidden">
	<input id="display_required_add1" name="display_required_add1" value="F" type="hidden">
	<input id="display_required_add2" name="display_required_add2" value="F" type="hidden">
	<input id="display_required_add3" name="display_required_add3" value="F" type="hidden">
	<input id="display_required_add4" name="display_required_add4" value="F" type="hidden">
	<input id="passwd_type" name="passwd_type" value="A" type="hidden">
	<input id="is_display_register_phone" name="is_display_register_phone" value="" type="hidden">
	<input id="display_required_phone" name="display_required_phone" value="F" type="hidden">
	<input id="display_register_phone" name="display_register_phone" value="" type="hidden">
	<input id="is_display_register_name" name="is_display_register_name" value="T" type="hidden">
	<input id="display_required_name" name="display_required_name" value="T" type="hidden">
	<input id="is_display_register_eng_name" name="is_display_register_eng_name" value="F" type="hidden">
	<input id="display_required_name_en" name="display_required_name_en" value="F" type="hidden">
	<input id="is_display_bank" name="is_display_bank" value="F" type="hidden">
	<input id="display_required_bank_account_no" name="display_required_bank_account_no" value="F" type="hidden">
	<input id="is_display_register_addr" name="is_display_register_addr" value="" type="hidden">
	<input id="__addr1" name="__addr1" value="" type="hidden">
	<input id="__city_name" name="__city_name" value="" type="hidden">
	<input id="__state_name" name="__state_name" value="" type="hidden">
	<input id="display_required_address" name="display_required_address" value="F" type="hidden">
	<input id="display_required_address2" name="display_required_address2" value="F" type="hidden">
	<input id="is_display_register_name_phonetic" name="is_display_register_name_phonetic" value="F" type="hidden">
	<input id="display_required_name_phonetic" name="display_required_name_phonetic" value="F" type="hidden">
	<input id="is_display_register_mobile" name="is_display_register_mobile" value="T" type="hidden">
	<input id="display_required_cell" name="display_required_cell" value="T" type="hidden">
	<input id="display_register_mobile" name="display_register_mobile" value="T" type="hidden">
	<input id="is_display_password_hint" name="is_display_password_hint" value="F" type="hidden">
	<input id="returnUrl" name="returnUrl" value="/" type="hidden">
	<input id="sUseCountryNumberFlag" name="sUseCountryNumberFlag" value="F" type="hidden">
	<input id="sUseSeparationNameFlag" name="sUseSeparationNameFlag" value="F" type="hidden">
	<input id="is_use_checking_join_info" name="is_use_checking_join_info" value="F" type="hidden">
<div class="xans-element- xans-member xans-member-join ">

<table summary="" border="1" class="" id="sns_join">
<caption>회원정보</caption>
	<colgroup>
		<col style="width:110px;">
		<col style="width:auto;">
	</colgroup>

	<tbody>
		<tr class="">
			<th scope="row">
			<span>이름</span>
			<img style="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
				<input id="name" name="name" fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" value="" type="text"> 
				<span id="snsNameContents"></span>
			</td>
		</tr>
		<tr class="">
			<th scope="row">
			<span>휴대전화</span>
			<img style="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
		</th>
			<td>
				<select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				-
				<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">
				-
				<input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">
			</td>
		</tr>
		<tr class="">
			<th scope="row">
			<span>이메일</span>
			<img style="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
		    	<input id="email1" name="email1" fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg="" class="mailId" value="" type="text">
		    	@
		    	<input id="email2" name="email2" fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg="" class="mailAddress" readonly="readonly" value="" type="text">
		    	<select id="email3" fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg="">
					<option value="" selected="selected">- 이메일 선택 -</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="yahoo.com">yahoo.com</option>
					<option value="empas.com">empas.com</option>
					<option value="korea.com">korea.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="etc">직접입력</option>
				</select>
			</td>
		</tr>
			<tr class="">
			<th scope="row">
			<span>일반전화</span>
			<img style="display:none" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
		</th>
			<td>
			    <select id="phone1" name="phone[]" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
					<option value="0502">0502</option>
					<option value="0503">0503</option>
					<option value="0504">0504</option>
					<option value="0505">0505</option>
					<option value="0506">0506</option>
					<option value="0507">0507</option>
					<option value="070">070</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				-
				<input id="phone2" name="phone[]" maxlength="4" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text">
				-
				<input id="phone3" name="phone[]" maxlength="4" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text">
			</td>
		</tr>
	</tbody>
</table>
</div>
</form>
</div>

<form id="form_agreement">    
	<input type="hidden" id="sOauth2EncData" name="sOauth2EncData" value="">
		<div class="ec-solution-box typeMember gMessage">
        	<strong class="message">
        		<input type="checkbox" id="terms_allagree" class="allCheck">
        		<label for="terms_allagree">이용약관,개인정보 수집 및 이용동의, 개인정보 제3자 제공동의(선택), 개인정보 처리 위탁 동의(선택)에 모두 동의합니다.</label>
        	</strong>
			<div class="information">
	        	<ul class="checkList">
	            	<li>
	                	<input type="checkbox" id="terms_service" name="agreement_checkbox" class="agreeCheck">
	                	<label for="terms_service">이용약관</label>
	                	<a href="#agreeTerms" class="btnMore">내용보기</a>
					</li>
					<li>
						<input type="checkbox" id="terms_privacy" name="agreement_checkbox" class="agreeCheck">
						<label for="terms_privacy">개인정보 수집 및 이용동의</label>
							<a href="#privacyTerms" class="btnMore">내용보기</a>
					</li>
				</ul>
			</div>
		</div>
<h4 id="agreeTerms">이용약관</h4>
	<div class="ec-solution-box typeThinBg">
<div class="agree" style="overflow:scroll; width:400px; height:250px;">
			<p>제1조(목적)<br>이 약관은 주식회사 아이몰<span style="font-size: 9pt;">(전자상거래 사업자)가 운영하는 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.</span></p><p>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><p>제2조(정의)<br>① “몰”이란 아이몰이 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>③ ‘회원’이라 함은 “몰”에 (삭제) 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</p><p>제3조 (약관 등의 명시와 설명 및 개정) <br>① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br>⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</p><p>제4조(서비스의 제공 및 변경) <br>① “몰”은 다음과 같은 업무를 수행합니다.<br>&nbsp; 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>&nbsp; 2. 구매계약이 체결된 재화 또는 용역의 배송<br>&nbsp; 3. 기타 “몰”이 정하는 업무<br>② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><p>제5조(서비스의 중단) <br>① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</p><p>제6조(회원가입) <br>① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br>&nbsp; 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>&nbsp; 2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>&nbsp; 3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br>③ 회원가입 절차에 인증이 없어, 여러개의 아이디를 통합하는 것은 불가능합니다. 물론 적립금의 관한정보 등도 이동이 불가능합니다.<br>④&nbsp;<span style="font-size: 9pt;">회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</span></p><p>⑤&nbsp;<span style="font-size: 9pt;">회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</span></p><p>제7조(회원 탈퇴 및 자격 상실 등) <br>① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br>② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br>&nbsp; 1. 가입 신청 시에 허위 내용을 등록한 경우<br>&nbsp; 2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>&nbsp; 3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>&nbsp; 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br>④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</p><p>제8조(회원에 대한 통지)<br>① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br>② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</p><p>제9조(구매신청) <br>① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. (삭제)<br>&nbsp; 1. 재화 등의 검색 및 선택<br>&nbsp; 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br>&nbsp; 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인<br>&nbsp; 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)<br>&nbsp; 5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의<br>&nbsp; 6. 결제방법의 선택<br>② “몰”이 제3자에게 구매자 개인정보를 제공•위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유‧이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.</p><p>제10조 (계약의 성립)<br>① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br>&nbsp; 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>&nbsp; 2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br>&nbsp; 3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우<br>② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</p><p>제11조(지급방법)<br>“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br>1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 <br>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>3. 온라인무통장입금<br>4. 전자화폐에 의한 결제<br>5. 수령 시 대금지급<br>6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제<br>7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 <br>8. 기타 전자적 지급 방법에 의한 대금 지급 등</p><p>제12조(수신확인통지․구매신청 변경 및 취소)<br>① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</p><p>제13조(재화 등의 공급)<br>① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br>② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.</p><p>제14조(환급)<br>“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</p><p>제15조(청약철회 등)<br></p><p>① 통신판매업자와 재화등의 구매에 관한 계약을 체결한 소비자는 다음 각 호의 기간(거래당사자가 다음 각 호의 기간보다 긴 기간으로 약정한 경우에는 그 기간을 말한다) 이내에 해당 계약에 관한 청약철회등을 할 수 있다.&nbsp;</p><p><br></p><p>1. 제13조제2항에 따른 계약내용에 관한 서면을 받은 날부터 7일. 다만, 그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터 7일</p><p><br></p><p>2. 제13조제2항에 따른 계약내용에 관한 서면을 받지 아니한 경우, 통신판매업자의 주소 등이 적혀 있지 아니한 서면을 받은 경우 또는 통신판매업자의 주소 변경 등의 사유로 제1호의 기간에 청약철회등을 할 수 없는 경우에는 통신판매업자의 주소를 안 날 또는 알 수 있었던 날부터 7일</p><p><br></p><p>3. 제21조제1항제1호 또는 제2호의 청약철회등에 대한 방해 행위가 있는 경우에는 그 방해 행위가 종료한 날부터 7일</p><p><br></p><p>② 소비자는 다음 각 호의 어느 하나에 해당하는 경우에는 통신판매업자의 의사에 반하여 제1항에 따른 청약철회등을 할 수 없다. 다만, 통신판매업자가 제6항에 따른 조치를 하지 아니하는 경우에는 제2호부터 제5호까지의 규정에 해당하는 경우에도 청약철회등을 할 수 있다.&nbsp;</p><p><br></p><p>1. 소비자에게 책임이 있는 사유로 재화등이 멸실되거나 훼손된 경우. 다만, 재화등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외한다.</p><p><br></p><p>2. 소비자의 사용 또는 일부 소비로 재화등의 가치가 현저히 감소한 경우</p><p><br></p><p>3. 시간이 지나 다시 판매하기 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</p><p><br></p><p>4. 복제가 가능한 재화등의 포장을 훼손한 경우</p><p><br></p><p>5. 용역 또는 「문화산업진흥 기본법」 제2조제5호의 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 그러하지 아니하다.</p><p><br></p><p>6. 그 밖에 거래의 안전을 위하여 대통령령으로 정하는 경우</p><p><br></p><p>③ 소비자는 제1항 및 제2항에도 불구하고 재화등의 내용이 표시·광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 그 재화등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회등을 할 수 있다.</p><p><br></p><p>④ 제1항 또는 제3항에 따른 청약철회등을 서면으로 하는 경우에는 그 의사표시가 적힌 서면을 발송한 날에 그 효력이 발생한다.</p><p><br></p><p>⑤ 제1항부터 제3항까지의 규정을 적용할 때 재화등의 훼손에 대하여 소비자의 책임이 있는지 여부, 재화등의 구매에 관한 계약이 체결된 사실 및 그 시기, 재화등의 공급사실 및 그 시기 등에 관하여 다툼이 있는 경우에는 통신판매업자가 이를 증명하여야 한다.</p><p><br></p><p>⑥ 통신판매업자는 제2항제2호부터 제5호까지의 규정에 따라 청약철회등이 불가능한 재화등의 경우에는 그 사실을 재화등의 포장이나 그 밖에 소비자가 쉽게 알 수 있는 곳에 명확하게 표시하거나 시험 사용 상품을 제공하는 등의 방법으로 청약철회등의 권리 행사가 방해받지 아니하도록 조치하여야 한다. 다만, 제2항제5호 중 디지털콘텐츠에 대하여 소비자가 청약철회등을 할 수 없는 경우에는 청약철회등이 불가능하다는 사실의 표시와 함께 대통령령으로 정하는 바에 따라 시험 사용 상품을 제공하는 등의 방법으로 청약철회등의 권리 행사가 방해받지 아니하도록 하여야 한다.&nbsp;</p><div><br></div><p>제16조(청약철회 등의 효과)<br>① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.<br>② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.<br>④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</p><p>제17조(개인정보보호)<br>① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. <br>② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br>③ “몰”은 이용자의 개인정보를 수집•이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br>④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br>⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br>⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br>⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br>⑨ “몰”은 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</p><p>제18조(“몰“의 의무)<br>① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.<br>② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br>④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p><p>제19조(회원의 ID 및 비밀번호에 대한 의무)<br>① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br>② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.</p><p>제20조(이용자의 의무)<br>이용자는 다음 행위를 하여서는 안 됩니다.<br>1. 신청 또는 변경시 허위 내용의 등록<br>2. 타인의 정보 도용<br>3. “몰”에 게시된 정보의 변경<br>4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</p><p>제21조(연결“몰”과 피연결“몰” 간의 관계)<br>① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.<br>② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</p><p>제22조(저작권의 귀속 및 이용제한)<br>① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br>② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</p><p>제23조(분쟁해결)<br>① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.<br>② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br>③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</p><p>제24조(재판권 및 준거법)<br>① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br></p>
부 칙(시행일) 이 약관은 2017년 4월 27일부터 시행합니다.
<div>제 25조. 카카오톡 알림톡 시행에 관한 내용
“아이몰” 은 회원가입, 주문안내, 배송안내 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며, 만약 알림톡 수신이 불가능하거나 수신 차단하신 경우에는 일반 문자 메시지로 보내드립니다. 카카오톡 알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로 이용할 경우, 알림톡 수신 중 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 발송되는 알림톡 수신을 원치 않으실 경우 반드시 알림톡을 차단하여 주시기 바랍니다.
</div>
<div><br></div>
<div>
<div style="line-height: 1.5; font-family: 돋움, Dotum, Helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; background-color: rgb(255, 255, 255);"><font face="tahoma, sans-serif">#카카오톡&nbsp;알림톡&nbsp;시행에 관한 내용</font></div><div style="line-height: 1.5; font-family: 돋움, Dotum, Helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; background-color: rgb(255, 255, 255);"><font face="tahoma, sans-serif">“아이몰”은 회원가입, 주문안내, 배송안내 등 비광고성 정보를 카카오톡&nbsp;알림톡으로 알려드리며, 만약 알림톡&nbsp;수신이 불가능하거나 수신 차단하신 경우에는 일반 문자메시지로 보내드립니다. 카카오톡&nbsp;알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로&nbsp;</font></div><div style="line-height: 1.5; font-family: 돋움, Dotum, Helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; background-color: rgb(255, 255, 255);"><font face="tahoma, sans-serif">이용할 경우, 알림톡&nbsp;수신 중 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 발송되는 알림톡&nbsp;수신을 원치 않으실 경우 반드시 알림톡을 차단하여 주시기 바랍니다.</font></div><div style="line-height: 1.5; font-family: 돋움, Dotum, Helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; background-color: rgb(255, 255, 255);"><font face="tahoma, sans-serif"><br></font></div><div style="line-height: 1.5; font-family: 돋움, Dotum, Helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; background-color: rgb(255, 255, 255);"><font face="tahoma, sans-serif">#카카오톡&nbsp;상담톡&nbsp;시행에 관한 내용</font></div><div style="line-height: 1.5; font-family: 돋움, Dotum, Helvetica, &quot;Apple SD Gothic Neo&quot;, sans-serif; background-color: rgb(255, 255, 255);"><font face="tahoma, sans-serif">"아이몰"은&nbsp;상담업무를 카카오톡&nbsp;상담톡으로 진행하며, 만약 카카오톡을 통해 안내되는&nbsp;상담&nbsp;내용을 Wi-Fi 나 PC가 아닌 이동통신망으로 이용할 경우, 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해&nbsp;상담을 원치 않으실 경우 고객센터, 게시판 문의를 이용해 주시기 바랍니다.</font></div></div>

</div>
</div>
<h4 id="privacyTerms">개인정보 수집 및 이용동의</h4>
<div class="ec-solution-box typeThinBg">
<div class="agree" style="overflow:scroll; width:400px; height:250px;">
■ 수집하는 개인정보 항목<br>
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<p>

ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일, 법정대리인정보 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록<br>
ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식</p>
<p>■ 개인정보의 수집 및 이용목적</p>

<p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>

<p>
ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송<br>
ο 회원 관리<br>
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용<br>
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
</p>

<p>■ 개인정보의 보유 및 이용기간</p>

<p>회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.</p>
<p><br></p>
<p>#개인정보의 위탁 처리
“아이몰 쇼핑몰”은 서비스 향상을 위해 관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에
위탁하여 처리하고 있습니다. “<span style="font-size: 9pt;">아이몰</span><span style="font-size: 9pt;">쇼핑몰”의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.</span></p><p>&nbsp;- 수탁자 : (주)루나소프트</p><p>&nbsp;- 위탁 업무 내용 : 카카오톡 알림톡 발송 업무</p>                
</div>
</div>
</form>
</div>
</div>
	<div class="ec-solution-button">
		<a href="#none" id="agreementClick" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_agree_join.gif" alt="동의하고 가입하기"></a>
	</div>
		<a class="close" href="#none" onclick="AgreementLayer.closeAgreementLayer(); return false;"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.png" alt="닫기"></a>
	</div>


<script type="text/javascript">
  var naver_id_login = new naver_id_login("dnvfDSWWZdZLlC4W0n7E", "http://localhost:8080/icade/callbackTest");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('name'));
  }
</script>
</body>
</html>