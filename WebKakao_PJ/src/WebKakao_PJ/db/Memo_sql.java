package WebKakao_PJ.db;

import java.io.IOException;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


public class Memo_sql {

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;

	private String sql = "";

	public Memo_sql() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/snow");
			
			System.out.println("DB연결성공");
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("DB연결실패");
		}
	}

	public MemoBean Memo(MemoBean mb) {


		try {
			conn = ds.getConnection();
			sql = "SELECT * FROM kakao_memo WHERE memo_user_id='"
					+ mb.getUser_id() + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next() == true) {
				mb.setContent(rs.getString("memo_content"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error" + e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return mb;

	}

	public int Savememo(MemoBean mb) {

		int OK = 0;
		String memo_user_id = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT memo_user_id FROM kakao_memo WHERE memo_user_id='" + mb.getUser_id() + "'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()==true){
			
				sql = "update kakao_memo set memo_content=? where memo_user_id=?";
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setString(1, mb.getContent());
				pstmt.setString(2, mb.getUser_id());
				
			}else{
			
				sql="insert into kakao_memo(memo_user_id,memo_content) values(?,?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mb.getUser_id());
				pstmt.setString(2, mb.getContent());
			}
			
			OK = pstmt.executeUpdate();
			if (OK > 0) {
				System.out.println("메모등록성공");

			}

		} catch (Exception ex) {
			System.out.println("등록실패" + ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}

}
