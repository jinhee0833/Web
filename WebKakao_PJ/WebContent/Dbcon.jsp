<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	String url=null;
	String id = null;
	String pwd = null;
	
	String sql = null;	
	String result = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		id = "system";
		pwd = "oracle";
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>