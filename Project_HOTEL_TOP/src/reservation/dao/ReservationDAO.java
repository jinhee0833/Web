package reservation.dao;

import java.util.ArrayList;
import java.util.List;

import reservation.vo.ReservationVO;
import room.vo.RoomVO;
import db.util.DBUtil;

public class ReservationDAO {
	int ok;
	public List<RoomVO> getUsableRooms(String inDate, String outDate,String type, int numberOfMember){
		List<RoomVO> usableRooms = new ArrayList<RoomVO>();
		System.out.println("in getUsableRooms");

		String sql = "select roomid,room1,roominfo1 "
						+ "from room "
						+ "where roomid not in (select distinct(revRoomID) "
												+ "from reservation "
												+ "where( ('"+inDate+"' >= revIn and '"+inDate+"'< revOut) "
												+ "or ('"+inDate+"' <= revIn and '"+outDate+"'>= revOut) "
												+ "or ('"+outDate+"'> revIn and '"+outDate+"' <= revOut)) )"
												+ "and roomType like '%"+type+"%' and roomCap >= "+numberOfMember
												+ " order by roomid";
		System.out.println("search room sql : " + sql);
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				while(RS.next()){
					RoomVO rvo = new RoomVO();
					
					rvo.setRoomID(RS.getString("roomid"));
					rvo.setRoom1(RS.getString("room1"));
					rvo.setRoomInfo1(RS.getString("roominfo1"));
					
					usableRooms.add(rvo);
					System.out.println(usableRooms.size());
					System.out.println("usableRooms : " +usableRooms.toString());
				}// end while
			}// exeSQL
		}.execute();
		
		return usableRooms;
		
	}// end getUsableRooms
	
	public void insertReservation(ReservationVO revo){
		String sql = "insert into reservation values(revID.nextval,?,?,?,?,?,?,?,?,sysdate)";
		System.out.println(sql);
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1,revo.getRevMemberID() );
				PST.setString(2, revo.getRevRoomID());
				PST.setInt(3, revo.getRevTotalCost());
				PST.setInt(4, revo.getRevNumberGuest());
				PST.setString(5, revo.getRevIn());
				PST.setString(6, revo.getRevOut());
				PST.setInt(7, revo.getRevTerm());
				PST.setString(8, revo.getRevComment());
				PST.executeUpdate();
				System.out.println("revo : " + revo.toString());
			}
		}.execute();
		
		
	}//end method
	
	public int deleteReservation(String Id){// room delete
		String sql = "delete from reservation where revID ="+Id;
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
			ok = PST.executeUpdate();

			}
			
		}.execute();
		return ok;
		
	}/// delete end
	
	public List<ReservationVO> getReservationList(){
		List<ReservationVO> reList = new ArrayList<ReservationVO>();
		
		String sql = "select * from reservation";
		
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				
				while(RS.next()== true){
					ReservationVO revo = new ReservationVO();
					
					revo.setRevID(RS.getInt("revID"));
					revo.setRevMemberID(RS.getString("revMemberID"));
					revo.setRevRoomID(RS.getString("revRoomID"));
					revo.setRevTotalCost(RS.getInt("revTotalCost"));
					revo.setRevNumberGuest(RS.getInt("revNumberGuest"));
					revo.setRevIn(RS.getString("revIn"));
					revo.setRevOut(RS.getString("revOut"));
					revo.setRevTerm(RS.getInt("revTerm"));
					revo.setRevComment(RS.getString("revComment"));
					revo.setRevDate(RS.getDate("revDate"));
					
					reList.add(revo);
				}// end while
			}
		}.execute();
		return reList;
	}// end getReservationList
	
	public List<ReservationVO> getMyReservationList(String id){
		List<ReservationVO> reList = new ArrayList<ReservationVO>();
		
		String sql = "select * from reservation where REVMEMBERID = '" + id + "'";
		System.out.println("sql : my reservation " + sql);
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				
				while(RS.next()== true){
					ReservationVO revo = new ReservationVO();
					
					revo.setRevID(RS.getInt("revID"));
					revo.setRevMemberID(RS.getString("revMemberID"));
					revo.setRevRoomID(RS.getString("revRoomID"));
					revo.setRevTotalCost(RS.getInt("revTotalCost"));
					revo.setRevNumberGuest(RS.getInt("revNumberGuest"));
					revo.setRevIn(RS.getString("revIn"));
					revo.setRevOut(RS.getString("revOut"));
					revo.setRevTerm(RS.getInt("revTerm"));
					revo.setRevComment(RS.getString("revComment"));
					revo.setRevDate(RS.getDate("revDate"));
					
					reList.add(revo);
				}// end while
			}
		}.execute();
		return reList;
	}// end getReservationList
//
//	public int updateReservation(RoomVO bean){// update
//	
//		String sql = "update reservation set roomType = ? ,roomCost =?  ,roomCap = ? , room1 =?"
//				+ ", room2 =?, room3 =?, room4 =?,roominfo1= ?, roominfo2= ?, roominfo3= ? where roomID = "+ bean.getRoomID();
//		
//		new DBUtil() {
//		
//			@Override
//			protected void exeSQL() throws Exception {
//				PST = CN.prepareStatement(sql);
//				PST.setString(1, bean.getRoomType());
//				PST.setInt(2, bean.getRoomCost());
//				PST.setInt(3, bean.getRoomCap());
//				PST.setString(4, bean.getRoom1());
//				PST.setString(5, bean.getRoom2());
//				PST.setString(6, bean.getRoom3());
//				PST.setString(7, bean.getRoom4());
//				PST.setString(8, bean.getRoomInfo1());
//				PST.setString(9, bean.getRoomInfo2());
//				PST.setString(10, bean.getRoomInfo3());
//				System.out.println("line 96"+sql);
//				ok = PST.executeUpdate();
//				System.out.println("line 98"+sql);
//			}
//		}.execute();
//		System.out.println(sql);
//		return ok;
//	}//update end
	
}// end class

