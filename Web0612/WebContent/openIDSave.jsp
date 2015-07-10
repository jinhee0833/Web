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
private  Connection CN; //DB서버, id, pass / 명령생성할때 참조
private  Statement ST; //select쿼리문 정적명령어
private  PreparedStatement PST; //insert,update, delete컴파일된명령어
private  ResultSet RS; //RS=ST.executeQuery("select쿼리문")
	
private  int Gsabun;
private  String Gname;
private  String sql="insert,update,delete,select";
private  int total=0; //레코드갯수
%>

<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN = DriverManager.getConnection(url,"system","oracle");
	//out.println("<h1> DB서버연결성공 DB서버연결성공 </h1>");
}catch(Exception ex){
	System.out.println("실패:" + ex.toString());
	//out.println("<h1>실패:" + ex.toString() +"</h1>");
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
	 
	 if(total>0){ //이미 등록된사번=아이디가 존재한다는 의미
%>		 
	<script type="text/javascript">
		alert("<%=data%> 이미 등록된 아이디=사번입니다");
		opener.myform.sabun.value="";
		self.close( );
	</script>	 
<%		 
	 }else{
%>		 
	<script type="text/javascript">
		alert("사용가능한 아이디=사번입니다");
		self.close( );
	</script>		 
<%		 
	 }
 }catch(Exception ex){   }
%>

</body>
</html>









