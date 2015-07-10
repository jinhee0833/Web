package WebKakao_PJ.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import WebKakao_PJ.db.*;

public class Msg_sql {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	private String comment_content;
	private String comment_name;
	private Date date;
	private String sql = null;

	public Msg_sql() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/snow");
			
		} catch (Exception ex) {
			System.out.println("DB 연결실패 : " + ex.toString());
			return;
		}
	} // end

	public int Msg_InsertAction(Msg_bean m_bean) {
		int OK = 0;
		
		try {
			con = ds.getConnection();
			sql = "insert into kakao_message(msg_idx,msg_sendID,msg_receiveID,msg_content,msg_check,msg_senddate,msg_receivedate) "
					+ "values(kakao_message_seq.nextval,?,?,?,'N',sysdate,sysdate )";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_bean.getMsg_sendID());
			pstmt.setString(2, m_bean.getMsg_receiveID());
			pstmt.setString(3, m_bean.getMsg_content());

			OK = pstmt.executeUpdate();
			if (OK > 0) {
				System.out.println("쪽지보내기성공");
			}

		} catch (Exception ex) {
			System.out.println("쪽지보내기실패" + ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}
	
	public ArrayList Msg_ListAction(String user_id){
		/*msg_idx         ->일련번호
		msg_sendID        ->보낸사람아이디
		msg_receiveID    ->받는사람 아이디
		msg_content   ->보낼쪽지 내용
		msg_check     ->쪽지 수신확인
		msg_senddate ->보낸시간
		msg_receivedate ->받은시간
		*/
		ArrayList list = new ArrayList();
		
		try{
			con = ds.getConnection();
			sql = "SELECT msg_idx, msg_sendID, msg_receiveID, msg_content, msg_check, msg_senddate, msg_receivedate "
					+ "FROM kakao_message WHERE msg_receiveID='"+user_id+"' order by msg_idx desc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while ( rs.next() ){
				Msg_bean mbean = new Msg_bean();
				mbean.setMsg_idx(rs.getInt("msg_idx"));
				mbean.setMsg_sendID(rs.getString("msg_sendID"));
				mbean.setMsg_receiveID(rs.getString("msg_receiveID"));
				mbean.setMsg_content(rs.getString("msg_content"));
				mbean.setMsg_check(rs.getString("msg_check"));
				mbean.setMsg_senddate(rs.getDate("msg_senddate"));
				mbean.setMsg_receivedate(rs.getDate("msg_receivedate"));
				list.add(mbean);
			}
		}catch(Exception ex){
			System.out.println("Msg_ListAction="+ex);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return list;
	}
	public ArrayList Msg_sendListAction(String user_id){
	
		ArrayList list = new ArrayList();
		
		try{
			con = ds.getConnection();
			sql = "SELECT msg_idx, msg_sendID, msg_receiveID, msg_content, msg_check, msg_senddate, msg_receivedate "
					+ "FROM kakao_message WHERE msg_sendID='"+user_id+"' order by msg_idx desc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while ( rs.next() ){
				Msg_bean mbean = new Msg_bean();
				mbean.setMsg_idx(rs.getInt("msg_idx"));
				mbean.setMsg_sendID(rs.getString("msg_sendID"));
				mbean.setMsg_receiveID(rs.getString("msg_receiveID"));
				mbean.setMsg_content(rs.getString("msg_content"));
				mbean.setMsg_check(rs.getString("msg_check"));
				mbean.setMsg_senddate(rs.getDate("msg_senddate"));
				mbean.setMsg_receivedate(rs.getDate("msg_receivedate"));
				list.add(mbean);
			}
		}catch(Exception ex){
			System.out.println("Msg_ListAction="+ex);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return list;
	}
	public Msg_bean Msg_ViewAction(String idx, String user_id){
		
		Msg_bean mbean = new Msg_bean();
		String ck = "";
		
		try{
			con = ds.getConnection();
			sql = "SELECT msg_check FROM kakao_message WHERE msg_idx='"+idx+"'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if ( rs.next() ){
				ck = rs.getString("msg_check");
			}
			
			if ( ck.equals("N")  ){
				sql = "UPDATE kakao_message SET msg_receivedate=sysdate, msg_check='Y' WHERE msg_idx='"+idx+"' and msg_receiveID = '"+ user_id +"'";
				stmt.executeUpdate(sql);	
			}
			
			
			sql = "SELECT msg_idx, msg_sendID, msg_receiveID, msg_content, msg_check, msg_senddate, msg_receivedate "
					+ "FROM kakao_message WHERE msg_idx='"+idx+"'";
			rs = stmt.executeQuery(sql);
			if ( rs.next() ){
				mbean.setMsg_senddate(rs.getDate("msg_senddate"));
				mbean.setMsg_content(rs.getString("msg_content"));
				mbean.setMsg_sendID(rs.getString("msg_sendID"));
				mbean.setMsg_idx(rs.getInt("msg_idx"));
			}
			
		}catch(Exception e){
			System.out.println("Msg_View err="+e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return mbean;
	}
	public int Msg_DeleteAction(String idx){
		int OK = 0 ;
		try{
			con = ds.getConnection();
			sql = "DELETE FROM kakao_message WHERE msg_idx = '" + idx + "'";
			stmt = con.createStatement();
			OK = stmt.executeUpdate(sql);
			System.out.println(sql);
			if ( OK > 0 ){
				System.out.println("삭제성공");
			}else{
				System.out.println("삭제실패");
			}
		}catch(Exception e){
			System.out.println("Msg_Delete err="+e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}
	public int Msg_count(String user_id){
		int count = 0;
		
		try{
			con = ds.getConnection();
			sql = "SELECT count(*) as cnt FROM kakao_message WHERE msg_receiveID='"+user_id+"'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if ( rs.next() ){
				count = rs.getInt("cnt");
			}
		}catch(Exception e){
			System.out.println("Msg_count="+e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return count;
	}
	
	public int Msg_notReadCount(String user_id){
		
		int count = 0;
		
		try{
			con = ds.getConnection();
			sql = "SELECT count(*) as cnt FROM kakao_message WHERE msg_receiveID='"+user_id+"' and msg_check='N' ";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if ( rs.next() ){
				count = rs.getInt("cnt");
			}
		}catch(Exception e){
			System.out.println("Msg_count="+e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return count;
	}
}// class end

