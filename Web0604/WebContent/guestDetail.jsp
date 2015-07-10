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
	private  int Gsabun; //사번
	private  String Gname; //이름
	private  String Gtitle; //제목
	private int Gpay;
%>

	
<table  width=800  border="1"  cellspacing="0">	
	<tr bgcolor="pink" align="center" height="45">
		<td>사 번</td> <td>이 름</td>
		<td>제 목</td>  <td>날 짜</td> <td>급 여</td> 
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
		<td> <%= "날짜" %> </td>
		<td> <%= Gpay %> </td>
	</tr>	
		 
<%		 
	
  }catch(Exception ex) {  }	
%>
</table>
	<p>
	<h1>
	<a href="guest.jsp">[등록화면] </a>
	<a href="list.do">[전체출력] </a>
	<a href="guestDelete.jsp">[삭제화면] </a>
	<a href="guestEdit.jsp?idx=<%=Gsabun%>&idx2=<%=Gname%>&idx3=<%=Gtitle%>&idx4=<%=Gpay%>">[수정화면] </a>
</h1>
</body>
</html>






