<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head><title>reservation_Delete</title>
</head>
<body>
<%
 	String revID=(String)request.getParameter("revID");
	int RevCap= Integer.parseInt(request.getParameter("RevCap"));
	int revCost=Integer.parseInt(request.getParameter("revCost"));
	String revDate=(String)request.getParameter("revDate");
	String revIn=(String)request.getParameter("revIn");
	String revOut=(String)request.getParameter("revOut");
	int revRoomID=Integer.parseInt(request.getParameter("revRoomID"));
	int revTerm=Integer.parseInt(request.getParameter("revTerm"));
	String type=(String)request.getParameter("type");
	String id2=request.getParameter("id");
%>
<div id="reF">
	<div id="re_title2">�������</div>
	<div align=center style="margin-top:30px;"></div>
	<table id="re_tableF5">
		<tr class="re_tableB">
			<td>���೯¥</td>
			<td>üũ��</td>
			<td>üũ�ƿ�</td>
			<td>�����ϼ�</td>
			<td>����</td>
			<td>������</td>
			<td>ȣ��</td>
		</tr>
		<tr> 
			<td><%= revDate%></td>
			<td><%= revIn%></td>
			<td><%= revOut%></td>
			<td><%= revTerm%></td>
			<td><%= revCost%></td>
			<td><%= type%></td>
			<td><%= revRoomID%></td>
		</tr>
	</table>
	<div align=center style="margin-top:100px;">
		<font size=3 color=orange ><b>�� ������� ���� ����Ͻðڽ��ϱ�?</b></font><br>
		<a href="revStep4.do?revID=<%=revID%>&id2=<%=id2%>"><input type="button" value="��" class="bt"></a>
<%
String id = (String)session.getAttribute("NowUser");
if(id!=null){
%>		
		<a href='revStep3.do?&id=<%=id %>'><input type="button" value="�ƴϿ�" class="bt"></a>
<%
}//else end
%>	
	</div>
</div>
</body>
</html>