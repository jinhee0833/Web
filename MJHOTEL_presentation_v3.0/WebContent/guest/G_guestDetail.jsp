<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="guest.common.DBbean_re" %>
<%@ page import="guest.common.DBbean_co" %>
<html>
<head>
<title>guestDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
<body>
<%
try{
	String id=(String)session.getAttribute("NowUser");
	DBbean_re bb=(DBbean_re)request.getAttribute("detail");
	List data=(List)request.getAttribute("colist");
%>
<div id="guestF">
	<div id="guestF2">
		<div id="guest_title2">이용후기</div>
		<table id="guest_tableF">
			<tr class="guest_tableB">
				<td width=10%>NO</td>
				<td width=30%>TITLE</td>
				<td width=20%>NAME</td>
				<td width=20%>DATE</td>
				<td width=10%>HIT</td>
				<td width=10%>LIKE</td>
			</tr>
			<tr>
				<td><%= bb.getNum() %></td>
				<td><%= bb.getTitle() %></td>
				<td><%= bb.getWriter() %></td>
				<td><%= bb.getWdate() %></td>
				<td style="color:#ff6600"><%=bb.getCount() %></td>
				<td><%=bb.getReco() %>
					<a href="G_guestDetail.do?num=<%=bb.getNum() %>&reco=<%=bb.getReco()%>">
					<img src="guest/images/like.jpg" width=30px height=24px style="vertical-align: middle;"></a>
				</td>
			</tr>
		</table>	
		<div id="guest_contents"><%=bb.getContents( ).replaceAll("\r\n", "<br>")%></div>
		
		<!-- 버튼 -->	
		<div id="guest_bottom">
			<a href='G_guest.do'><input type='button' value="목록" class="bt"></a>
			<a href='./index.jsp?page=guest/m_guest&list=G_guestInsert'><input type='button' value="글쓰기" class="bt"></a>
			<a href="G_guestPreEdit.do?num=<%=bb.getNum()%>"><input type='button' value="수정" class="bt"></a>		
			<form name="reviewlist">
				<a href="index.jsp?page=guest/m_guest&list=G_guestDelete&num=<%=bb.getNum()%>"><input type='button' value="삭제" class="bt"></a>
			</form>
		</div>
		<div id="guest_comment">
			덧글 <%=data.size() %>개<jsp:include page="G_guestCoInsert.jsp" flush="false" />	
			<%
			for(int i=0; i<data.size(); i++){
				DBbean_co cc=(DBbean_co)data.get(i);		
			%>		
			<table class="guest_commentF">		
			<tr>
				<td class="comment1"><%=cc.getCowriter() %></td>
				<td class="comment2"><%=cc.getCodate() %></td>
				<td class="comment3" rowspan="2">
				<%	if(id!=null&&id.equals(cc.getCowriter())){	%>
				<form name=jin method=get action=G_guestCoDelete.do>
					<input type=hidden name=conum value=<%=cc.getConum()%>>
					<input type=hidden name=num value=<%=bb.getNum()%>>				
					<input type=submit value="삭제" class="bt" style="float:right;">
				</form>	
				<%	} %>
				</td>
			</tr>	
			<tr>
				<td class="comment4" colspan="2"><%=cc.getCmt() %></td>
			</tr>
			</table>
			<%	} %>
	
		</div>
	</div>	
<%
}catch(Exception ex){   }
%>
</div>	
</body>
</html>