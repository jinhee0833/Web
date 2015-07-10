<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>[guestList2.jsp]</title>
	<style type="text/css">
		
		input,select,b,td { font-size:12pt; font-weight:bold;}
		a{
			font-size:12pt; 
			text-decoration: none;
			
		}
		a: hover{font-size: 14pt;
			font-family: comic San MS; color:blue;
		}
	</style>
</head>
<body>
	<%!
		Connection CN;
		Statement ST;
		PreparedStatement PST;
		ResultSet RS;
		
		private String sql;
		private int Gsabun;
		private String Gname;
		private String Gtitle;
		private Date Gnalja;
		private int Gpay;
		private int start=11, end=20;
		private int total=0, pagecount=1;
		
		private String pnum;
		private int pageNUM;
		private int limit=10, pagesize=10;
		private int startpage=1, temp=1;
		private int num=0;	
		
		private String skey,sval,sqry,returnpage;
	%>
	
	<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN=DriverManager.getConnection(url,"system","oracle");
			System.out.println("DB 연결 성공");
		}catch(Exception ex){
			System.out.println("DB 연결 실패");
		}
	%>
	
	<table border=1 cellspacing="0" width=800 >
		<tr align="center" height=45>
			<td colspan="6">
				<form action="guestList2.jsp" method="get">
					검색:
					<select name="keyfield">
						<option value="name" selected="selected">이 름</option>
						<option value="title">제 목</option>
						<option value="content">내 용</option>
					</select> 
					<input type="text" name="keyword" value="">
					<input type="submit" value="검 색">
				</form>
			</td>		
		</tr>
		<%
			skey=request.getParameter("keyfield");
			sval=request.getParameter("keyword");
			sqry=" ";
			if(sval==null || skey==null)
			{
				skey="title";
				sval="";
			}
			sqry=" where "+skey.trim() + " like '%"+sval.trim()+"%'";
			returnpage = "&keyfield="+skey+"&keyword="+sval;
			
			Statement ST2 = CN.createStatement();
			ResultSet RS2 = ST2.executeQuery("select count(*) as cnt from guest" + sqry);
			if(RS2.next()==true){
				total=RS2.getInt("cnt");
			}
		%>
		<tr align="right" height=60 bgcolor="#eeeeee">
			<td colspan="6">
				<font size=6> 레코드갯수: <%=total %>&nbsp;&nbsp;</font>
			</td>
		</tr>
		<tr bgcolor="pink" align="center" height=45>
			<td>글번호</td>
			<td>사 번</td>
			<td>이 름</td>
			<td>제 목</td>
			<td>날 짜</td>
			<td>급 여</td>
		</tr>
	<%
		try{
			sql="select * from (select rownum as rn, sabun,name,title,nalja ,pay from (select * from guest "+ sqry+" order by sabun) )";
			System.out.println(sql) ;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			
			while(RS.next()==true){
			
				Gsabun=RS.getInt("sabun");
				Gname=RS.getString("name");
				Gtitle=RS.getString("title");
				Gnalja=RS.getDate("nalja");
				Gpay=RS.getInt("pay");
		%>
		<tr
			onmouseover="style.backgroundColor='#00FFFF'"
			onmouseout="style.backgroundColor=''"
			>
			<td><%= RS.getInt("rn") %></td>
			<td><%= Gsabun %></td>
			<td><%= Gname %></td>
			<td><%= Gtitle %></td>
			<td><%= Gnalja %></td>
			<td><%= Gpay %></td>
		</tr>
		
		<%	
			}//while end
		}catch(Exception ex){
			
		}
	%>
		
		
	</table>
	

</body>
</html>