<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="Dbcon.jsp" %>
<%	
	String user_id = (String) session.getAttribute("user_id");
	String content = request.getParameter("memo_content");
	String brd_idx = request.getParameter("brd_idx");
	 
	try{
		conn = DriverManager.getConnection(url, id, pwd);
		int ref = 1;
		sql = "select  max(comment_RE_REF)as ref from kakao_comment where comment_boardnum='"
				+ brd_idx+"'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if (rs.next() == true) {
			ref = rs.getInt("ref") + 1;
		}
		
		sql = "insert into kakao_comment(comment_idx,comment_boardnum,comment_id,comment_content,comment_date,"
				+ "comment_RE_REF,comment_RE_LEV,comment_RE_SEQ,comment_rename ) "
				+ "values(kakao_comment_seq.nextval,?,?, ?, sysdate,?,?,?,? )";

		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, brd_idx);
		pstmt.setString(2, (String)session.getAttribute("user_id") );
		pstmt.setString(3, content);
		pstmt.setInt(4, ref);
		pstmt.setInt(5, 0);
		pstmt.setInt(6, 0);
		pstmt.setString(7, (String)session.getAttribute("user_name"));
		int OK = pstmt.executeUpdate();
		
		if (OK > 0) {
			System.out.println("댓글 등록 성공");
			out.print("ok");
		}else{
			out.print("no");
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