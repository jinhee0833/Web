<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>reservation_Step3</title>
</head>
<body>
<div id="reF">
	<div id="re_title2">�����ϱ�</div>
	<!-- ��� �޴� -->
	<table id="re_tableF">
		<tr height=50 align="left">
			<td width="35%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1">Step 1.<br><font size="5">Select Hotel & Detail</font></a></td>
			<td width="25%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step2">Step 2.<br><font size="5">Select Rooms</font></a></td>
			<td width="40%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step3" style="color:orange;">Step 3.<br><font size="5">Complete Reservation</font></a></td>
		</tr>
	</table>
<%
if(session.getAttribute("NowUser")!=null){
%>	
	<div align=center style="margin-top:200px;">
		<font size=3 color=orange ><b> ���࿡ ���� �Ͽ����ϴ�. </b></font><br>
		<a href='./index.jsp?page=reservation/m_reservation&list=reservation_Step1'><input type=button value="Ȯ��" class="bt2"></a> 
	</div>
<%	
}else{
%>
	<div align=center style="margin-top:200px;">
		<font size=3 color=orange ><b>���࿡ �����Ͽ����ϴ�.</b></font> <br>
		<a href='./index.jsp?page=reservation/m_reservation&list=reservation_Step1'><input type=button value="���� �ٽ��ϱ�" class="bt2"></a> 	
	</div>
<%
}
%>
</div>	
</body>
</html>