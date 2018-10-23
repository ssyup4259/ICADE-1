	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var date = dt.getDate();

	//변경될 달력의 값
	$(function() {
		$( "#history_start_date_button" ).datepicker({
			dateFormat:'yy/mm/dd',
			showOn: "both", 
			buttonImage: "//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif", 
	        buttonImageOnly: true,
	        maxDate: new Date(),
	        nextText:'다음 달',
	        prevText:'이전 달',
	        dayNamesMin:['일','월','화','수','목','금','토'],
	        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12']
		});
	});
	
	//오늘의 날짜 기준의 달력값
	$(function() {
		$( "#history_end_date_button" ).datepicker({
			dateFormat:'yy/mm/dd',
			showOn: "both", 
			buttonImage: "//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif", 
	        buttonImageOnly: true,
	        maxDate: new Date(),
	        nextText:'다음 달',
	        prevText:'이전 달',
	        dayNamesMin:['일','월','화','수','목','금','토'],
	        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12']
		});
	});
	
	//변경될 달력부분의 인풋박스에 기본값 넣어두기(3달전)
	var defaultValue = year + "/" + (month-3) + "/" + date; 
	var inputVal1 = $("#history_start_date_button").val();
	
	$(function() {
		if(!inputVal1){
			$( "#history_start_date_button" ).val(defaultValue);	
		}
	});
	
	//오늘의 날짜 기준의 기본값 넣어주기(today)
	var today = year + "/" + month + "/" + date; 
	var inputVal2 = $("#history_end_date_button").val();
	
	$(function() {
		if(!inputVal2){
			$( "#history_end_date_button" ).val(today);	
		}
	}); 
	
	//오늘
	var today = year + "/" + month + "/" + date;

	$("#today").click(function(){
		$( "#history_start_date_button" ).val(today);
	});
	
	//일주일전
	var oneWeek = year + "/" + month + "/" + (date-7);
	
	$("#oneWeek").click(function(){
		$( "#history_start_date_button" ).val(oneWeek);
	});
	
	//한달전
	var oneMonth = year + "/" + (month-1) + "/" + date;
	
	$("#oneMonth").click(function(){
		$( "#history_start_date_button" ).val(today);
	});
	
	//3개월전
	var threeMonth = year + "/" + (month-3) + "/" + date;
	
	$("#threeMonth").click(function(){
		$( "#history_start_date_button" ).val(today);
	});
	
	//6개월전
	var sixMonth = year + "/" + (month-6) + "/" + date;
	
	$("#sixMonth").click(function(){
		$( "#history_start_date_button" ).val(today);
	});
	
	
	
	
	
	
	
	
	
	
	
	
	