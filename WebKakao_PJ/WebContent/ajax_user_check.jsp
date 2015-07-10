<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="Dbcon.jsp" %>
<%	
	
	String user_id = request.getParameter("user_id");
	
	try{
		conn = DriverManager.getConnection(url, id, pwd);
			
			sql="SELECT * from kakao_user where user_id='"+user_id+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next() ){
				result = "no";
			}else{
				result = "ok";
			}
			out.print(result);

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
		if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
		if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
		if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
	}
	

%>