<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memo view</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript">
	$().ready(function(){
		$('#save_btn').click(function(){
			setContent();
		});
	});
	
	function setContent() {
		var rtn = "";
		
			$.ajax({
		        type: "POST",
		        async: true,
		        url: "ajax_memo_save.jsp",
		        dataType: 'text',
		        data : { memo_content : $('#m_content').val() },
		        success: function (data) {
		            rtn = data;
		            //alert(data);
		            if ( data.trim() == "success" ){
		            	alert('메모저장완료');
		            	$('#memoLayer').toggle('normal');
		    			$('#memoLayer_back').toggle('normal');
		            }
		        }
		    });
		    return rtn;
	}
	
	function ajax_error(e){
		alert('error'+e.responseText);
		
	}
	
	String.prototype.trim = function()
	{
	    return this.replace(/(^[ \f\n\r\t]*)|([ \f\n\r\t]*$)/g, "");
	}

	
</script>
</head>
<body>
	<form method="post" action="ajax_memo_save.jsp">
		<table border=0>
			<tr>
				<td width="10"></td>
				<td>
					<table>
						<tr>
							<td colspan="2" align="center"><b>메모장</b></td>
						</tr>
						<tr>
							<td align="right"><img id="btn_close" src="images/kakao_close.gif"></td>
						</tr>
			
						<tr>
							<td colspan="2" align="center"><textarea id="m_content" name="memo_content" value=" " cols="40" rows="20"></textarea></td>
						</tr>
			
						<tr>
							<td colspan="2" align="center">
								<a href="javascript:;"><img id="save_btn" src="images/btn_save.jpg" border=0></a>
							</td>
						</tr>
					</table>
				</td>
				<td width="5"></td>
			</tr>
		</table>
	</form>
</body>
</html>