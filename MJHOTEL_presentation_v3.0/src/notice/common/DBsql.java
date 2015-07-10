package notice.common;

import java.sql.*;
import java.util.*;	
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBsql {
	private Connection CN;
	private ResultSet RS;
	private Statement ST;
	private PreparedStatement PST;
	private String sql;
	private int total;

	/////////////////////////////////////////////////////////////////////////////////////
	private int limit = 5; 	//1~10 단위
	private int pageNUM;		//이건 숫자
	private int start;			//시작행번호
	private int end;			//끝행 번호

	public DBsql(){
		CN = DB.getConnection();
	}
	
	public int dbInsert(DBbean bean){
		int suck = 0;
			try{
				sql="insert into notice values(jin.nextval,?,?,sysdate,?)";
				PST = CN.prepareStatement(sql);
					PST.setString(1, bean.getTitle());
					PST.setString(2, bean.getContents());
					PST.setInt(3, 0);
				suck = PST.executeUpdate();
			}catch(Exception ex){ ex.toString();}
		return suck;
	}
	
	public int dbCount(){
		try{
			sql = "select count(*) as cnt from notice";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){ total = RS.getInt("cnt");}
		}catch(Exception ex){ ex.toString(); }
		return total;
	}
	
	public List<DBbean> dbSelect(String pnum){
		List<DBbean> li = new ArrayList<DBbean>();
			try{
				if(pnum == null) pnum="1";
				pageNUM = Integer.parseInt(pnum);
				start = dbCount()-((pageNUM * limit) -1);
				end = dbCount()-((pageNUM-1) * limit);
				System.out.println("notice/common/DBsql.java   List<DBbean> dbSelect(String pnum) ") ;
				System.out.println(" start="+start+", end="+end);
				
				
				sql="select * from (select rownum as rn, num, title, contents, sdate, hit from notice order by num desc) where rn between "+ start +" and " + end ;
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);

					while(RS.next()==true){
						DBbean bean = new DBbean();
							bean.setRownum(RS.getInt("rn"));
							bean.setNum(RS.getInt("num"));
							bean.setTitle(RS.getString("title"));
							bean.setContents(RS.getString("contents"));
							bean.setSdate(RS.getDate("sdate"));
							bean.setHit(RS.getInt("hit"));
							li.add(bean);
					}//while
			}catch(Exception ex){ System.out.println("notice/common/DBsql.java 오류: "+ex.toString()); }
		return li;
	}//dbSelect()
	
	public DBbean dbDetail(int data){
		DBbean bean = new DBbean();
		try{
			sql = "select * from notice where num=" + data;
			
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			
				if(RS.next() == true){	
					int newcount = RS.getInt("hit") + 1 ;
						String sql2="update notice set hit=" + newcount + "where num =" + data;
						//bean.setRownum(RS.getInt("rn"));
						bean.setNum(RS.getInt("num"));
						bean.setTitle(RS.getString("title"));
						bean.setContents(RS.getString("contents"));
						bean.setSdate(RS.getDate("sdate"));
						bean.setHit(RS.getInt("hit"));
						ST.executeUpdate(sql2);
				}//while end
			}catch(Exception ex){ ex.toString(); }
		return bean;
	}//dbDetail() end
	
	public void dbDelete(int data){
		try{
			sql = "delete from notice where num=" + data;
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		}
		catch(Exception ex){ ex.toString(); }
	}//dbDelete() end
	
	public void dbEditPre(String data){
		DBbean bean = new DBbean();
		try{
			sql = "update * from notice where num=" + data;
			
			ST = CN.createStatement();
			ST.executeUpdate(sql);
			
			bean.setNum(RS.getInt("num"));
			bean.setTitle(RS.getString("title"));
			bean.setContents(RS.getString("contents"));
			bean.setSdate(RS.getDate("sdate"));
			bean.setHit(RS.getInt("hit"));
			
		}catch(Exception ex){ ex.toString(); }
	}
	
	public int dbEdit(DBbean bean){
		int success = 0;
		try{
			sql="update notice set title=?, contents=? where num=?";

			PST = CN.prepareStatement(sql);
				PST.setString(1, bean.getTitle());
				PST.setString(2, bean.getContents());
				PST.setInt(3, bean.getNum());
			success = PST.executeUpdate();
			if(success > 0)
				System.out.println("수정 성공!!");
		}catch(Exception ex){ ex.toString(); }
		return success;
	}//dbEdit() end
	
}//DBsql end
