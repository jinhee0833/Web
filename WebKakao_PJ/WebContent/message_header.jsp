<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script language="javascript">
	var fname = document.URL;
	var s=fname.lastIndexOf("/");
	var m=fname.lastIndexOf(".");
	var e=fname.length;
	var filename=fname.substring(s+1,m);
	var extname=fname.substring(m+1,e);
	
	function msg_close(){
		window.close();
	}
</script>
<body>
	<table border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td width=110><a href="Msg_list.do">[받은 쪽지함]</a></td>
			<td width=110><a href='Msg_sendlist.do'>[보낸 쪽지함]</a></td>
			<td width=200></td>
			<td><a href="message_send.jsp"><img src="images/icon_message_send.jpg" border=0></a></td>
			<td><a href="javascript:msg_close()"><img src="images/icon_message_close.jpg" border=0></a></td>
		</tr>
	</table>
</body>
</html>