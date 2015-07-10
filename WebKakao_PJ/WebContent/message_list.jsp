<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebKakao_PJ.db.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지함</title>
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
<script>
 function msg_close(){
	 close();
 }
</script>
</head>
<body>

		<form name="msg_list" action="message_send.jsp">
		<div id="scrollbar1">
    <div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
    <div class="viewport">
    <div class="overview">
	<%@ include file="message_header.jsp" %>
	<table width="460" border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td align="right" height="50"> [ 새쪽지 <%=request.getAttribute("n_count") %> / 전체 <%=request.getAttribute("t_count") %> ] </td>
		</tr>
	</table>


    
    <table border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td bgcolor="#888888" colspan=4 height=1></td>
		</tr>
		<tr>
			<td bgcolor="#eeeeee" align=center width="350" >쪽지내용</td>
			<td bgcolor="#eeeeee" align=center>보낸사람</td>
			<td bgcolor="#eeeeee" align=center>보낸시간</td>
			<!-- td bgcolor="#eeeeee" align=center>읽음</td-->
		</tr>
		<tr>
			<td bgcolor="#888888" colspan=4 height=1></td>
		</tr>
		<%
		
			//for문돌려서 리스트 뿌리는 코드적기
			List list = (List) request.getAttribute("mlist");
			
			if ( list.size() ==0 ){
				out.print("<tr><td colspan=4 align=center height=50>받은 쪽지가 없습니다.</td></tr>");
			}
			
			for ( int i=0; i<list.size(); i++){
				Msg_bean m_bean = (Msg_bean) list.get(i);
				
		%>
		<tr>
			<td width="350" >
				<a href="Msg_View.do?idx=<%=m_bean.getMsg_idx()%>">
					<% if (m_bean.getMsg_check().equals("N")) {
						out.print("<img src='images/icon_message_N.jpg' border=0>");
					}else{ 
						out.print("<img src='images/icon_message_Y.jpg' border=0>");	
					}
					%> 
					
					<%=m_bean.getMsg_content() %>
					
				</a>
			</td>
			<td align=center><a href="message_send.jsp?sendID=<%=m_bean.getMsg_sendID() %>"><%=m_bean.getMsg_sendID() %></a></td>
			<td align=center><%=m_bean.getMsg_senddate() %></td>
			<!-- td align=center><%//m_bean.getMsg_check() %></td-->
		</tr>
		<tr>
			<td bgcolor="#888888" colspan=4 height=1></td>
		</tr>
			<% } %>
		<tr>
		 <td colspan="2" align="center">
		
		 </td>
		</tr>
		</table></div></div></div>
		</form>
	
</body>
</html>