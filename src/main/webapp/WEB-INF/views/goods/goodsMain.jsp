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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var jbOffset = $('.navbar').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.navbar').addClass('jbFixed');
			} else {
				$('.navbar').removeClass('jbFixed');
			}
		});
	});
</script>


<style>

@import url("varaiable (2)");
    
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
	height: 300px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

* {
	font-family: 'Jua', sans-serif;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}

.jbFixed {
	position: fixed;
	width: 100%;
	top: 0px;
	z-index: 9999;
}


</style>
<title>메인화면 상품 리스트</title>
</head>
<body>

<h3>메인화면 상품 리스트</h3><br/><br/>

<c:forEach var="g_dto" items="${popularList}">
	<div class="col-sm-6" style="width: 20%;">
		<div class="panel panel-primary" style="border-color: #A3C838">
			<div class="panel-heading" style="background-color: #A3C838;">${g_dto.getG_NAME()}</div>
			<div class="panel-body">
				<img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="panel-footer">${g_dto.getG_CONTENT()}</div>
		</div>
	</div>
</c:forEach>

</body>
</html>