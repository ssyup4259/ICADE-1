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
<title>회원 리스트</title>

<script type="text/javascript">

	function sendIt() {
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/admin/memberList.action";
		f.submit();
		
	}
	
	function authorityChange(m_id, m_rank) {
		
		var f = document.authorityForm;
		
		var new_rank = "";
		
		if (m_rank == "customer") {
			new_rank = "seller";
		} else if (m_rank == "seller") {
			new_rank = "customer";
		}
		
		
		if (confirm("권한을 " + m_rank + "에서 " + new_rank + "로 변경 하시겠습니까?") == true) {
			
			f.action = "<%=cp%>/admin/authorityChange.action?m_id=" + m_id + "&new_rank=" + new_rank;
			f.submit();
			
		} else {
			return;
		}
		
	}

</script>

</head>
<body>

<h3>회원 리스트</h3>

<div id="leftHeader">
	<form action="" name="searchForm" method="post">
	
		<c:if test="${empty M_RANK}">
			<label><input type="radio" name="M_RANK" value="" checked="checked"/>전체</label>
			<label><input type="radio" name="M_RANK" value="customer"/>customer</label>
			<label><input type="radio" name="M_RANK" value="seller"/>seller</label>
		</c:if>
		
		<c:if test="${M_RANK == 'customer'}">
			<label><input type="radio" name="M_RANK" value=""/>전체</label>
			<label><input type="radio" name="M_RANK" value="customer" checked="checked"/>customer</label>
			<label><input type="radio" name="M_RANK" value="seller"/>seller</label>
		</c:if>
		
		<c:if test="${M_RANK == 'seller'}">
			<label><input type="radio" name="M_RANK" value=""/>전체</label>
			<label><input type="radio" name="M_RANK" value="customer"/>customer</label>
			<label><input type="radio" name="M_RANK" value="seller" checked="checked"/>seller</label>
		</c:if>
	
		<select name="searchKey" class="selectField">
			<option value="M_ID">아이디</option>
			<option value="M_NAME">이름</option>
		</select>
		<input type="text" name="searchValue" class="textField">
		<input type="button" value=" 검색 " class="btn2" onclick="sendIt();"/>			
	</form>		
</div>

<form action="" method="post" name="authorityForm">
<input type="hidden" name="M_RANK" value="${M_RANK}"/>
<input type="hidden" name="searchKey" value="${searchKey}"/>
<input type="hidden" name="searchValue" value="${searchValue}"/>
	<table style="text-align: center;" border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>회원 권한</td>
			<td>권한 변경</td>
			<td>아이디</td>
			<td>이름</td>
			<td>닉네임</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>이메일</td>
			<td>휴대전화</td>
			<td>포인트</td>
			<td>가입일</td>
		</tr>
		
		<c:forEach var="m_dto" items="${m_lists}">
			<tr>
				<td>${m_dto.getM_RANK()}</td>
				<td><input type="button" value="권한 변경" onclick="authorityChange('${m_dto.getM_ID()}', '${m_dto.getM_RANK()}')"/></td>
				<td>${m_dto.getM_ID()}</td>
				<td>${m_dto.getM_NAME()}</td>
				<td>${m_dto.getM_NICKNAME()}</td>
				<td>${m_dto.getM_ZIPCODE()}</td>
				<td>${m_dto.getM_ADDRESS1()} ${m_dto.getM_ADDRESS2()}</td>
				<td>${m_dto.getM_EMAIL_ID()}@${m_dto.getM_EMAIL_DOMAIN()}</td>
				<td>${m_dto.getM_CELLPHONE1()}-${m_dto.getM_CELLPHONE2()}-${m_dto.getM_CELLPHONE3()}</td>
				<td>${m_dto.getM_POINT()}</td>
				<td>${m_dto.getM_DATE()}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="11">
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된 상품이 없습니다.
				</c:if>
			</td>
		</tr>
	
	</table>
</form>

</body>
</html>