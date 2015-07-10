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


public class Login_sql {
	
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;

	private String sql = "";

	public Login_sql(){
		try{
			Context init = new InitialContext();
			ds =  (DataSource) init.lookup("java:comp/env/jdbc/snow");
			
			System.out.println("DB연결성공");
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("DB연결실패");
		}
	}
	
	public String Login_process(String userID, String userPass){
		
		LoginBean bean = new LoginBean();
		String user_name="";
		
		try{
			conn = ds.getConnection();
			sql = "SELECT * FROM kakao_user WHERE user_id='"+userID+"' and user_pw='" + userPass + "'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if ( rs.next() ){
				//bean.setUser_id(rs.getString("user_id"));
				//bean.setUser_name(rs.getString("user_name"));
				//bean.setUser_pw(rs.getString("user_pw"));
				user_name = rs.getString("user_name");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("error"+e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}

		return user_name;
	}
	
}
