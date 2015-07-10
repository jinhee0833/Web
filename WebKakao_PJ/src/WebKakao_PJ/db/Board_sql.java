package WebKakao_PJ.db;

import java.sql.*;
import java.util.*;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Board_sql {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	String sql ="";

	public Board_sql() {
		try{
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/snow");
			
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}

	//dbInsert
	public int dbInsert(Board_bean bean, String user_id){
		int OK=0;
		int num = bean.getBrd_num();
		int brd_ref = bean.getBrd_ref();
		int brd_lev = bean.getBrd_lev();
		int brd_seq = bean.getBrd_seq();
		String str = "brd_idx, brd_num, brd_id, brd_name, brd_content, brd_date, brd_file, brd_rcmd, brd_public, brd_ref, brd_lev, brd_seq";
		try{
			conn = ds.getConnection();
			sql = "select count(*) from kakao_board where brd_id ='"+user_id+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if(rs.next()){
				num = rs.getInt(1)+1;
			}else{
				num = 1;
			}
			sql ="insert into kakao_board("+str+")  values (kakao_seq.nextval,?,?,?,?,sysdate,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bean.getBrd_id());
			pstmt.setString(3, bean.getBrd_name());
			pstmt.setString(4, bean.getBrd_content());
			pstmt.setString(5, bean.getBrd_file());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bean.getBrd_public());
			pstmt.setInt(8,num);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			OK = pstmt.executeUpdate();
		}catch(Exception ex){ System.out.println("dbInsert() :"+ex.toString()); 
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}

	//dbSelect
	public List dbSelect(String user_id,int start, int end, Boolean bool){
		List list = new ArrayList();
		String str = "brd_idx, brd_num, brd_id, brd_name, brd_content, brd_date, brd_file, brd_rcmd, brd_public, brd_ref, brd_lev, brd_seq";
		try{
			conn = ds.getConnection();
			if(bool==true){
				/*sql = "select * from "+
						"(select rownum as rnum,  brd_idx, brd_num, brd_id, brd_name, brd_content, "+
						"brd_date, brd_file, brd_rcmd, brd_public, brd_ref, brd_lev, brd_seq from " +
						" kakao_board order by brd_num desc) where brd_id='"+user_id+"' and rnum <="+start+" and rnum >= "+end;*/
				sql ="select * from (select rownum as rnum, a.* from (select * from kakao_board order by brd_num asc)a where brd_id='"+user_id+
					 "' order by rnum desc) where rnum <= "+start+" and rnum >= "+end;
			}else{
				/*sql = "select * from "+
						"(select rownum as rnum,  brd_idx, brd_num, brd_id, brd_name, brd_content, "+
						"brd_date, brd_file, brd_rcmd, brd_public, brd_ref, brd_lev, brd_seq from " +
						" kakao_board order by brd_num desc) where brd_id <>'"+user_id+"' and brd_public ='true' and rnum <="+start+" and rnum >= "+end;*/
				sql ="select * from (select rownum as rnum, a.* from (select * from kakao_board order by brd_num asc)a where brd_id<>'"+user_id+
						 "' and brd_public='true' order by rnum desc) where rnum <= "+start+" and rnum >= "+end;
			}
			System.out.println("dbSelect() : "+sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				do{
					Board_bean bean = new Board_bean();
					bean.setBrd_idx(rs.getInt("brd_idx"));
					bean.setBrd_num(rs.getInt("brd_num"));
					bean.setBrd_id(rs.getString("brd_id"));
					bean.setBrd_name(rs.getString("brd_name"));
					bean.setBrd_date(rs.getDate("brd_date"));
					bean.setBrd_content(rs.getString("brd_content"));
					bean.setBrd_file(rs.getString("brd_file"));
					bean.setBrd_rcmd(rs.getInt("brd_rcmd"));
					bean.setBrd_public(rs.getString("brd_public"));
					bean.setBrd_ref(rs.getInt("brd_ref"));
					bean.setBrd_lev(rs.getInt("brd_lev"));
					bean.setBrd_seq(rs.getInt("brd_seq"));
					list.add(bean);
				}while(rs.next());
			}
		}catch(Exception ex){ System.out.println("dbSelect()실패 "+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return list;
	}

	//dbDetail
	public Board_bean dbDetail(int idx){
		Board_bean bean = new Board_bean();
		try{
			conn = ds.getConnection();
			sql = "select * from kakao_board where brd_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bean.setBrd_idx(rs.getInt("brd_idx"));
				bean.setBrd_num(rs.getInt("brd_num"));
				bean.setBrd_id(rs.getString("brd_id"));
				bean.setBrd_name(rs.getString("brd_name"));
				bean.setBrd_content(rs.getString("brd_content"));
				bean.setBrd_date(rs.getDate("brd_date"));
				bean.setBrd_file(rs.getString("brd_file"));
				bean.setBrd_rcmd(rs.getInt("brd_rcmd"));
				bean.setBrd_public(rs.getString("brd_public"));
				bean.setBrd_ref(rs.getInt("brd_ref"));
				bean.setBrd_lev(rs.getInt("brd_lev"));
				bean.setBrd_seq(rs.getInt("brd_seq"));

			}
		}catch(Exception ex){ System.out.println("dbDetail"+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return bean;
	}

	//dbCount
	public int dbCount(String user_id, Boolean bool){
		int count =0;
		try{
			conn = ds.getConnection();
			if(bool==true){
				sql="select count(brd_num) as cnt from kakao_board where brd_id = ?";
			}else{
				sql="select count(brd_num) as cnt from kakao_board where brd_id <> ? and brd_public='true'";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("cnt");
			}
		}catch(Exception ex){ System.out.println("dbCount() : "+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return count;
	}

	//dbDelete
	public int dbDelete(String user_id,int idx){
		int OK=0;
		try{
			conn = ds.getConnection();
			sql = "delete from kakao_board where brd_id = ? and brd_idx= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, idx);
			OK = pstmt.executeUpdate();
			
			//-- ** 지울때 댓글테이블 같이 삭제
			sql = "delete from kakao_comment where comment_boardnum="+idx;
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
		}catch(Exception ex){ System.out.println("dbDelete"+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}

	//dbEdit
	public int dbEdit(int idx, Board_bean bean){
		int OK=0;
		try{
			conn = ds.getConnection();
			sql = "update kakao_board set brd_content =?, brd_file =?, brd_public =? where brd_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBrd_content());
			pstmt.setString(2, bean.getBrd_file());
			pstmt.setString(3, bean.getBrd_public());
			pstmt.setInt(4, idx);
			OK = pstmt.executeUpdate();
		}catch(Exception ex){ System.out.println("dbEdit"+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}

	//dbPrevious
	public Board_bean dbPrevious(int idx, String user_id, String flag){
		Board_bean bean = new Board_bean();
		try{
			conn = ds.getConnection();
			while(true){
				if(flag.equals("true")){
					sql = "select * from kakao_board where brd_idx = ? and brd_id = ?";
				}else{
					sql = "select * from kakao_board where brd_public='true' and brd_idx = ? and brd_id <> ?";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setString(2, user_id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bean.setBrd_idx(rs.getInt("brd_idx"));
					bean.setBrd_num(rs.getInt("brd_num"));
					bean.setBrd_id(rs.getString("brd_id"));
					bean.setBrd_name(rs.getString("brd_name"));
					bean.setBrd_content(rs.getString("brd_content"));
					bean.setBrd_date(rs.getDate("brd_date"));
					bean.setBrd_file(rs.getString("brd_file"));
					bean.setBrd_rcmd(rs.getInt("brd_rcmd"));
					bean.setBrd_public(rs.getString("brd_public"));
					bean.setBrd_ref(rs.getInt("brd_ref"));
					bean.setBrd_lev(rs.getInt("brd_lev"));
					bean.setBrd_seq(rs.getInt("brd_seq"));
					break;
				}
				idx--;
			}
		}catch(Exception ex){ System.out.println("dbDetail"+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return bean;
	}

	//dbMinIdx
	public int dbMinIdx(String user_id, String flag){
		int minIdx =0;
		try{
			conn = ds.getConnection();
			if(flag.equals("true")){
				sql = "select min(brd_idx) as min from kakao_board where brd_id = ?";
			}else{
				sql = "select min(brd_idx) as min from kakao_board where brd_id <> ? and brd_public='true'";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				minIdx = rs.getInt("min");
			}
		}catch(Exception ex){ System.out.println("dbMinIdx() : "+ex.toString()); 
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return minIdx;
	}

	//dbNextview
	public Board_bean dbNextview(int idx, String user_id, String flag){
		Board_bean bean = new Board_bean();
		try{
			conn = ds.getConnection();
			while(true){
				if(flag.equals("true")){
					sql = "select * from kakao_board where brd_idx = ? and brd_id = ?";
				}else{
					sql = "select * from kakao_board where brd_public='true' and brd_idx = ? and brd_id <> ?";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setString(2, user_id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bean.setBrd_idx(rs.getInt("brd_idx"));
					bean.setBrd_num(rs.getInt("brd_num"));
					bean.setBrd_id(rs.getString("brd_id"));
					bean.setBrd_name(rs.getString("brd_name"));
					bean.setBrd_content(rs.getString("brd_content"));
					bean.setBrd_date(rs.getDate("brd_date"));
					bean.setBrd_file(rs.getString("brd_file"));
					bean.setBrd_rcmd(rs.getInt("brd_rcmd"));
					bean.setBrd_public(rs.getString("brd_public"));
					bean.setBrd_ref(rs.getInt("brd_ref"));
					bean.setBrd_lev(rs.getInt("brd_lev"));
					bean.setBrd_seq(rs.getInt("brd_seq"));
					break;
				}
				idx++;
			}
		}catch(Exception ex){ System.out.println("dbDetail"+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return bean;
	}

	//dbMaxIdx
	public int dbMaxIdx(String user_id, String flag){
		int maxIdx =0;
		try{
			conn = ds.getConnection();
			if(flag.equals("true")){
				sql = "select max(brd_idx) as max from kakao_board where brd_id = ?";
			}else{
				sql = "select max(brd_idx) as max from kakao_board where brd_id <> ? and brd_public='true'";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				maxIdx = rs.getInt("max");
			}
		}catch(Exception ex){ System.out.println("dbLastIdx() : "+ex.toString()); 
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return maxIdx;
	}

	//dbRecommend
	public int dbRecommend(int idx){

		int OK =0;
		try{
			conn = ds.getConnection();
			int rcmd =0;
			sql ="select brd_rcmd from kakao_board where brd_idx="+idx;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				rcmd = rs.getInt("brd_rcmd")+1;
			}
			sql = "update kakao_board set brd_rcmd = ? where brd_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcmd);
			pstmt.setInt(2, idx);
			OK = pstmt.executeUpdate();
		}catch(Exception ex){ System.out.println("dbRecommend() : "+ex.toString());
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return OK;
	}

	//dbMaxrnum
	public int dbMaxrnum(String user_id, Boolean flag){
		int maxRnum =0;
		try{
			conn = ds.getConnection();
			if(flag==true){
				//sql = "select max(rnum) as max from (select rownum as rnum,  brd_idx, brd_num, brd_id, brd_name, brd_content, brd_date, brd_file, brd_rcmd, brd_public, brd_ref, brd_lev, brd_seq from  kakao_board order by brd_num desc) where brd_id=?";
				sql ="select max(rnum) as max from (select rownum as rnum, a.* from (select * from kakao_board order by brd_num asc)a where brd_id= ? order by rnum desc) ";
			}else{
				//sql = "select max(rnum) as max from (select rownum as rnum,  brd_idx, brd_num, brd_id, brd_name, brd_content, brd_date, brd_file, brd_rcmd, brd_public, brd_ref, brd_lev, brd_seq from  kakao_board order by brd_num desc) where brd_id<>? and brd_public='true'";
				sql ="select max(rnum) as max from (select rownum as rnum, a.* from (select * from kakao_board order by brd_num asc)a where brd_id <> ? and brd_public='true' order by rnum desc)";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				maxRnum = rs.getInt("max");
			}
		}catch(Exception ex){ System.out.println("dbMaxrnum() : "+ex.toString()); 
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return maxRnum;
	}

	//dbCommentLoad
	public List dbCommentLoad(int idx){

		List c_list = new ArrayList();
		try{
			conn = ds.getConnection();
			/*
			comment_idx number not null, 
			comment_boardnum number not null,
			comment_id varchar2(20) not null,        		   
			comment_content varchar2(1000) not null,    
			comment_date date not null,     		     
			comment_RE_REF number not null, 		   
			comment_RE_LEV number, 			     
			comment_RE_SEQ number, 			    
			comment_rename varchar2(10),
			 */
			sql = "select c.*, u.user_name as uname from kakao_comment c, kakao_user u " +
					"where u.user_id = c.comment_id and c.comment_boardnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while ( rs.next()){
				Comment_Bean c_bean = new Comment_Bean();
				c_bean.setComment_idx(rs.getInt("comment_idx"));
				c_bean.setComment_boardnum(rs.getInt("comment_boardnum"));
				c_bean.setComment_name(rs.getString("uname"));
				c_bean.setComment_content(rs.getString("comment_content"));
				c_bean.setComment_date(rs.getDate("comment_date"));
				c_bean.setComment_RE_LEV(rs.getInt("comment_RE_REF"));
				c_bean.setComment_RE_LEV(rs.getInt("comment_RE_LEV"));
				c_bean.setComment_RE_SEQ(rs.getInt("comment_RE_SEQ"));
				c_list.add(c_bean);
			}
		}catch(Exception e){
			System.out.println("comment err" + e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}

		return c_list;
	}
	
	public int Msg_YN(String user_id){
		int result = 0;
		
		try{
			conn = ds.getConnection();
			sql = "SELECT count(*) as cnt FROM kakao_message WHERE msg_receiveID='"+user_id+"' and msg_check='N'";
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);

			if( rs.next() ){
				result = rs.getInt("cnt");
			}
		}catch(Exception e){
			System.out.println("Msg_YN"+e);
		}finally{
			if(rs!=null)try{ rs.close(); }catch(Exception ex) { }
			if(stmt!=null)try{ stmt.close(); }catch(Exception ex) { }
			if(conn!=null)try{ conn.close(); }catch(Exception ex) { }
			if(pstmt!=null)try{ pstmt.close(); }catch(Exception ex) { }
		}
		return result;
	}
}
