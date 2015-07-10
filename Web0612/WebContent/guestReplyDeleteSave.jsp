<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestReplyDeleteSave]</title>
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
	Class.forName("oracle.jdbc.driver.OracleDriver");//오라클서버 드라이브 로드 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN = DriverManager.getConnection(url,"system","oracle");
	//out.println("<h1> DB서버연결성공 DB서버연결성공 </h1>");
}catch(Exception ex){}
%>

<body>
	
<%
	 int data = Integer.parseInt(request.getParameter("idx"));
	 out.println("<b>삭제할사번=" +  data + "</b><br>");
 try{
	 sql="delete  from  guestreply  where  num = ? ";
	 PST = CN.prepareStatement(sql);
	 	PST.setInt(1, data);
	 PST.executeUpdate(); //insert,update,delete=>실행Update(X)
	%>
		<script type="text/javascript">
			history.back();
		</script>
	<%		 
	// response.sendRedirect("guestList.jsp");
 }catch(Exception ex){ 
 }
%>


</body>
</html>









