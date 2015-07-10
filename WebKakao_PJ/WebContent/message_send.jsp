<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String re = request.getParameter("sendID");
	if ( re==null ){
		re="";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지보내기</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language= "javascript" src="Jquery.js"></script>
<script language="javascript">

	function send(){
		if(sendform.re.value == ""){
			alert('받는분의 아이디를 입력하세요');
			sendform.re.focus();
			return ;
		}
		if(sendform.content.value == ""){
			alert('메시지를 입력하세요');
			sendform.content.focus();
			return ;
		}	
		if(confirm('전송함?♥')){
		sendform.submit();
		
		}
	}
	
</script>
</head>
<body>
<form name="sendform" method="post" action="Msg_Insert.do">
<%@ include file="message_header.jsp" %>
<table>
<tr>
	<td>받는사람&nbsp; <input type="text" name="re" value="<%=re%>"/></td>
</tr>
<tr>
	<td colspan=2><textarea name="content" cols="72" rows="15" wrap="hard"></textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
	    <a href="javascript:send()"><img src="images/btn_message_send.jpg" border=0></a>&nbsp;&nbsp;
	</td>
</tr>
</table>
</form>
</body>
</html>