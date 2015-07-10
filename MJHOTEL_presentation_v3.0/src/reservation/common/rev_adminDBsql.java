package reservation.common;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import reservation.common.revDBbean;
import reservation.common.roomDBbean;

public class rev_adminDBsql {
	private Connection CN ;
	private Statement ST ;
	private PreparedStatement PST ;
	private ResultSet RS ;
	
	public rev_adminDBsql(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
			CN = DriverManager.getConnection(url, "system", "oracle") ;
		}catch(Exception ex){System.out.println("DB : "+ex.toString());}
	}//con


	public List roomAll(){
		List roomAll = new ArrayList() ;
		String sql = "select roomID, roomType from room order by roomCost asc, roomID asc" ;
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()){
				roomDBbean bean = new roomDBbean() ;
				bean.setRoomID(RS.getInt("roomID")) ;
				bean.setRoomType(RS.getString("roomType")) ;
				roomAll.add(bean);
			}//while
		}catch(Exception ex){System.out.println("roomAll : "+ex.toString());}
		return roomAll ;
	}//roomAll
	
	public List revAll(String start, String end){
		List revAll = new ArrayList();
		String sql = "select revRoomID, revIn, revOut, revTerm from reservation where " ;
		sql = sql + "(revIn>='"+start+"' and revIn<='"+end+"') or (revIn<='"+start+"' and revOut>='"+start+"') order by revIn asc" ;
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()){
				revDBbean bean = new revDBbean() ;
				bean.setRevRoomID(RS.getInt("revRoomID")) ;
				bean.setRevIn(RS.getString("revIn")) ;
				bean.setRevOut(RS.getString("revOut")) ;
				bean.setRevTerm(RS.getInt("revTerm")) ;
				
				revAll.add(bean);			
			}//while			
		}catch(Exception ex){System.out.println("roomAll"+ex.toString());}		
		return revAll ;
	}//
	
	public List revBoard(String sort, String order){
		List revBoard = new ArrayList() ;
		String sql = "select * from reservation, login, room where reservation.revMember = login.id and reservation.revRoomID = room.roomID" ;
		String sql2 = " order by "+order+" "+sort ;
		try{			
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql+sql2) ;
			while(RS.next()){
				revDBbean bean = new revDBbean() ;
				bean.setRevId(RS.getInt("revID")) ;
				bean.setRevMember(RS.getString("revMember")) ;
				bean.setRevRoomID(RS.getInt("revRoomID")) ;
				bean.setRevCost(RS.getInt("revCost")) ;
				bean.setRevCap(RS.getInt("revCap")) ;
				bean.setRevIn(RS.getString("revIn")) ;
				bean.setRevOut(RS.getString("revOut")) ;
				bean.setRevTerm(RS.getInt("revTerm")) ;
				bean.setRevDate(RS.getDate("revDate")) ;
				bean.setRevName(RS.getString("name")) ;
				bean.setRevRoomType(RS.getString("roomType")) ;
				
				revBoard.add(bean) ;
			}//while
		}catch(Exception ex){System.out.println("revBoard() : "+ex.toString());}
		
		return revBoard;
	}//revBoard
	
}//class
