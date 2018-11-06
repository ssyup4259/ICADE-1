/**
 * 
 */

	var BC_NUM =$("#BC_UPDATE").val();

 
	function replyListUpdate(){
		
		$.ajax({
			 type:"get",
			 url :"<%=cp%>/goods/replyCommentList.action?BC_NUM="+BC_NUM,
			 success : function(result) {
				 //responseText가 result에 저장됨.
				 $("#replyComment").html(result);
			},error : function (result) {
			}
		 });
	}