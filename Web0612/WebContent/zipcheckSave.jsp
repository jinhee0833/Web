<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[zipcheckSave]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
	<script type="text/javascript">
		
		function sendjuso(a,b,c){
			
			opener.myform.address.value=a+" "+b+" "+c;
			self.close();
		}
	</script>
	
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

////////////////�����ȣ ���� ����ʵ�///////////////////////////
private String zipcode;
private String area1;
private String area2;
private String area3;
private String area4;

private boolean flag;

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
	 String data = request.getParameter("code");
	 String subdata = data.substring(0,3);
	 //sql="select * from zipcode  where zipcode ='"+data+"'";
	 sql="select * from zipcode  where zipcode like'"+subdata+"%'";
	 //out.println(sql);
	 ST=CN.createStatement();	 	 
	 RS=ST.executeQuery(sql);
	 
	 flag = RS.next();
	 if(flag==true){
		 do{
			 zipcode = RS.getString(1);
			 area1 = RS.getString(2);
			 area2 = RS.getString(3);
			 area3 = RS.getString(4);
			 area4 = RS.getString(5);
				
	 //out.println(zipcode + "<a href='javascript:sendjuso('"+area1+"','"+area2+"','"+area3+"')'>"+area1+" "+area2+" "+area3+" "+area4+"</a><br>");
		%>
		<a href="javascript:sendjuso('<%=area1 %>','<%=area2 %>','<%=area3 %>')"><%=zipcode %> <%=area1 %> <%=area2 %> <%=area3 %> <%=area4 %></a><br>
<%
		 }while(RS.next()==true);
	 }else{
		 out.println("<b>"+data+" �����Ͱ� �����ϴ�</b><br>");
		// out.println("<b><a href='zipcheck.jsp'>[zipcheck.jsp]</a></b><br>");
	 }
 }catch(Exception ex){   }
	%>
</body>
</html>