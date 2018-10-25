<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 700px">
		<c:forEach var="bc_dto" items="${bc_lists}" >
		 <tr>
		 	<td>
				 ${bc_dto.getBC_ID()}(<fmt:formatDate value="${bc_dto.getBC_DATE}"/>)
				 <br>
				 ${bc_dto.getBC_CONTENT} 
		 	</td> 
		</tr>
		</c:forEach>
	</table>
</body>
</html>