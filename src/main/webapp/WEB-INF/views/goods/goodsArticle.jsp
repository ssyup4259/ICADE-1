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
<title>아이폰 케이스는 ICADE</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>



<style type="text/css">

		 { margin:0; padding:0; }
		ul,li { list-style:none; }
		a { text-decoration:none; color:#000; }
		.tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden; }
		.tab li { float:left; width:20%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
		.tab li { display:inline-block; padding:20px; cursor:pointer; }
		.tab li.on { background-color:#eee; color:#f00; }
		.tab_con { clear:both; margin-top:5px; border:1px solid #ddd; }
		.tab_con div { display:none; height:100px; background:#fff; line-height:100px; text-align:center; }

</style>
</head>


<!-- 탭 메뉴 적용 -->
<script>
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
<script >
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

</head>



<body>


	<div class="content2">
		<form name="myForm" method="post" action="">
			<Br> <br> <br> <br>
			
			
			
			
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
								<td align="left">${g_dto.getG_NAME()}</td>
							</tr>
							<tr align="center">
								<td>소비자가</td>
								<td align="left">${g_dto.getG_CONTENT()}</td>
							</tr>
							
							<tr align="center" onclick="discount();">
								<td>판매가</td>
								<td align="left">
									
									<fmt:formatNumber>${g_dto.getG_PRICE()}</fmt:formatNumber>원
									
								</td>
							</tr>
							<tr align="center">
								<td>적립금</td>
								<td align="left">
									<img src="<%=cp%>/resources/images/credit/icon_201612281355512700.jpg"/><fmt:formatNumber>${g_dto.getG_PRICE()*0.1}</fmt:formatNumber>원	
								</td>
							</tr>
							
							
							<!--  기종 선택 -->
							<tr align="center">
								<td>기종</td>
								<td align="left">
									<c:if test="${!empty gd_list}">
										<select name="deviceKind" id="product" >
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
								<select name="sub" id="sub">
										<option>:: 색상을 선택해주세요 ::</option>
								</select>
								</td>
							</tr>
					
							
							<tr align="center">
								<td>총 상품금액</td>
								<td align="left"></td>
							</tr>
							
							
							<tr>
								<td colspan="2" height="2" bgcolor="#b3cccc"></td>
							</tr>
							
							<tr align="center">
								<td align="center" colspan="2">
									<input type="hidden" name="productId" value="${g_dto.getG_NUM()}">
									
									 <select></select>
									 
									
									<br/>
									
									<input type="button" value="구매하기" onclick="orderIt();" class="btn" />
									<input type="button" value="장바구니에 담기" onclick="insertCart();" class="btn" />
									<input type="hidden" name="${g_dto.getG_NUM()}" value="${g_dto.getG_NUM()}"  id="select2">
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
					<%-- 			<a href="<%=cp%>/list.action?pageNum=${pageNum}&G_NUM=${g_dto.getG_NUM()}">
									<h2>상품목록으로 돌아가기</h2> --%>
								</a>
							</div>
							<br>
						</c:if>
					</td>
				</tr>

			</table>
			
			<ul class="tab" id="tab">
			    <li>상품상세정보</li>
			    <li>상품구매안내</li>
			    <li>상품FAQ</li>	
			    <li>상품사용후기</li>	
			    <li>관련후기</li>	
			</ul>
			
			<div class="tab_con" id="tab_con">
			    <div><a href="#preDetail">상품상세정보</a></div>	
			    <div><a href="#preInfo">상품구매안내</a>
			    <div><a href="#preQnA">상품FAQ</a></div>
			    <div><a href="preReview">관련상품</a></div>
			</div>
			
		</form>
		</div>


</body>

<!-- 본문 끝 -->

	<!--  기종 선택 --><%-- 
							
							//최후의 수단
							<tr align="center">
								<td>기종</td>
								<td align="left">
									<c:if test="${!empty gd_list}">
										<select name="selectBox" id="checkDupl" onclick="checkDupl();">
											<c:forEach var="gd_dto" items="${gd_list}">
												<option value="${gd_dto.DK_NAME}&nbsp;${gd_dto.GC_COLOR}">${gd_dto.DK_NAME}${gd_dto.GC_COLOR}</option>
											</c:forEach>
										</select>
									</c:if>
								</td>
							</tr> --%>
							


<!-- 스크립트단 -->

<!-- 	<script type="text/javascript">
		function discount() {
			var price = ${g_dto.getG_PRICE()};
			var discount = ${g_dto.getG_DISCOUNT()};
			var sellPrice;
			
			
			
			sellPrice = ${g_dto.getG_PRICE()}-(${g_dto.getG_PRICE()} * ${g_dto.getG_DISCOUNT()}/100);
			 
		}
	
	</script> -->

</html>