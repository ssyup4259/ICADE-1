	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var date = dt.getDate();
	var maxDate = $("#history_end_date_button").val();

	$(document).ready(function () {
	    $.datepicker.regional['ko'] = { // regional는 언어
	        closeText: '닫기',//닫기 버튼의 문자열
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 0, //주의 첫날. 0은 일요일
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '', //년도 뒤에 붙는 단위
	        showOn: 'both',
	        buttonText: "달력",
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        yearRange: 'c-99:c+99',
	    };
	    $.datepicker.setDefaults($.datepicker.regional['ko']);
	 
	  //변경될 달력의 값
	    $('#sdate').datepicker();
	    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
	    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#edate").datepicker( "option", "minDate", selectedDate );
	    });
	    
	  //오늘의 날짜 기준의 달력값
	    $('#edate').datepicker();
	    $('#edate').datepicker("option", "minDate", $("#sdate").val());
	    $('#edate').datepicker("option", "maxDate", dt);
	    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#sdate").datepicker( "option", "maxDate", selectedDate );
	    });
	});
	
	/*
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
	*/
	//변경될 달력부분의 인풋박스에 기본값 넣어두기(3달전)
	var defaultValue = year + "-" + (month-3) + "-" + date; 
	var inputVal1 = $("#history_start_date_button").val();
	
	$(function() {
		if(!inputVal1){
			//$( "#history_start_date_button" ).val(defaultValue);
			$( "#sdate" ).val(defaultValue);
		}
	});
	
	//오늘의 날짜 기준의 기본값 넣어주기(today)
	var today = year + "-" + month + "-" + date; 
	var inputVal2 = $("#history_end_date_button").val();
	
	$(function() {
		if(!inputVal2){
			//$( "#history_end_date_button" ).val(today);	
			$( "#edate" ).val(today);	
		}
	}); 
	
	//오늘
	var today = year + "-" + month + "-" + date;
	
	$(document).ready(function (){
		$("#today").click(function(event){
		event.preventDefault();
		$("#sdate" ).val(today);
		});
	});
	
	//일주일전
	var oneWeek = year + "-" + month + "-" + (date-7);
	
	$(document).ready(function (){
		$("#oneWeek").click(function(event){
		event.preventDefault();
		$("#sdate" ).val(oneWeek);
		});
	});
	
	//한달전
	var monthAgo = month-1;
	var oneMonth = year + "-" + monthAgo + "-" + date;
	
	$(document).ready(function (){
		$("#oneMonth").click(function(event){
		event.preventDefault();
		$("#sdate" ).val(oneMonth);
		});
	});
	
	//3개월전
	var threeMonthAgo = month-3;
	var threeMonth = year + "-" + threeMonthAgo + "-" + date;
	
	$(document).ready(function (){
		$("#threeMonth").click(function(event){
		event.preventDefault();
		$("#sdate" ).val(threeMonth);
		});
	});
	
	//6개월전
	var sixMonthAgo = month-6;
	var sixMonth = year + "-" + sixMonthAgo + "-" + date;
	
	$(document).ready(function (){
		$("#sixMonth").click(function(event){
		event.preventDefault();
		$("#sdate" ).val(sixMonth);
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	