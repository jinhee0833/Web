<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestSave]</title>
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
private  Connection CN; //DB����, id, pass / ��ɻ����Ҷ� ����
private  Statement ST; //select������ ������ɾ�
private  PreparedStatement PST; //insert,update, delete�����ϵȸ�ɾ�
private  ResultSet RS; //RS=ST.executeQuery("select������")
	
private  int Gsabun;
private  String Gname;
private  String sql;
private  int total=0; //���ڵ尹��
%>

<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");//����Ŭ���� ����̺� �ε� 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN = DriverManager.getConnection(url,"system","oracle");

}catch(Exception ex){ }
%>

<body>
<%
	 int dt1 = Integer.parseInt(request.getParameter("sabun"));
	 String dt2 =  request.getParameter("writer");
	 String dt3 =  request.getParameter("content");
 try{
	 sql="insert into guestreply values(guestreply_seq.nextVal,?,?,?)" ;	
	 PST = CN.prepareStatement(sql);		
		PST.setString(1, dt2);		  	
	 	PST.setString(2, dt3); 	
		PST.setInt(3, dt1);	 	
	 PST.executeUpdate();		
	 System.out.println("������强��");
	 
	 %>
	 	<script type="text/javascript">
			history.back();
		</script>
	 <%
	 
	 //response.sendRedirect("guestList.jsp");
 }catch(Exception ex){  System.out.println("����������"); 		}
%>
</body>
</html>









