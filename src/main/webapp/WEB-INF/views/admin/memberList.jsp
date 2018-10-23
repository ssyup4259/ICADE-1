<%@page import="org.springframework.http.HttpRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="<%=cp%>/resources/data/css/sangyeop.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="<%=cp%>/resources/data/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
<style type="text/css">
.sticky {
	position: sticky;
	top: 0px;
}

.sticky2 {
	position: sticky;
	top: 3px;
}

table {
	border-collapse: collapse;
	width: 100%;
	border: 3px solid #A3C838;
	border-top-left-radius : 12px;
	text-align: center;
}

th, td {
	padding: 8px;
	border-bottom: 1px solid #A3C838;
}

tr:hover {
	background-color: white;
}

label.radio {
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container-fluid" style="background-color: #F2F1F0; margin-bottom: 200px; border-bottom: 200px;">
		<div class="container-fluid text-center" style="padding-top: 40px; padding-bottom: 40px;">
			<h2>회원 리스트</h2>
			<form action="" name="searchForm" method="post">

				<c:if test="${empty M_RANK}">
					<label><input type="radio" name="M_RANK" value="" checked="checked" />전체</label>
					<label><input type="radio" name="M_RANK" value="customer" />customer</label>
					<label><input type="radio" name="M_RANK" value="seller" />seller</label>
				</c:if>

				<c:if test="${M_RANK == 'customer'}">
					<label><input type="radio" name="M_RANK" value="" />전체</label>
					<label><input type="radio" name="M_RANK" value="customer" checked="checked" />customer</label>
					<label><input type="radio" name="M_RANK" value="seller" />seller</label>
				</c:if>

				<c:if test="${M_RANK == 'seller'}">
					<label><input type="radio" name="M_RANK" value="" />전체</label>
					<label><input type="radio" name="M_RANK" value="customer" />customer</label>
					<label><input type="radio" name="M_RANK" value="seller" checked="checked" />seller</label>
				</c:if>

				<select name="searchKey" class="sel">
					<option value="M_ID">아이디</option>
					<option value="M_NAME">이름</option>
				</select>
				<input type="text" name="searchValue" class="inputBox">
				<input type="button" value=" 검색 " class="btn" onclick="sendIt();" />
			</form>


			<form action="" method="post" name="authorityForm">
				<input type="hidden" name="M_RANK" value="${M_RANK}" />
				<input type="hidden" name="searchKey" value="${searchKey}" />
				<input type="hidden" name="searchValue" value="${searchValue}" />
				<table cellpadding="10" cellspacing="0">
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
								<td><input type="button" value="권한 변경" class="btn" onclick="authorityChange('${m_dto.getM_ID()}', '${m_dto.getM_RANK()}')" /></td>
								<td>${m_dto.getM_ID()}</td>
								<td>${m_dto.getM_NAME()}</td>
								<td>${m_dto.getM_NICKNAME()}</td>
								<td>${m_dto.getM_ZIPCODE()}</td>
								<td>${m_dto.getM_ADDRESS1()}${m_dto.getM_ADDRESS2()}</td>
								<td>${m_dto.getM_EMAIL_ID()}@${m_dto.getM_EMAIL_DOMAIN()}</td>
								<td>${m_dto.getM_CELLPHONE1()}-${m_dto.getM_CELLPHONE2()}-${m_dto.getM_CELLPHONE3()}</td>
								<td>${m_dto.getM_POINT()}</td>
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

</body>
</html>