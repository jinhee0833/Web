<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestEditSave]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<%!
private  Connection CN; //DB����, id, pass / ���ɻ����Ҷ� ����
private  Statement ST; //select������ �������ɾ�
private  PreparedStatement PST; //insert,update, delete�����ϵȸ��ɾ�
private  ResultSet RS; //RS=ST.executeQuery("select������")
	
private  int Gsabun;
private  String Gname;
private  String sql="insert,update,delete,select";
private  int total=0; //���ڵ尹��
%>

<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");//����Ŭ���� ����̺� �ε� 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN = DriverManager.getConnection(url,"system","oracle");
	out.println("<h1> DB�������Ἲ�� DB�������Ἲ�� </h1>");
}catch(Exception ex){
	System.out.println("����:" + ex.toString());
	out.println("<h1>����:" + ex.toString() +"</h1>");
}
%>

<body>
	<font size=7><b> [guestEditSave.jsp=�ܵ��������] </b></font><p>
<%
	 int dt1 = Integer.parseInt(request.getParameter("sabun"));
	 String dt2 =  request.getParameter("name");
	 String dt3 =  request.getParameter("title");
	 int dt4 =Integer.parseInt(request.getParameter("pay"));
	 out.println("<b>�����ɻ��=" +  dt1 + "</b><br>");
	 out.println("<b>�������̸�=" +  dt2 + "</b><br>");
	 out.println("<b>����������=" +  dt3 + "</b><br>");
	 out.println("<b>�����ɱ޿�=" +  dt4 + "</b><p>");
  
 try{
  sql="update guest set name=?, title=?, nalja=sysdate, pay=? where sabun=?" ;
  //sql="~~?, title=?, nalja=sysdate, pay=? where sabun=?" ;
  PST = CN.prepareStatement(sql);
  	PST.setString(1, dt2);
  	PST.setString(2, dt3);
  	PST.setInt(3, dt4);
  	PST.setInt(4, dt1);
  PST.executeUpdate();//��¥ ����ó��
  response.sendRedirect("guestList.jsp");
 }catch(Exception ex){ 
	 System.out.println("<h1>PST��������: " + ex + "</h1>");  
 }
%>

	<p><h1>
		<a href="guest.jsp">[���ȭ��]</a>
		<a href="guestList.jsp">[��ü���]</a>
		<a href="guestDelete.jsp">[����Ÿ����]</a>
	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>








