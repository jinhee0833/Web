<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="session_check.jsp" %>
<%@ include file="Dbcon.jsp" %>
<%	
	String comment_idx = request.getParameter("comment_idx");

	try{
		conn = DriverManager.getConnection(url, id, pwd);
		sql = "select * from kakao_comment where comment_id ='" + user_id +"' and comment_idx = '" + comment_idx + "'";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		 
		if ( rs.next() ){
			sql = "delete from kakao_comment where comment_idx = '" + comment_idx + "'";
			
			stmt = conn.createStatement();
			int OK = stmt.executeUpdate(sql);
			
			if ( OK > 0 ){
				out.print("ok");
			}else{
				out.print("no");	//삭제가 실패한경우
			}	
		}else{
			out.print("no2");	//댓글작성자가 아닌 댓글삭제를 시도할경우
		}
		
		
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