<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[openIDSave]</title>
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
private  String sql="insert,update,delete,select";
private  int total=0; //���ڵ尹��
%>

<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN = DriverManager.getConnection(url,"system","oracle");
	//out.println("<h1> DB�������Ἲ�� DB�������Ἲ�� </h1>");
}catch(Exception ex){
	System.out.println("����:" + ex.toString());
	//out.println("<h1>����:" + ex.toString() +"</h1>");
}
%>

<body bgcolor=pink>

<%
 try{
	 String data = request.getParameter("userid");
	 sql="select  count(*) as cnt from guest  where sabun = " + data;
	 ST=CN.createStatement();	 	 
	 RS=ST.executeQuery(sql);
	 if(RS.next()==true){
		total = RS.getInt("cnt"); 
	 }
	 
	 if(total>0){ //�̹� ��ϵȻ��=���̵� �����Ѵٴ� �ǹ�
%>		 
	<script type="text/javascript">
		alert("<%=data%> �̹� ��ϵ� ���̵�=����Դϴ�");
		opener.myform.sabun.value="";
		self.close( );
	</script>	 
<%		 
	 }else{
%>		 
	<script type="text/javascript">
		alert("��밡���� ���̵�=����Դϴ�");
		self.close( );
	</script>		 
<%		 
	 }
 }catch(Exception ex){   }
%>

</body>
</html>









