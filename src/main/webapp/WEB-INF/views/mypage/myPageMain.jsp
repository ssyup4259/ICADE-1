<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>마이 쇼핑</h1>
<div>
	<ul>
		<li>등	  급 : ${sessionScope.userInfo.getM_RANK()}</li>
	</ul>
	<ul>
		<li>아 이 디 : ${sessionScope.userInfo.getM_ID()}</li>
	</ul>
	<ul>
		<li>닉 네 임 : ${sessionScope.userInfo.getM_NICKNAME()}</li>
	</ul>
	<ul>
		<li>이    름 : ${sessionScope.userInfo.getM_NAME()} </li>
	</ul>
	<ul>
		<li>주	  소 : ${sessionScope.userInfo.getM_ZIPCODE()} ${sessionScope.userInfo.getM_ADDRESS1()} ${sessionScope.userInfo.getM_ADDRESS2()}</li>
	</ul>
	<ul>
		<li>이 메 일 : ${sessionScope.userInfo.getM_EMAIL_ID()}@${sessionScope.userInfo.getM_EMAIL_DOMAIN()}</li>
	</ul>
	<ul>
		<li>전화번호 : ${sessionScope.userInfo.getM_CELLPHONE1()}-${sessionScope.userInfo.getM_CELLPHONE2()}-${sessionScope.userInfo.getM_CELLPHONE3()}</li>
	</ul>
	<ul>
		<li>포 인 트 : ${point} </li>
	</ul>
	<ul>
		<li>가 입 일 : ${sessionScope.userInfo.getM_DATE()}</li>
	</ul>
</div>

<a href="changeInfo.action"><input type="button" value="정보수정"></a>&nbsp;<a href="cancelMembership.action"><input type="button" value="회원탈퇴"></a><br/>
<a href=""><input type="button" value="주문내역조회"></a>&nbsp;<a href=""><input type="button" value="주소록"></a><br/>


</body>
</html>