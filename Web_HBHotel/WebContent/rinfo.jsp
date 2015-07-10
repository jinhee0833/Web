<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head><title>[joinok.jsp]</title>
<style>
		.joinok {
		position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
}
 	  @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

.qna{margin:0px; padding:0px;height:900px;background-color:#ffffff;}
.j3 {
float:right;  margin-right:470px; margin-top:50px; 
border-top:1px solid #666; border-bottom:1px solid #666;
 }
#j1 ul.j1 li {
	text-decoration:none; 
	font-family: 'Nanum Myeongjo';
	color:#000000;
	font-size:25px;
	margin-left:400px;
	padding-top:100px;
}
#j1 ul.j2 li {
	text-decoration:none; 
	font-family: 'Nanum Myeongjo';
	color:#000000;
	font-size:15px;
	margin-left:420px;
}
#j1 ul.j4{
	margin-top:30px;
}
#j1 ul.j4 li {
	text-decoration:none; 
	font-family: 'Nanum Myeongjo';
	color:#000000;
	font-size:15px;
	margin-left:360px;

}
#j1 img { margin-left:570px; padding-top:30px;}
#a {background-color:#F6F6F6;}
input{margin-left:980px; padding-top:0;
background-color: #E9DECA; border:1px solid black; height:27px;
 font-family: 'Nanum Myeongjo'; }
</style>
</head>
<body>
<div class="joinok">
<%!
	private Connection CN;
	private Statement ST; //ST = CN.createStatement() 정적인명령어
	private PreparedStatement PST;
	private ResultSet RS;
	private String sql;	
	
	private int c_in;
	private int c_out;
	private int count = 3;
	private int rcnt=0;

%>
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		CN=DriverManager.getConnection(url, "system", "oracle");
	}catch(Exception ex){ out.println("<h1>" + ex.toString() + "</h1>"); }
%>
<%
	try{
		request.setCharacterEncoding("euc-kr");		
		c_in = Integer.parseInt(request.getParameter("checkin"));
		c_out = Integer.parseInt(request.getParameter("checkout"));
		
		String sql2 = "select count(*) as cnt from reservation where c_in="+c_in;
		out.println(sql2);
		ST = CN.createStatement();
		RS = ST.executeQuery(sql2);
		if (RS.next() == true){ 		
			int cnt = RS.getInt(1);
			out.println(cnt);
		}
		if(rcnt != count){
		sql = "insert into room values(?,?,?)";
		PST = CN.prepareStatement(sql);//PST 명령어 준비
		PST.setInt(1, c_in);
		PST.setInt(2, c_out);
		rcnt +=1;
		out.println(c_in);out.println(c_out);out.println(rcnt);		
		if(count-rcnt >= 0 ){ PST.setInt(3,rcnt); out.println("예약가능");}		
		else if (rcnt > count){ out.println("방 ㄴㄴ"); }
		
		int success =PST.executeUpdate(); //진짜 저장 처리 메소드
		if(success>0){
			out.println("예약완료");
		}
		else{
			
		}
			}
	}catch(Exception e){ 
		//out.println("<h1>" + e.toString() + "</h1>"); 
		}
%>

<p><br>
</div>
</body>
<%@ include file="bottom.jsp"%>
</html>