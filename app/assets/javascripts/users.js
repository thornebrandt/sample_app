$(function(){
	var $_micropost = $("#micropost_content");
	var $_notice = $("#characterLimit");
	var maxLength = $_micropost.attr("maxlength");
	$_micropost.bind('input propertychange', 
		function(){
			var inputLength = $(this).val().length;
			if (inputLength <= maxLength){
				var diff = maxLength - inputLength;
				$_notice.text("You have " + diff + " character(s) left"); 
			} else { 
				$_notice.text("You went over by " + (-diff) + " character(s)");
			}
		});
});
