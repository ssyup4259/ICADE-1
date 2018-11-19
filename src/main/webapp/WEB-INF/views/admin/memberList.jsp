<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html>
<head>
<title>회원리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp%>/resources/images/favicon.ico">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	function memberList() {
		
		var f = document.mSearchForm;
		
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
	<jsp:include page="../include/header2.jsp" flush="false" />


	<div class="container-fluid" style="background-color: #F2F1F0; margin-bottom: 200px; border-bottom: 200px;">
		<div class="container-fluid text-center" style="padding-top: 50px; padding-bottom: 50px;">
			<h2>회원 리스트</h2>
			<form action="" name="mSearchForm" method="post">
				<div class="btn-group" data-toggle="buttons">
					<c:if test="${empty M_RANK}">
						<input type="radio" id="m_all" name="M_RANK" value="" checked="checked"/>
						<label for="m_all" style="cursor: pointer;"><span></span>&nbsp;전체&nbsp;</label>
						
						<input type="radio" id="m_customer" name="M_RANK" value="customer"/>
						<label for="m_customer" style="cursor: pointer;"><span></span>&nbsp;customer&nbsp;</label>
						
						<input type="radio" id="m_seller" name="M_RANK" value="seller"/>
						<label for="m_seller" style="cursor: pointer;"><span></span>&nbsp;seller&nbsp;</label>
						<br/><br/>
					</c:if>

					<c:if test="${M_RANK == 'customer'}">
						<input type="radio" id="m_all" name="M_RANK" value=""/>
						<label for="m_all" style="cursor: pointer;"><span></span>&nbsp;전체&nbsp;</label>
						
						<input type="radio" id="m_customer" name="M_RANK" value="customer" checked="checked"/>
						<label for="m_customer" style="cursor: pointer;"><span></span>&nbsp;customer&nbsp;</label>
						
						<input type="radio" id="m_seller" name="M_RANK" value="seller"/>
						<label for="m_seller" style="cursor: pointer;"><span></span>&nbsp;seller&nbsp;</label>
						<br/><br/>
					</c:if>

					<c:if test="${M_RANK == 'seller'}">
						<input type="radio" id="m_all" name="M_RANK" value=""/>
						<label for="m_all" style="cursor: pointer;"><span></span>&nbsp;전체&nbsp;</label>
						
						<input type="radio" id="m_customer" name="M_RANK" value="customer"/>
						<label for="m_customer" style="cursor: pointer;"><span></span>&nbsp;customer&nbsp;</label>
						
						<input type="radio" id="m_seller" name="M_RANK" value="seller" checked="checked"/>
						<label for="m_seller" style="cursor: pointer;"><span></span>&nbsp;seller&nbsp;</label>
						<br/><br/>
					</c:if>
				</div>

				<select name="searchKey" class="selGreen" style="width: 150px;">
					<option value="M_ID">아이디</option>
					<option value="M_NAME">이름</option>
				</select>
				<input type="text" name="searchValue" class="inputBoxGray" style="width: 400px;" placeholder="검색할 단어를 입력해주세요.">
				<input type="button" value=" 검색 " class="btnGreen" onclick="memberList();" style="width: 150px;" />
			</form>


			<form action="" method="post" name="authorityForm">
				<input type="hidden" name="M_RANK" value="${M_RANK}" />
				<input type="hidden" name="searchKey" value="${searchKey}" />
				<input type="hidden" name="searchValue" value="${searchValue}" />
				<table cellpadding="10" cellspacing="0" style="margin: auto; width: 90%;">
					<thead style="border: none;">
						<tr>
							<th>회원 권한</th>
							<th>권한 변경</th>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>이메일</th>
							<th>휴대전화</th>
							<th>포인트</th>
							<th>가입일</th>
						</tr>
					</thead>

					<c:forEach var="m_dto" items="${m_lists}">
						<tbody style="border: none;">
							<tr>
								<td>${m_dto.getM_RANK()}</td>
								<td><input type="button" value="권한 변경" class="btnGreen" onclick="authorityChange('${m_dto.getM_ID()}', '${m_dto.getM_RANK()}')" /></td>
								<td>${m_dto.getM_ID()}</td>
								<td>${m_dto.getM_NAME()}</td>
								<td>${m_dto.getM_NICKNAME()}</td>
								<td>${m_dto.getM_ZIPCODE()}</td>
								<td>${m_dto.getM_ADDRESS1()}${m_dto.getM_ADDRESS2()}</td>
								<td>${m_dto.getM_EMAIL_ID()}@${m_dto.getM_EMAIL_DOMAIN()}</td>
								<td>${m_dto.getM_CELLPHONE1()}-${m_dto.getM_CELLPHONE2()}-${m_dto.getM_CELLPHONE3()}</td>
								<td><fmt:formatNumber>${m_dto.getM_POINT()}</fmt:formatNumber>P</td>
								<td>${m_dto.getM_DATE()}</td>
							</tr>
						</tbody>
					</c:forEach>
					<tfoot>
						<tr>
							<td colspan="11"><c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if> <c:if test="${dataCount==0 }">
					등록된 상품이 없습니다.
				</c:if></td>
						</tr>
					</tfoot>

				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />

</body>
</html>