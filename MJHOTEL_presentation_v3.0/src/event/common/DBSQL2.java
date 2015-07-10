package event.common;

import java.sql.*;
import java.util.*;//List 인터페이스
import java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import event.common.DBbean2;


public class DBSQL2 {
	private int r_num;
	private String r_name;
	private String r_content;
	private String r_passwd;
	private java.util.Date r_sdate;

	private Connection CN ; 
	private Statement ST ; 
	private PreparedStatement PST ; 
	private ResultSet RS ;
	private String sql ;
	static DataSource ds;
	
	public DBSQL2() {
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/snow");
		}catch(Exception e){
			System.out.println("lookup실패 : " + e.getMessage());
			System.out.println("DB연결실패 " );
		}
	}//end
	
	public void getConnection() throws SQLException{
		CN=ds.getConnection();
		System.out.println("!!!!! DB연결성공 !!!!!");
	}
	
	public ArrayList<DBbean2> select(){
		ArrayList list = new ArrayList();
		try{
			getConnection();
			sql = "select * from eventreply order by r_num desc";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean2 bean2 = new DBbean2();
				bean2.setR_num(RS.getInt("r_num"));
				bean2.setNum(RS.getInt("num"));
				bean2.setR_name(RS.getString("r_name"));
				bean2.setR_content(RS.getString("r_content"));
				bean2.setR_passwd(RS.getString("r_passwd"));
				bean2.setR_sdate(RS.getDate("r_sdate"));
				list.add(bean2);
			}//while end
			}catch(Exception ex){System.out.println(ex.toString());}
			finally{dbclose();}
			return list;
	}//select() end
	
	public int insert(DBbean2 bean2){
		int result = 0;
		try{
			getConnection();
			sql = "insert into eventreply values(eventreply_r_num_seq.nextval,?,?,?,?,sysdate)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, bean2.getNum());
			PST.setString(2, bean2.getR_name());
			PST.setString(3, bean2.getR_content());
			PST.setString(4, bean2.getR_passwd());
			result = PST.executeUpdate();
			if(result>0){ System.out.println("insert(DBbean2)저장성공!!!"); }
		}catch(Exception ex){System.out.println("insert(DBbean2)저장실패!!!");}
		finally{dbclose();}
		return result;
	}//insert() end
	
	public int delete(DBbean2 bean2) throws SQLException{
		int result = 0;
		try{
			getConnection();
			sql = "delete from eventreply where r_num = ? and r_passwd = ?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, bean2.getR_num());
			PST.setString(2, bean2.getR_passwd());
			result = PST.executeUpdate();		
		}catch(Exception ex){}
		finally{dbclose();}
		return result;
	}//delete() end
	
	public void dbclose(){
		try{
			if(RS != null){try{RS.close();}catch(Exception ex){}}
			if(PST != null){try{PST.close();}catch(Exception ex){}}
			if(CN != null){try{CN.close();}catch(Exception ex){}}
		}catch(Exception ex){}
	}//dbclose() end	
	
}//class END