package guest.common;

import java.sql.*;
import java.util.*;//List 인터페이스
import java.io.*;

//밑에 3개가 세트로 구성됨.
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBSQL {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST; //정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //쿼리문기억
	private int total; //레코드갯수

	public DBSQL(){ //생성자에서 DB연결
		//CN=DB.getConnection();
		//META-INF/context.xml문서 리소스 name서비스
		try{
			CN= DB.getConnection();
		}catch(Exception ex){}
	} //end
	
	public int dbInsert(DBbean bean){//InsertController.java연결
		//Web0807플젝 guestSave.jsp DBbean bean=>int data1, String data2, String data3, int data4
		int success=0;
		try{
				sql="insert into login values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PST = CN.prepareStatement(sql);//PST명령어 준비, sql쿼리문까지 미리 컴파일
				PST.setString(1, bean.getId());// (1, data1)
				PST.setString(2, bean.getPw());// (2, data2)
				PST.setString(3, bean.getName());// (3, data3)
				PST.setInt(4, bean.getGender());// (4, data4)
				PST.setString(5, bean.getBirth());// (3, data3)
				PST.setString(6, bean.getAddr());// (3, data3)
				PST.setString(7, bean.getEmail());// (3, data3)
				PST.setString(8, bean.getTel());// (3, data3)
				PST.setInt(9, bean.getMem());// (3, data3)
					
				success = PST.executeUpdate();//진짜저장처리메소드 =>단독처리 에러발생
				if(success>0){System.out.print("dbInsert(DBbean)저장성공!!!");}
		}catch(Exception ex){System.out.print("dbInsert(DBbean)저장실패!!!");}
		return success;
	} //dbInsert(DBbean bean) end 
	
	public int dbSearch(String ID, String PW){
		int count = 0;
		try{
			String sql = "select * from login where ID='"+ID+"'";
			ST= CN.createStatement();
			RS= ST.executeQuery(sql);
			if(RS.next()==true) {
				if(RS.getString("ID").equals(ID) && RS.getString("PW").equals(PW)){ 
					count=1;}
			}
		}catch(Exception ex){ex.toString();}
		return count;
	}//dbSerch(int ID) end
	
	/*
	public List<DBbean> dbSelect(int start, int end, String skey, String sval){//ListController.java연결
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			String subsql=" where "+skey+" like '%"+sval+"%'";	
			sql="select * from";
			sql+=" (select rownum as rn, sabun, name, nalja, title, pay from ";
			sql+=" (select * from guest "+subsql+" order by nalja desc ))";
			sql+=" where rn between "+start+" and " + end;
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setRn(RS.getInt("rn"));
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setPay(RS.getInt("pay"));
				LT.add(bean);
				System.out.println("dd");
			} //while end
		}catch(Exception ex){System.out.println("dbSelect(스타트 앤드) : " + ex.toString());}
		return LT;
	} //dbSelect() end
	
	public DBbean dbDetail(String data){//DetailController.java연결
		DBbean bean = new DBbean();
		try{
			sql="select * from guest where sabun="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setPay(RS.getInt("pay"));
			} //while end
		}catch(Exception ex){}
		return bean;
	} //dbDetail() end
	
	public void dbDelete(String data){//DetailController.java연결
		try{
			sql="select count(*) as cnt from guest where sabun=" + data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){total=RS.getInt("cnt");}
			if(total>0){
			sql="delete from guest where sabun="+data;
			ST=CN.createStatement();//명령어생성
			ST.executeUpdate(sql);//진짜 삭제처리			
			System.out.println("\n"+data+"삭제성공");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	public DBbean dbEditPre(String data){//EditProController.java연결
		DBbean bean = new DBbean();
		try{
			sql="select * from guest where sabun="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setPay(RS.getInt("pay"));
			} //while end
		}catch(Exception ex){System.out.println(ex.toString());}
		return bean;
	} //dbEditPro() end	
	
	public int dbEdit(DBbean bean){//EditProController.java연결
		int success=0;
		try{	

			sql="update guest set name=?, title=?, pay=? where sabun=? ";//속도를 빠르게 하기 위해서...
			PST=CN.prepareStatement(sql);
				PST.setString(1, bean.getName());
				PST.setString(2, bean.getTitle());
				PST.setInt(3, bean.getPay());
				PST.setInt(4, bean.getSabun());
			success = PST.executeUpdate();//괄호안에 매개인자 sql을 다시 넣으면 값은 ?로 됨.
			if(success>0){System.out.println("<h1>수정성공!!!</h1>");}
		}catch(Exception ex){System.out.println("수정실패"+ex.toString());}
		return success;
	} //dbEdit() end	

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	public int dbTotal(){
		try{
			sql="select count(*) as cnt from guest";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
				System.out.println(total);
			}
		}catch(Exception ex){ }
		return total;
	} //dbTotal() end 
	
	public int dbTotal(String skey, String sval){
		try{
			sql="select count(*) as cnt from guest where "+skey+" like '%"+sval+"%' ";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
				System.out.println(total);
			}
		}catch(Exception ex){ }
		return total;
	} //dbTotal() end 
	*/

} //class END
