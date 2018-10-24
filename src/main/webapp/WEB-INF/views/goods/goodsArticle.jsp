<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이폰 케이스는 ICADE</title>
<link rel="stylesheet" href="<%=cp%>/resources/data/css/icade.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="<%=cp%>/resources/data/css/bootstrap-panel.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<style type="text/css">

  body {
      position: relative; 
	  }
	  .affix {
	      top:0;
	      width: 100%;
	      z-index: 9999 !important;
	  }
	  .navbar {
	      margin-bottom: 0p
	      x;
	  }
	
	  .affix ~ .container-fluid {
	     position: relative;
	     top: 50px;
	  }

  #section1 {padding-top:50px;height:500px; width:33% color: #000000; }
  #section2 {padding-top:50px;height:500px;color: #000000; }
  #section3 {padding-top:50px;height:500px;color: #000000; }
  
</style>
  
<style type="text/css">
		
	 a { text-decoration:none; color:#000; }
	.menu_ul { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden; }
	.menu_ul li { float:left; width:33.3%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
	.menu_ul li { display:inline-block; padding:20px; cursor:pointer; }
	.menu_ul li.on { background-color:#eee; color:#f00; }
</style>

<style type="text/css">

	input.up {
        background: url("<%=cp%>/resources/images/btn_quantity_up.gif") no-repeat;
        border: none;
        width: 22px;
        height: 13px;
        cursor: pointer;
	}
	
	input.down {
	        background: url("<%=cp%>/resources/images/btn_quantity_down.gif") no-repeat;
	        border: none;
	        width: 22px;
	        height: 13px;
	        cursor: pointer;
	}

</style>

<!-- 탭 메뉴 적용 -->
<script type="text/javascript">
		$(function () {	
			tab('#tab',0);	
		});
		
		function tab(e, num){
		    var num = num || 0;
		    var menu = $(e).children();
		    var con = $(e+'_con').children();
		    var select = $(menu).eq(num);
		    var i = num;
		
		    select.addClass('on');
		    con.eq(num).show();
		
		    menu.click(function(){
		        if(select!==null){
		            select.removeClass("on");
		            con.eq(i).hide();
		        }
		
		        select = $(this);	
		        i = $(this).index();
		
		        select.addClass('on');
		        con.eq(i).show();
		    });
		}

</script>


<!-- 콤보박스 연결 -->
<script type="text/javascript">
$(function() {

	var select = "<option>:: 선택 ::</option>"; 
	$("#product").change(function() {
		if($("#product").val() == "") { // select의 value가 ""이면, "선택" 메뉴만 보여줌.
			$("#sub").find("option").remove().end().append(select);
		} else {
			comboChange($(this).val());
		}
	});

	function comboChange(deviceCode) {
		
		var G_NUM = ${g_dto.getG_NUM()};
		
		var allData = {"GD_DEVICE":deviceCode, "G_NUM":G_NUM};
		
		$.ajax({
			type:"post",
			url:"<%=cp%>/goods/colorCheck.action",
			datatype:  'json',
			data: allData,
			success: function(data)
			{
				
				var dc_list = [];
				
				dc_list = data;
				
				if(dc_list.length > 0) {
					
					$("#sub").find("option").remove().end().append(select);
					
					$.each(dc_list, function(key, value) {
						$("#sub").append("<option value='" + value.gd_COLOR + "'>" + value.gc_COLOR + "</option>");
						console.log(value);
					});
					
				} else {
					$("#sub").find("option").remove().end().append("<option>-- No sub --</option>");
					return;
				}
			},
			
			error: function() {

				alert("안된다");
				
			}				
		});
	}	
});

</script>


<script type="text/javascript">

	function countUp() {
		
		var count = Number(document.getElementById("GD_COUNT").value);
		
		count = count + 1;
		
		document.getElementById("GD_COUNT").value = count;
		
	}
	
	function countDown() {
		
		var count = Number(document.getElementById("GD_COUNT").value);
		
		if (count <= 1) {
			return;
		}
		
		count = count - 1;
		
		document.getElementById("GD_COUNT").value = count;
		
	}
	
	//장바구니에 추가
	function insertCart() {
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/cart/insertCart.action";
		f.submit();
		
	}

	function change () {
		
		var f = documnet.myForm;
		
	 	var hm = f.GD_COUNT.value;
	 	var sell_price = ${g_dto.getG_PRICE()};
	 	alert(sell_price);
		var sum = f.sum.value;

			if (hm < 0) {
				hm = 0;
			}
		sum = parseInt(hm) * sell_price;
	}  

	
	
	//장바구니에 추가 전 동일품목여부 조회
	function insertCheck() {
		
		var allData = $("#myForm").serialize();
		
		$.ajax({
			
			type:"post",
			url:"<%=cp%>/cart/insertCheck.action",
			datatype:  'json',
			data: allData,
			success: function(data) {
				
				if (data == "success") {
					insertCart();
					alert("성공");
				} else if (data == "reduplication") {
					alert("이미 장바구니에 존재하는 상품입니다.");
				} else if (data == "lack") {
					alert("담고자하는 수량이 재고 수량보다 많습니다.");
				}
				
				console.log(data);
				
			},
			
			error: function(data) {

				console.log(data);
				alert(data);
				
			}				
		});
	}	

</script>

</head>

<body>

	<div class="content2">
		<form id="myForm" name="myForm" method="post" action="">
			<br/><br/><br/><br/>
			
			<table width="1000" align="center">
				<tr>
					<td colspan="2" align="center">
						<h1>${g_dto.getG_NAME()}</h1>
					</td>
				</tr>
				<tr>
					<td width="340">
						 <img src="<%=cp%>/resources/goodsImage/${g_dto.getG_SAVEFILENAME()}" width="340" height="300"> 
					</td>
					<td>
						<table width="100%" height="300">
							<tr align="center">
								<td>상품명</td>
								<td align="left">
									${g_dto.getG_NAME()}
									<input type="hidden" name="G_NAME" value="${g_dto.getG_NAME()}"/>
								</td>
							</tr>
							<tr align="center">
								<td>소비자가</td>
								<td align="left">
									<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>원
								</td>
							</tr>
							
							<tr align="center" onclick="discount();">
								<td>판매가</td>
								<td align="left">
									<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>원
									<input type="hidden" name="G_PRICE" value="${g_dto.getG_PRICE()}"/>
								</td>
							</tr>
							<tr align="center">
								<td>적립금</td>
								<td align="left">
									<img src="<%=cp%>/resources/images/credit/icon_201612281355512700.jpg"/>
									<fmt:formatNumber>${g_dto.getG_PRICE()*0.1}</fmt:formatNumber>원	
								</td>
							</tr>
							
							
							<!--  기종 선택 -->
							<tr align="center">
								<td>기종</td>
								<td align="left">
									<c:if test="${!empty gd_list}">
										<input type="hidden" name="GD_KIND_NUM" value="${gd_list[0].getGD_KIND_NUM()}"/>
										<select name="GD_DEVICE" id="product" >
											<option value="">::기종을 선택하세요::</option>
											<c:forEach var="gd_dto" items="${d_list}">
												<option value="${gd_dto.getGD_DEVICE()}">${gd_dto.getDK_NAME()}</option>
											</c:forEach>
										</select>
									</c:if>
								</td>
							</tr>
							
							<!--  색상 선택 -->
							<tr align="center">
								<td>색상</td>
								<td align="left">
								<select name="GD_COLOR" id="sub">
										<option>:: 색상을 선택해주세요 ::</option>
								</select>
								</td>
							</tr>
							
							<tr align="center">
								<td>수량</td>
								<td align="left">
									<input type="text" id="GD_COUNT" value="1" name="GD_COUNT" size="2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onchange="change();"/>
									<input type="button" id="up" class="up" onclick="countUp();"/>
									<input type="button" id="down" class="down" onclick="countDown();"/>개
								</td>
							</tr>
							
							<tr align="center">
								<td>총 상품금액</td>
								<td align="left">
									<input type="text" id="sum" name="sum" value="" />
								</td>
							</tr>
							
							
							<tr>
								<td colspan="2" height="2" bgcolor="#b3cccc"></td>
							</tr>
							
							<tr align="center">
								<td align="center" colspan="2">
									<input type="hidden" name="G_NUM" value="${g_dto.getG_NUM()}">
									<select></select>
									
									<br/>
									
									<input type="button" value="구매하기" onclick="orderIt();" class="btn" />
									<input type="button" value="장바구니에 담기" onclick="insertCheck();" class="btn" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" height="2" bgcolor="#b3cccc"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<c:if test="${!empty pageNum}">
							<br>
							<div id="btn">
								<a href="<%=cp%>/list.action?pageNum=${pageNum}&G_NUM=${g_dto.getG_NUM()}">
									<h2>상품목록으로 돌아가기</h2>
								</a>
							</div>
							<br>
						</c:if>
						<!-- 최근본 상품목록에서 클릭했을 경우 -->
						<c:if test="${empty pageNum}">
							<br>
							<div id="btn">
								<%-- <a href="<%=cp%>/list.action?pageNum=${pageNum}&G_NUM=${g_dto.getG_NUM()}">
										<h2>상품목록으로 돌아가기</h2></a> --%>
							</div>
							<br>
						</c:if>
					</td>
				</tr>
			</table>
			
			<!-- divison 이동 -->
		    <div>
		      <div class="collapse navbar-collapse" id="menu">
		        <ul class="nav navbar-nav" id="menu_ul">
		          <li><a href="#section1">Section 1</a></li>
		          <li><a href="#section2">Section 2</a></li>
		          <li><a href="#section3">Section 3</a></li>
		        </ul>
		      </div>
		    </div>
			<div id="section1" class="container-fluid">
			  <h1>Section 1</h1>
			  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			
			
				<!-- divison 이동 -->
		    <div>
		      <div class="collapse navbar-collapse" id="menu">
		        <ul class="nav navbar-nav" id="menu_ul">
		          <li class="selected"><a href="#section1">Section 1</a></li>
		          <li><a href="#section2">Section 2</a></li>
		          <li><a href="#section3">Section 3</a></li>
		        </ul>
		      </div>
		    </div>
			<div id="section2" class="container-fluid">
			  <h1>Section 2</h1>
			  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			
				<!-- divison 이동 -->
		    <div>
		      <div class="collapse navbar-collapse" id="menu">
		        <ul class="nav navbar-nav" id="menu_ul">
		          <li><a href="#section1">Section 1</a></li>
		          <li><a href="#section2">Section 2</a></li>
		          <li class="selected" ><a href="#section3">Section 3</a></li>
		        </ul>
		      </div>
		    </div>
			<div id="section3" class="container-fluid">
			  <h1>Section 3</h1>
			  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
		</form>
	</div>

</body>

</html>