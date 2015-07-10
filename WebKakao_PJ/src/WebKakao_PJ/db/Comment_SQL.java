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

public class Comment_SQL {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	private String comment_content;
	private String comment_name;
	private Date date;
	private String sql = null;

	public Comment_SQL() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/snow");
			
		} catch (Exception ex) {
			System.out.println("DB ¿¬°á ½ÇÆÐ : " + ex.toString());
			return;
		}
	} // end

	public int getListCount() {//´ñ±Û °¹¼ö
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from kakao_comment");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return x;
	}

	public int comment_InsertAction(Comment_Bean combean, int brd_idx) {//´ñ±Ûµî·Ï
		int OK = 0;
		int ref = 1;
		try {
			con = ds.getConnection();
			sql = "select  max(comment_RE_REF)as ref from kakao_comment where comment_boardnum= "
					+ combean.getComment_boardnum();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next() == true) {
				ref = rs.getInt("ref") + 1;
			}
			sql = "insert into kakao_comment(comment_idx,comment_boardnum,comment_name,comment_content,comment_date,"
					+ "comment_RE_REF,comment_RE_LEV,comment_RE_SEQ,comment_rename ) "
					+ "values(kakao_comment_seq.nextval,?,?, ?, sysdate,?,?,?,? )";

			System.out.print(ref);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, brd_idx);
			pstmt.setString(2, combean.getComment_name());
			pstmt.setString(3, combean.getComment_content());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setString(7, combean.getComment_rename());
			OK = pstmt.executeUpdate();
			if (OK > 0) {
				System.out.println("´ñ±Û µî·Ï ¼º°ø");
			}

		} catch (Exception ex) {
			System.out.println("´ñ±Û ÀúÀå½ÇÆÐ" + ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}

	public List getCommentList( ) {//´ñ±Û¸ñ·Ï
	

		List list = new ArrayList();

		
		try {
			con = ds.getConnection();
			sql = "select * from kakao_comment order by Comment_date";
			stmt = con.createStatement();
			rs =stmt.executeQuery(sql);

			while (rs.next()) {
				Comment_Bean combean = new Comment_Bean();
				combean.setComment_idx(rs.getInt("Comment_idx"));
				combean.setComment_boardnum(rs.getInt("Comment_boardnum"));
				combean.setComment_name(rs.getString("Comment_name"));
				combean.setComment_content(rs.getString("Comment_content"));
				combean.setComment_date(rs.getDate("Comment_date"));
				combean.setComment_RE_REF(rs.getInt("Comment_RE_REF"));
				combean.setComment_RE_LEV(rs.getInt("Comment_RE_LEV"));
				combean.setComment_RE_SEQ(rs.getInt("Comment_RE_SEQ"));
				combean.setComment_rename(rs.getString("Comment_rename"));
				list.add(combean);
			}
			return list;
		} catch (Exception e) {
			System.out.println("getCommentList¿¡·¯:"+e.toString());
		} finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return null;

	} // end
	public Comment_Bean getDetail(){
		List list = new ArrayList();
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from kakao_comment");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			Comment_Bean combean = new Comment_Bean();
			combean.setComment_idx(rs.getInt("Comment_idx"));
			combean.setComment_boardnum(rs.getInt("Comment_boardnum"));
			combean.setComment_name(rs.getString("Comment_name"));
			combean.setComment_content(rs.getString("Comment_content"));
			combean.setComment_date(rs.getDate("Comment_date"));
			combean.setComment_RE_REF(rs.getInt("Comment_RE_REF"));
			combean.setComment_RE_LEV(rs.getInt("Comment_RE_LEV"));
			combean.setComment_RE_SEQ(rs.getInt("Comment_RE_SEQ"));
			combean.setComment_rename(rs.getString("Comment_rename"));
			list.add(combean);
			
			}
		}catch(Exception ex){
			
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(con!=null)try{ con.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return null;
	}
	
}// class end

