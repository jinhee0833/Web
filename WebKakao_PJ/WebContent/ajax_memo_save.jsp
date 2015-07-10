<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="session_check.jsp" %>
<%@ include file="Dbcon.jsp" %>
<%
 
	//String user_id = (String) session.getAttribute("user_id");
	String content = (String) request.getParameter("memo_content");
	
	try{
		conn = DriverManager.getConnection(url, id, pwd);
			
		sql = "SELECT memo_user_id FROM kakao_memo WHERE memo_user_id='" + user_id + "'";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if( rs.next() ){
		
			sql = "update kakao_memo set memo_content=? where memo_user_id=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, content);
			pstmt.setString(2, user_id);
			
		}else{
		
			sql="insert into kakao_memo(memo_user_id,memo_content) values(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			pstmt.setString(2, content);
		}
		
		int OK = pstmt.executeUpdate();
		
		if (OK > 0) {
			System.out.println("메모등록성공");
			out.print("success");
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