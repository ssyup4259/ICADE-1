<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

 String cp  = request.getContextPath();

 %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>회원가입</title>
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
<script type="text/javascript">

/* function sendId() {
	
	var f = document.myForm;
	
	str = f.mId.value;
	str = str.trim();
	if(!str){
		alert("체크할 아이디를 입력하세요!");
		f.mId.focus();
		return;
		}
	f.mId.value = str;
	
	
}
	 */

	 
 	function sendIt() {
		
		var f = document.joinForm;
		
		/* str = f.mId.value;
		str = str.trim();
		if(!str || str.length<=7){
			alert("아이디를 입력하세요(아이디는 8글자 이상이여야 합니다!).");
			f.mId.focus();
			return;
			}
		f.mId.value = str;
		
		str = f.mPw.value;
		str = str.trim();
		if(!str) {
			alert("패스워드를 입력하세요!");
			f.mPw.focus();
			return;			
			}
		f.mPw.value = str;
		
		
		if( f.mPw.value != f.mPw2.value){
			alert("패스워드가 동일 하지않습니다 확인후 입력하세요!");
			f.mPw.focus();
			return;
			}
		
		str = f.mName.value;
		str = str.trim();
		if(!str){
			alert("이름을 입력하세요!");
			f.mName.focus();
			return;
			}
		f.mName.value = str;
				
		var aa=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		str = f.mEmailId.value;
		str = str.trim();
		if(!str){
			alert("이메일을 입력하세요!");
			f.mEmailId.focus();
			return;
			}else if(!str.match(aa)){
			alert("이메일을 정확히 입력하세요 이메일 주소가 잘못되었습니다!");
			f.mEmailId.focus();
			return;	
				
			}
		f.mEmailId.value = str;
		 
		str = f.mCellphone1.value;
		str = str.trim();
		if(!str){
			alert("전화번호를 입력하세요!");
			f.mPh.focus();
			return;
			}
		f.mPh.value = str;
		
		str = f.mZipcode.value;
		if(!str){
			alert("우편번호를 입력하세요!");
			f.mZipcode.focus();
			return;
			}
		f.mZipcode.value = str;
		
		str = f.mAddress2.value;
		if(!str){
			alert("상세주소를 입력하세요!");
			f.mAddress2.focus();
			return;
			}
		f.mAddress2.value = str;
		
		var checkerbox = document.myForm.checker.checked;
		
		if(!checkerbox){
			alert("이용약관에 동의해 주세요.");
			return false;
			} */
			
		f.action = "<%=cp%>/join_ok.action";
		f.submit();
		
	} 
  	/* function sendMail(email) {
  		
  		var xhttp = new XMLHttpRequest();
  		xhttp.onreadystagechange =function(){
  			if(xhttp.readyState ==4){
  				if (xhttp.status == 200) {
					alert("메일을 정상적으로 보냈습니다");
				}else{
					alert("올바른 메일 형식이 아닙니다.");
					
				}
  			}
  			
  			
  		};
  		xhttp.open("POST","sendMail/", true);
  		xhttp.send("email=" + email);
  		
  		
		return false;
	} */
	
	
</script>      
 
 
</head>

<body>

<!-- 본문 시작 -->
<h1>회원가입양식</h1>
 	<span style="font-size:15px;font-weight:300;">icade의 다양한 혜택을 즐기세요</span>

<form name="joinForm" action="" method="post">
<table>

	<!-- 아이디입력 -->
	<tr>
		<td width="100" align="center">
			<h4>아이디</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="아이디 : 8글자이상 입력하세요" name="M_ID" value="" maxlength="10" size="15" style="padding-left:10px; width: 280px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
			<input type="button" onclick="sendId();" class="btn" value="아이디 중복확인">
		</td>
	</tr>
	
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>	
	
	<!-- 비밀번호 입력 -->
	<tr>
		<td width="100" align="center">
			<h4>패스워드</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="password" name="M_PW" maxlength="10" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
	</tr>
	
	<!-- 비밀번호 확인 -->
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>		
	<tr>
		<td width="100" align="center">
		 	<h4>패스워드 확인</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
		 	 <input type="password" name="mPwchk" maxlength="10" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
	</tr>
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
	<!-- 이름 -->
	<tr>
		<td width="100" align="center">
			<h4>이름</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="이름 : Ex)박명성" name="M_NAME" maxlength="10" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>
	</tr>
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
	
	<tr>
		<td width="100" align="center">
			<h4>닉네임</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="닉네임 : 2글자이상 입력하세요" name="M_NICKNAME" value="" maxlength="10" size="15" style="padding-left:10px; width: 280px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
			<input type="button" onclick="sendId();" class="btn" value="닉네임 중복확인">
		</td>
	</tr>
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
	
	<tr>
		<td width="100" align="center">
			<h4>이메일</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="이메일 : Ex)444@naver.com" name="M_EMAIL_ID" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />@
		</td>
		
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="이메일 : Ex)444@naver.com" name="M_EMAIL_DOMAIN" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>		
	</tr>
	
	<tr height="3">
		<td colspan="4" bgcolor="#cccccc"></td>
	</tr>
	
	<tr>
		<td width="100" align="center">
			<h4>전화번호</h4>
		</td>
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="전화번호 : ex)010" name="M_CELLPHONE1" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />-
		</td>
		
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="전화번호 : Ex)0000" name="M_CELLPHONE2" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />-
		</td>
		
		<td colspan="2" style="padding-left: 5px;">
			<input type="text" placeholder="전화번호 : Ex)1234" name="M_CELLPHONE3" maxlength="30" size="15" style="padding-left:10px; width: 400px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px" />
		</td>			
	</tr>
	
	<tr height="3">
		<td colspan="4" bgcolor="#cccccc"></td>
	</tr>
	
	<h3>추가정보</h3>
	<tr>
		<td>
			<input type="button" onclick="sample6_execDaumPostcode()" class="btn" value="우편번호 찾기">
		</td>
		<td style="padding-left: 5px;">
			<input type="text" name="M_ZIPCODE" class="form-control" placeholder="우편번호" id="sample6_postcode"  style="padding-left:10px; width: 130px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px">
		</td>
		<td>
			<input type="text" name="M_ADDRESS1" class="form-control" placeholder="주소" id="sample6_address" style="padding-left:10px; width: 260px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px">
		</td>
	</tr>
	
	<tr>
		<td colspan="3">
			<input type="text" name="M_ADDRESS2" class="form-control" placeholder="상세주소" id="sample6_address2" style="padding-left:10px; width: 520px; height: 40px; background-color: transparent; color:#5c8a8a; font-family: 'Do Hyeon', sans-serif; font-size: 16px">
		</td>
	</tr>
	
	<tr height="2">
		<td colspan="3" bgcolor="#cccccc"></td>
	</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="button" value="회원가입" style="width: 200px;" height="40px" onclick="sendIt();"/>
    <input type="button" value="취소" style="width: 200px; height: 40px" onclick="javascript:location.href='<%=cp%>'">
</div>
</form>
<!--  본문 끝 -->
 
        </div><!-- content 끝 -->
    </div><!--  container 끝 -->
</div>
</body>
</html>
