<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="session_check.jsp" %>
<%@ include file="Dbcon.jsp" %>
<%	
	try{
		conn = DriverManager.getConnection(url, id, pwd);
		int OK=0;
		 
		//String user_id = (String) session.getAttribute("user_id");
		String idx =  request.getParameter("idx");
		int rcmd =0;
		//out.print(idx);
		
		sql ="select brd_id, brd_rcmd from kakao_board where brd_idx="+idx;
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		
		if(rs.next()){
			
			if ( rs.getString("brd_id").equals(user_id) ){
				out.print("no1");	//자신의 글에 추천했을 경우
			}else{
				
				rcmd = rs.getInt("brd_rcmd")+1;
				sql = "update kakao_board set brd_rcmd = ? where brd_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rcmd);
				pstmt.setString(2, idx);
				
				OK = pstmt.executeUpdate();
				
				out.print(rcmd);
			}
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