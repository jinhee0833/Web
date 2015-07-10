<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>KakaoStory Web Ver1.0</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript">

	$(document).ready(function(){
		//$('input[name="user_id"]').focus();
		
		$('#user_id').focus();

		$('#btn').click(function(){

			if ( loginfo.user_id.value == ""){
				alert('ID를 입력하세요');
				loginfo.user_id.focus();
				return false;
			}
			
			if ( loginfo.user_id.value.length < 4){
				alert('ID는 4자 이상 입력하세요');
				loginfo.user_id.focus();
				return false;
			}
			
			if ( loginfo.user_pw.value == ""){
				alert('Password를 입력하세요');
				loginfo.user_pw.focus();
				return false;
			}
			
			if ( loginfo.user_pw.value < 4 ){
				alert('Password는 4자 이상 입력하세요');
				loginfo.user_pw.focus();
				return false;
			}
			if ( loginfo.user_name.value == ""){
				alert('이름을 입력하세요');
				loginfo.user_name.focus();
				return false;
			}
			if ( confirm('입력한 정보로 가입하시겠습니까?') ){
						
				//var url = "userid_check.do";
				var url = "ajax_user_check.jsp";
				var params = { user_id : $('#user_id').val() };
	
				$.ajax({
					type : "POST",
					url : url,
					data : params,
					dataType:'text',
					success:function(result){
						if (result.trim() == "ok" ){
							//alert("ok");
							loginfo.submit();
						}else{
							alert("사용중인 ID 입니다. 다른아이디를 입력해주세요");
							loginfo.user_id.value="";
							loginfo.user_id.focus();
						}
					},
					error:function(e){ajax_error('err='+e);}
				});
				
			}
		});
	});
	
	function ajax_error(e){
		alert('error'+e.responseText);
		
	}
	
	String.prototype.trim = function()
	{
	    return this.replace(/(^[ \f\n\r\t]*)|([ \f\n\r\t]*$)/g, "");
	}
	

</script>

</head>
<body leftmargin=0 topmargin=0>
<table width="1000" alien="center">
	<tr>
		<td><img src="images/img_login.jpg" width="480" height="800"></td>
	</tr>
</table>

<div id="divLayer" class="clsLayer" style=
     'position : absolute;
     left:100px;
     top:500px;
     width:300px;
     height:100px;
     background-color: #FFFFDD;
     font-size: 11px;
     color: white;
     overflow:no;
     padding:20 10 5 5;
     filter:Alpha(opacity=70);
     border-radius: 10px;
     visibility: visible;
     z-index:1'>
<form name="loginfo" method="post" action="Join.do">
	<table width="300">
		<tr>
			<td height="8"></td>
		</tr>
		<tr>
			<td>
				<table width="300" alien="center">
					<tr>
						<td><font color="black"> ID </font></td>
						<td><input type="text" id="user_id" name="user_id" size=16> </td>
						<td rowspan=2>
							<img id="btn" src="images/btn_login.jpg" border=0 width="55" height="45" style="cursor:hand">
						</td>
					</tr>
					<tr>
						<td><font color="black"> Password </font></td>
						<td><input type="password" name="user_pw" size=16></td>
					</tr>
					<tr>
						<td><font color="black"> 이름 </font></td>
						<td><input type="text" name="user_name" size=16></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		
	</table>
</form>
</div>
</div>
</body>
</html>