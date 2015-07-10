package my.board2;
//DAO=Data Access Object
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;  
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class BoardDataBean{
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	static DataSource ds;
	static{
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/snow");
			System.out.println("!!!!! DB연결성공 !!!!!" );
		}catch(NamingException e){
			System.out.println("lookup실패 : " + e.getMessage());
			System.out.println("DB연결실패 " );
		}
	}

	public ArrayList<BoardDBBean> listBoard(int start, int end) throws SQLException{
		String sql = "select * from (select rownum rn, A.* from " 
				+ "(select * from board2 order by ref desc, re_step asc) A) where rn between ? and ?";	
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql); 
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<BoardDBBean> al = makeArrayList(rs);
			return al;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	} //end

	public ArrayList<BoardDBBean> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<BoardDBBean> al = new ArrayList<BoardDBBean>();
		while(rs.next()==true){
			int num = rs.getInt("num");
			String writer = rs.getString("writer");
			String email = rs.getString("email");
			String subject = rs.getString("subject");
			String passwd = rs.getString("passwd");
			String reg_date = rs.getString("reg_date");
			int readcount = rs.getInt("readcount");
			String content = rs.getString("content");
			String ip = rs.getString("ip");
			int ref = rs.getInt("ref");
			int re_step = rs.getInt("re_step");
			int re_level = rs.getInt("re_level");
			String filename = rs.getString("filename");
			
			BoardDBBean db = new BoardDBBean(num, writer, email, subject, passwd, 
					reg_date, readcount, content, ip, ref, re_step, re_level, filename);
			al.add(db);
		}
		return al;
	} //end

	public int insertBoard(MultipartRequest mr, String ip) throws SQLException {
		int num = Integer.parseInt(mr.getParameter("num"));
		System.out.println("이거 뭐니?" + num);
		int ref = Integer.parseInt(mr.getParameter("ref"));
		int re_step = Integer.parseInt(mr.getParameter("re_step"));
		int re_level = Integer.parseInt(mr.getParameter("re_level"));
		
		
		if (num == 0){	//새글
			String sql = "select max(num) from board2";
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()==true){
				ref = rs.getInt(1) + 1;
			}else {
				ref = 1; re_step=0; 	re_level=0;
			}
		}else {				//답글
			String sql = "update board2 set re_step = re_step + 1 where ref=? and re_step>?";
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, re_step);
			int n = ps.executeUpdate();
			re_step++;
			re_level++;
		}
		String sql = "insert into board2 values(board2_seq.nextval, ?,?,?,?,?,0,?,?,?,?,?,?)";
		try{			
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("passwd"));
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(5, sdf.format(date));
			
			ps.setString(6, mr.getParameter("content"));
			ps.setString(7, ip);

			ps.setInt(8, ref);
			ps.setInt(9, re_step);
			ps.setInt(10, re_level);
			
			ps.setString(11, mr.getFilesystemName("filename"));
			
			int result = ps.executeUpdate();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null)con.close();
		}
	} //end

	public BoardDBBean getBoard(String num, String mode) throws SQLException {
		if (mode.equals("content")){
			readcount(num);
		}
		
		String sql = "select * from board2 where num = ?";
		try{  
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			ArrayList<BoardDBBean> al = makeArrayList(rs);
			return al.get(0);
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	} //end

	public void readcount(String num) throws SQLException {
		String sql = "update board2 set readcount = readcount + 1 where num=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			int res = ps.executeUpdate();
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	} //end

	public boolean checkBoard(String num, String passwd) throws SQLException {
		String sql = "select passwd from board2 where num=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			 rs.next() ;
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(passwd)){
					return true;
				}
				return false;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	} //end

	public int deleteBoard(String num) throws SQLException {
		String sql = "delete from board2 where num = ?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}//end

	public int updateBoard(MultipartRequest mr) throws SQLException {
		String sql = "update board2 set subject=?, email=?, content=?, filename=? where num=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("subject"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("content"));
			String filename = mr.getFilesystemName("filename");
			if(filename==null){
				filename = mr.getParameter("filename2");
			}
			ps.setString(4, filename);
			ps.setInt(5, Integer.parseInt(mr.getParameter("num")));
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	} //end

	public int getCount() throws SQLException {
		String sql = "select count(*) from board2";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	} //end

} //class END