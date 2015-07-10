<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="WebKakao_PJ.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지읽기</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#scrollbar1 { width: 510px; clear: both; margin: 20px 0 10px; }
	#scrollbar1 .viewport { width: 490px; height: 310px; overflow: hidden; position: relative; }
	#scrollbar1 .overview { list-style: none; position: absolute; left: 0; top: 0; }
	#scrollbar1 .thumb .end,
	#scrollbar1 .thumb { background-color: #003D5D; }
	#scrollbar1 .scrollbar { position: relative; float: right; width: 15px; }
	#scrollbar1 .track { background-color: #D8EEFD; height: 100%; width:13px; position: relative; padding: 0 1px; }
	#scrollbar1 .thumb { height: 20px; width: 13px; cursor: pointer; overflow: hidden; position: absolute; top: 0; }
	#scrollbar1 .thumb .end { overflow: hidden; height: 5px; width: 13px; }
	#scrollbar1 .disable{ display: none; }
	.noSelect { user-select: none; -o-user-select: none; -moz-user-select: none; -khtml-user-select: none; -webkit-user-select: none; }
</style>
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript" src="Jquery/jquery_s.js"></script>
 <script type="text/javascript">
	$().ready(function(){
	  
		$('#scrollbar1').tinyscrollbar();

	});
</script>
<script language="javascript">
	function send(re){
		location.href = "message_send.jsp?sendID="+re;	
	}
	function msg_del(idx){
		location.href = "Msg_Delete.do?idx="+idx;
	}
</script>
</head>
<body>
<%
	Msg_bean mbean = (Msg_bean) request.getAttribute("mbean");
%>
<form name="sendform" method="post" action="Msg_Insert.do">

<div id="scrollbar1">
    <div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
    <div class="viewport">
    <div class="overview">
<%@ include file="message_header.jsp" %>
<table width="490" cellpadding=1 cellspacing=1>
<tr>
	<td>
		<table width="485">
		<tr>
			<td bgcolor="#999999" height=1></td>
		</tr>
		<tr>
			<td bgcolor="#eeeeee">보낸사람&nbsp; <%=mbean.getMsg_sendID() %></td>
		</tr>
		<tr>
			<td bgcolor="#999999" height=1></td>
		</tr>
		<tr>
			<td bgcolor="#eeeeee">보낸날짜&nbsp; <%=mbean.getMsg_senddate() %></td>
		</tr>
		<tr>
			<td bgcolor="#999999" height=1></td>
		</tr>
		
		<tr>
			<td height="150"><%=mbean.getMsg_content() %></td>
		</tr>
		<tr>
			<td bgcolor="#999999" height=1></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			    <a href="javascript:send('<%=mbean.getMsg_sendID()%>')"><img src="images/btn_message_resend.jpg" border=0></a>&nbsp;&nbsp;
				<a href="javascript:msg_del('<%=mbean.getMsg_idx() %>')"><img src="images/btn_message_delete.jpg" border=0></a>&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td bgcolor="#999999" height=1></td>
		</tr>
		
		</table>
		</td>
	</tr>
</table>
</div></div></div>
</form>
</body>
</html>