<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>
<%@ page import="not.hb.common.DBbean" %>

<html>
<head> <title> [guestDetail.jsp]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<body>

<%!           
	private  String sql;
	private  int Gsabun; //���
	private  String Gname; //�̸�
	private  String Gtitle; //����
	private int Gpay;
%>

	
<table  width=800  border="1"  cellspacing="0">	
	<tr bgcolor="pink" align="center" height="45">
		<td>�� ��</td> <td>�� ��</td>
		<td>�� ��</td>  <td>�� ¥</td> <td>�� ��</td> 
	</tr>
<%
  try{
	  	DBbean bean =(DBbean) request.getAttribute("naver");
		Gsabun=bean.getSabun();
		Gtitle=bean.getTitle();
		Gname=bean.getName();
		Gpay=bean.getPay();
%>
	<tr>
		<td> <%= Gsabun  %> </td>
		<td> <%= Gname %> </td>
		<td> <%= Gtitle %> </td>
		<td> <%= "��¥" %> </td>
		<td> <%= Gpay %> </td>
	</tr>	
		 
<%		 
	
  }catch(Exception ex) {  }	
%>
</table>
	<p>
	<h1>
	<a href="guest.jsp">[���ȭ��] </a>
	<a href="list.do">[��ü���] </a>
	<a href="guestDelete.jsp">[����ȭ��] </a>
	<a href="guestEdit.jsp?idx=<%=Gsabun%>&idx2=<%=Gname%>&idx3=<%=Gtitle%>&idx4=<%=Gpay%>">[����ȭ��] </a>
</h1>
</body>
</html>






