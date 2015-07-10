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

public class Join_sql {
	
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;

	private String sql = "";

	public Join_sql(){
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
		
		JoinBean bean = new JoinBean();
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
	public int JoinInsertAction(JoinBean login_bean){
	
		int OK=0;
		
		try{
			conn = ds.getConnection();
			sql = "insert into kakao_user(user_id,user_pw,user_name) " +
					"values(?,?,?)";
	
			pstmt = conn.prepareStatement(sql);
			
		
				pstmt.setString(1, login_bean.getUser_id());
				pstmt.setString(2, login_bean.getUser_pw());
				pstmt.setString(3, login_bean.getUser_name());
				
				OK = pstmt.executeUpdate();
				if(OK>0){
					System.out.println("가입성공");
					
				}
			
		}catch(Exception ex){System.out.println("가입실패"+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}
	
	public String JoinUserIDCheck(String user_id){
		
		String result="";
		
		try{
			conn = ds.getConnection();
			sql="SELECT * from kakao_user where user_id='"+user_id+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next() ){
				result = "no";
			}else{
				result = "ok";
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
		return result;
	}
}
