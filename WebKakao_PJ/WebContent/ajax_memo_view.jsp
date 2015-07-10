<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="Dbcon.jsp" %>
<%	

	String user_id = (String) session.getAttribute("user_id");
	String content = null;
	
	try{
		conn = DriverManager.getConnection(url, id, pwd);
			
		sql = "SELECT * FROM kakao_memo WHERE memo_user_id='" + user_id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if (rs.next() == true) {
			content = rs.getString("memo_content");
		}
		
		out.print(content);
		
	}catch(Exception e){ 
		e.printStackTrace(); 
		System.out.println("ajax error="+e); 
	}finally{
		if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
		if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
		if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
		if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
	}
	

%>