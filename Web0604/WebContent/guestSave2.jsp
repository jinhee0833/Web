<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestSave2���纻]</title>
	<style type="text/css">
		b,input{ font-size:20pt; font-weight:bold; }
		a{ font-size:26pt; font-weight:bold;  text-decoration:none; }
		a:hover{ font-size:32pt; font-weight:bold;  color:blue; }
	</style>
</head>
<%!
private  Connection CN; //DB����, id, pass / ��ɻ����Ҷ� ����
private  Statement ST; //delete,select������ ������ɾ�
private  PreparedStatement PST; //insert,update�����ϵȸ�ɾ�
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
	<font size=7><b> [guestSave2.jsp=���纻] </b></font><p>
	<img src="images/bar.gif"><p>
<%
	 int dt1 = Integer.parseInt(request.getParameter("sabun"));
	 String dt2 =  request.getParameter("name");
	 String dt3 =  request.getParameter("title");
	 int dt4 =Integer.parseInt(request.getParameter("pay"));
	 out.println("<b>�Ѿ�»��=" +  dt1 + "</b><br>");
	 out.println("<b>�Ѿ���̸�=" +  dt2 + "</b><br>");
	 out.println("<b>�Ѿ������=" +  dt3 + "</b><br>");
	 out.println("<b>�Ѿ�±޿�=" +  dt4 + "</b><p>");
     //SQL���� ���ڿ�ǥ�� �̱۷� ǥ�� 'hong' 
 
 //433������ �ڵ�ó�� ����ؼ� ����ó��
 sql="insert into guest values(" + dt1 + ", '" + dt2 + "', '" + dt3 + "', sysdate, " +  dt4 +")"  ;   
 out.println("<h2>" + sql + "</h2>"); 
 
 try{
	ST = CN.createStatement();
	int OK = ST.executeUpdate(sql);//��¥����Ǵ� �޼ҵ�=�Լ�
	if(OK>0){  
		out.println("<h1>���强�� ���强�� ���强�� </h1>");
		response.sendRedirect("guestList.jsp");
	}
 }catch(Exception ex){ 
	 out.println("<h2>�������: " + ex + "</h2>");  
 }
%>

	<p>
	<h1>
		<a href="guest.jsp">[���ȭ��]</a>
		<a href="guestList.jsp">[��ü���]</a>
		<a href="guestDelete.jsp">[����Ÿ����]</a>
	</h1>
	
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>









