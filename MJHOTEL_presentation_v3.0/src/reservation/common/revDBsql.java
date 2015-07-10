package reservation.common;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import reservation.common.revDBbean;
import reservation.common.roomDBbean;

public class revDBsql {

	private Connection CN ; // 
	private Statement ST ; 
	private PreparedStatement PST ; // 
	private ResultSet RS ; 
	private String sql ;

	public revDBsql() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url,"system","oracle");
		}catch(Exception ex){System.out.println("<h1>" + ex.toString()+"</h1>");}
	}//con

	public List revOk(String in, String out){
		List no = new ArrayList() ;
		List ok = new ArrayList() ;
		String sql1 = "select distinct(revRoomID) from reservation where ('"+in+"'>=revIn and '"+in+"'<revOut) or ('"+in+"'<=revIn and '"+out+"'>=revOut) or ('"+out+"'>revIn and '"+out+"'<=revOut)" ;

		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql1) ;
			while(RS.next()==true){
				no.add(RS.getInt("revRoomID")); 
			}//while

			String sql2 ;
			String sql3 = " order by roomID asc" ;
			if(no.size()==0) {
				sql2 = "select roomID from room" ;
			}//if

			else {
				sql2 = "select roomID from room where" ;
				for(int i=0 ; i<no.size() ; i++){
					if(i==0)
					{sql2 = sql2+" roomId !="+String.valueOf(no.get(i)) ;
					}//if
					else {
						sql2 = sql2+" and roomId !="+String.valueOf(no.get(i)) ;
					}//
				}//for
			}//else 

			RS = ST.executeQuery(sql2+sql3) ;

			while(RS.next()==true){
				ok.add(RS.getInt("roomID")); 
			}//while
			System.out.println("예약가능한 방개수 : "+ok.size()) ;	
		}catch(Exception ex){System.out.println("revNo"+ex.toString());}
		return ok ;
	}//revNo

	public List okType(List ok){
		List okType = new ArrayList() ;		
		String sql1 ;
		try{			
			if(ok.size()==0) {
				okType=null ;
				//sql1 = "select distinct(roomType) from room" ;
			}//if

			else {				
				sql1 = "select distinct(roomType),(roomCost) from room  where" ;
				for(int i=0 ; i<ok.size() ; i++){
					if(i==0) {
						sql1 = sql1+" roomID in("+Integer.parseInt(String.valueOf(ok.get(i))) ; 
					}//if
					else {
						sql1 = sql1+", "+Integer.parseInt(String.valueOf(ok.get(i))) ;
					}//else					
				}//for
				sql1=sql1+") order by roomCost" ;
				sql1="select roomType from("+sql1+")";
				RS = ST.executeQuery(sql1) ;
			
				while(RS.next()==true){
					okType.add(RS.getString("roomType")); 
					
				}//while
			}//else 		

		}catch(Exception ex){System.out.println("revOkType : "+ex.toString()) ;}
		return okType ;
	}//oktype


		public roomDBbean revOkAll(String type, List room){	
			roomDBbean bean = new roomDBbean();
		try{ 
			String sql = "select * from room where roomType = '"+type+"' and roomID in(" ;
			String sql2 = "" ;
			for(int i=0 ; i<room.size(); i++) {
				if(i==0){
					sql2 = ""+((Integer)room.get(i)).intValue()+"" ; 
				}//if
				else {
					sql2 = sql2 + ", "+((Integer)room.get(i)).intValue()+"" ;
				}//else			
			}//for
			String sql3 = ")"	;				
			String sql4 = " order by roomUse asc" ;
			RS = ST.executeQuery(sql+sql2+sql3+sql4) ;	
			while(RS.next()){
				bean.setRoomID(RS.getInt("roomID")) ;
				bean.setRoomType(RS.getString("roomType")) ;
				bean.setRoomCost(RS.getInt("roomCost")) ;
				bean.setRoomCap(RS.getInt("roomCap")) ;
				bean.setRoomThumb(RS.getString("roomThumb")) ;
				bean.setRoomUse(RS.getInt("roomUse")) ;
				bean.setRoomInfo1(RS.getString("roomInfo1")) ;
				bean.setRoomInfo2(RS.getString("roomInfo2")) ;
				bean.setRoomInfo3(RS.getString("roomInfo3")) ;
				
				break ;				
			}//while
		}catch(Exception ex){System.out.println("revOkAll : "+ex.toString()) ;}
		return bean ;		
	}//revOkAll

	public int revInsert(revDBbean revdbbean){
		int ok=0;
		try {
			sql="insert into reservation values(revID.nextval,?, ?, ?, ?, '"+revdbbean.getRevIn()+"', '"+revdbbean.getRevOut()+"', ?, sysdate)";
			PST = CN.prepareStatement(sql);
			PST.setString(1, revdbbean.getRevMember());
			PST.setInt(2, revdbbean.getRevRoomID());	
			PST.setInt(3, revdbbean.getRevCost());	
			PST.setInt(4, revdbbean.getRevCap());			
			//PST.setString(5, revdbbean.getRevIn());
			//PST.setString(6, revdbbean.getRevOut());
			PST.setInt(5, revdbbean.getRevTerm());
			System.out.println(1);

			ok = PST.executeUpdate();
			ok=1;
		} catch (Exception ex) {System.out.println("빌어먹을: "+ex.toString());}
		return ok;
	}// end revInsert

	public List<revDBbean> revList(String revMember){
		List<revDBbean> reser_List = new ArrayList<revDBbean>() ;
		
		String sql="select * from reservation where revMember='"+revMember+"'" + "order by revDate desc";
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			System.out.println("쿼리문 실행");
			while(RS.next()==true){
				revDBbean bean = new revDBbean();

				bean.setRevCap(RS.getInt("revCap"));
				bean.setRevCost(RS.getInt("revCost"));
				bean.setRevDate(RS.getDate("revDate"));
				bean.setRevId(RS.getInt("revId"));
				bean.setRevIn(RS.getString("revIn"));
				bean.setRevMember(RS.getString("revMember"));
				bean.setRevOut(RS.getString("revOut"));
				bean.setRevRoomID(RS.getInt("revRoomID"));
				bean.setRevTerm(RS.getInt("revTerm"));
				
				reser_List.add(bean);
				
				
			}// while end

		}catch(Exception ex){System.out.println(ex.toString());}
		return reser_List;
	}//revList end

	public int revDelete (String revID){
		int DelOK=0;
		
		String sql="delete from reservation where revID =" +revID ;
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			DelOK=1;

		}catch(Exception ex){System.out.println(ex.toString());}
		return DelOK;
	}//revDelete end
}//class
