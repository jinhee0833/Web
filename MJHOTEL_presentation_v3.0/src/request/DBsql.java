package request;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import request.DBbean;

public class DBsql {

	private Connection CN ;
	private Statement ST ;
	private PreparedStatement PST ; 
	private ResultSet RS ; 
	private String sql ;
	private int total;
	
	
	public DBsql(){
		//	CN = DB.getConnection() ;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url,"system","oracle");
		}catch(Exception ex){System.out.println("<h1>" + ex.toString()+"</h1>");}
		}//con

	public int dbInsert(DBbean bean){//InsertController.java연결
		int success=0;
		try{
				sql="insert into request values(request_qno_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
				PST = CN.prepareStatement(sql);
					PST.setString(1, bean.getQselect());
					PST.setString(2, bean.getQtitle());
					PST.setString(3, bean.getQname());
					PST.setString(4, bean.getQtel());
					PST.setString(5, bean.getQemail());
					PST.setString(6, bean.getQcontents());
				success = PST.executeUpdate();
				if(success>0){System.out.print("dbInsert(DBbean)저장성공!!!");}
		}catch(Exception ex){System.out.println(ex.toString());}
		return success;
	} //dbInsert(DBbean bean) end 
	
	public List<DBbean> dbSelect(int start, int end, String skey, String sval){//RequestController.java연결
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			String subsql=" where "+skey+" like '%"+sval+"%'";	
			sql="select * from";
			sql+=" (select rownum as rn, qno, qselect, qtitle, qname, qtel, qemail, nalja from";
			sql+=" (select * from request "+subsql+" order by nalja desc ))";
			sql+=" where rn between "+start+" and " + end;
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setRn(RS.getInt("rn"));
				bean.setQno(RS.getInt("qno"));
				bean.setQselect(RS.getString("qselect"));
				bean.setQtitle(RS.getString("qtitle"));
				bean.setQname(RS.getString("qname"));
				bean.setQtel(RS.getString("qtel"));
				bean.setQemail(RS.getString("qemail"));
				bean.setNalja(RS.getDate("nalja"));
				
				LT.add(bean);
			} //while end
		}catch(Exception ex){System.out.println(ex.toString());}
		return LT;
	} //dbSelect() end
	
	public DBbean dbDetail(int data){//DetailController.java연결
		DBbean bean = new DBbean();
		try{
			sql="select * from request where qno="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setQselect(RS.getString("qselect"));
				bean.setQtitle(RS.getString("qtitle"));
				bean.setQname(RS.getString("qname"));
				bean.setQtel(RS.getString("qtel"));
				bean.setQemail(RS.getString("qemail"));
				bean.setQcontents(RS.getString("qcontents"));
				bean.setNalja(RS.getDate("nalja"));
			} //while end
		}catch(Exception ex){}
		return bean;
	} //dbDetail() end
	
	public void dbDelete(int data){//DeleteController.java연결
		try{
			sql="select count(*) as cnt from request where qno=" + data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){total=RS.getInt("cnt");}
			if(total>0){
			sql="delete from request where qno="+data;
			ST=CN.createStatement();
			ST.executeUpdate(sql);			
			System.out.println("\n"+data+"삭제성공");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	public int dbTotal(){
		try{
			sql="select count(*) as cnt from request";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return total;
	} //dbTotal() end 
	
	public int dbTotal(String skey, String sval){
		try{
			sql="select count(*) as cnt from request where "+skey+" like '%"+sval+"%' ";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return total;
	} //dbTotal() end 
	
}//class
