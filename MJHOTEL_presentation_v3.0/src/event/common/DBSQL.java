package event.common;

import java.sql.*;
import java.util.*;//List ?占쎌럩逾ε뜝?占쎌댉?占쎌럥?占썲뜝?占쎈턄?占쎌럥占�?
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import event.common.DBbean;


public class DBSQL {
	private int num;
	private String filename;
	private String th_filename;
	private String name;
	private String passwd;
	private String title;
	private String content;
	private java.util.Date e_start;
	private java.util.Date e_end;
	private int ref;
	private int indent;
	private int step;
	private java.util.Date time;
	private int hit;
	private int total;

	private Connection CN ; 
	private Statement ST ; 
	private PreparedStatement PST ; 
	private ResultSet RS ;
	private String sql ;
	static DataSource ds;
	
	public DBSQL() {
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/snow");
		}catch(Exception e){
			System.out.println("lookup 실패 : " + e.getMessage());
			System.out.println("DB 연결실패 " );
		}
	}//end
	
	public void getConnection() throws SQLException{
		CN=ds.getConnection();
		System.out.println("!!!!! DB연결성공 !!!!!");
	}
	
	public List dbSelectNow(int start, int end){
		List LTnow = new ArrayList() ;			
		try{
			getConnection();
			sql = "select * from (select rownum as rn, e.num, e.th_filename, e.title, e.e_start, e.e_end, e.time, e.hit,"; 
		    sql+= "(select count(*) from eventreply where num=e.num) as c_count from event e where e_end >= sysdate order by num desc) "; 
		    sql+= "where rn between "+start+" and "+end;
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()==true){
				DBbean bean =new DBbean() ;
					bean.setRownum(RS.getInt("rn"));
					bean.setNum(RS.getInt("num"));
					bean.setTh_filename(RS.getString("th_filename"));
					bean.setTitle(RS.getString("title"));
					bean.setE_start(RS.getDate("e_start"));
					bean.setE_end(RS.getDate("e_end"));
					bean.setTime(RS.getDate("time"));
					bean.setHit(RS.getInt("hit") ) ;
					bean.setC_count(RS.getInt("c_count"));
				LTnow.add(bean) ;	
			}//while				
		}catch(Exception ex){System.out.println(ex.toString());}
		finally{dbclose();}
		return LTnow ;	
	}//dbSelect() end	

	public List dbSelectPast(int start, int end){
		List LTpast = new ArrayList() ;			
		try{
			getConnection();
			sql = "select * from (select rownum as rn, e.num, e.th_filename, e.title, e.e_start, e.e_end, e.time, e.hit,"; 
		    sql+= "(select count(*) from eventreply where num=e.num) as c_count from event e where e_end < sysdate order by num desc) "; 
		    sql+= "where rn between "+start+" and "+end;
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()==true){
				DBbean bean =new DBbean() ;
					bean.setRownum(RS.getInt("rn"));
					bean.setNum(RS.getInt("num"));
					bean.setTh_filename(RS.getString("th_filename"));
					bean.setTitle(RS.getString("title"));
					bean.setE_start(RS.getDate("e_start"));
					bean.setE_end(RS.getDate("e_end"));
					bean.setTime(RS.getDate("time"));
					bean.setHit(RS.getInt("hit") ) ;
					bean.setC_count(RS.getInt("c_count"));
				LTpast.add(bean) ;	
			}//while				
		}catch(Exception ex){System.out.println(ex.toString());}
		finally{dbclose();}
		return LTpast ;	
	}//dbSelect() end
	
	public int dbTotalNow() {
		try{
			getConnection();
			sql="select count(*) as cnt from event where e_end >= sysdate";
			ST=CN.createStatement();
		 	RS=ST.executeQuery(sql);
		    if(RS.next()){ 
				total=RS.getInt("cnt");}		
		}catch(Exception ex){}
		finally{dbclose();}
		return total;
	}//dbTotal() end

	public int dbTotalPast() {
		try{
			getConnection();
			sql="select count(*) as cnt from event where e_end < sysdate";
			ST=CN.createStatement();
		 	RS=ST.executeQuery(sql);
		    if(RS.next()){ 
				total=RS.getInt("cnt");}		
		}catch(Exception ex){}
		finally{dbclose();}
		return total;
	}//dbTotal() end
	
	public int dbInsert(MultipartRequest mr)throws SQLException{
		int ok=0;
		try{
			getConnection();
			sql="insert into event values(event_num_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?)";
			PST = CN.prepareStatement(sql);
				PST.setString(1, mr.getFilesystemName("filename"));
				PST.setString(2, mr.getFilesystemName("th_filename"));
				PST.setString(3, mr.getParameter("title"));
				PST.setString(4, mr.getParameter("content"));
				PST.setString(5, mr.getParameter("e_start"));
				PST.setString(6, mr.getParameter("e_end"));
				PST.setInt(7, 0);
			ok = PST.executeUpdate();		
		}finally{dbclose();}
		return ok;
	}//end

	public List dbDetail(int num){
		List detail = new ArrayList() ;			
		try{
			getConnection();
			sql = "select * from event where num="+num ;
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()==true){
				DBbean bean =new DBbean() ;
				int newCount = RS.getInt("hit")+1 ;
				String sql2 = "update event set hit="+newCount+" where num = "+ num ;			
					bean.setNum(RS.getInt("num"));			
					bean.setTitle(RS.getString("title") ) ;						
					bean.setE_start(RS.getDate("e_start")) ;
					bean.setE_end(RS.getDate("e_end")) ;
					bean.setTime(RS.getDate("time"));
					bean.setFilename(RS.getString("filename") ) ;
					bean.setTh_filename(RS.getString("th_filename") ) ;					
					bean.setContent(RS.getString("content") ) ;
					ST.executeUpdate(sql2) ;
					bean.setHit(newCount) ;
				detail.add(bean) ;				
			}//while						
		}catch(Exception ex){System.out.println(ex.toString());}
		finally{dbclose();}
		return detail ;	
	}//dbDetail
	
	public int dbDelete(String num) throws SQLException {
		int del=0;
		try{
			getConnection();
			sql = "delete from event where num = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			del = PST.executeUpdate();			
		}finally{dbclose();}
		return del;
	}//end
	
	public void dbclose(){
		try{
			if(RS != null){try{RS.close();}catch(Exception ex){}}
			if(PST != null){try{PST.close();}catch(Exception ex){}}
			if(CN != null){try{CN.close();}catch(Exception ex){}}
		}catch(Exception ex){}
	}//dbclose() end

}//class END