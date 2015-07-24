package room.dao;

import java.util.ArrayList;
import java.util.List;

import db.util.DBUtil;
import room.vo.RoomVO;

public class RoomDAO {
int ok;
//	private static RoomDAO instance = new RoomDAO();
//	
//	public static RoomDAO getInstance(){
//		return instance;
//	}
//	
	
	public void createRoom(RoomVO vo){ // new registration insert
		String sql = "insert into room values(?,?,?,?,?,?,?,?,?,?,?)";
		new DBUtil() {
			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				PST = CN.prepareStatement(sql);
				PST.setString(1, vo.getRoomID());
				PST.setString(2, vo.getRoomType());
				PST.setInt(3, vo.getRoomCost());
				PST.setInt(4, vo.getRoomCap());
				PST.setString(5, vo.getRoom1());
				PST.setString(6, vo.getRoom2());
				PST.setString(7, vo.getRoom3());
				PST.setString(8, vo.getRoom4());
				PST.setString(9, vo.getRoomInfo1());
				PST.setString(10, vo.getRoomInfo2());
				PST.setString(11, vo.getRoomInfo3());
				PST.executeUpdate();
			} // end exeSQL
		}.execute();
	}// end dbInsert
	
	public List<RoomVO> getRoomList(String type){// select
		List<RoomVO> roomList = new ArrayList<RoomVO>();
		String sql = "select * from room where roomType = '" + type+ "'";
		System.out.println("getroom  list sql : " + sql);
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				
				while(RS.next()){
					RoomVO rvo = new RoomVO();
					
					rvo.setRoomID(RS.getString("roomID"));
					rvo.setRoomType(RS.getString("roomType"));
					rvo.setRoomCost(RS.getInt("roomCost"));
					rvo.setRoomCap(RS.getInt("roomCap"));
					rvo.setRoom1(RS.getString("room1"));
					rvo.setRoom2(RS.getString("room2"));
					rvo.setRoom3(RS.getString("room3"));
					rvo.setRoom4(RS.getString("room4"));
					rvo.setRoomInfo1(RS.getString("roomInfo1"));
					rvo.setRoomInfo2(RS.getString("roomInfo2"));
					rvo.setRoomInfo3(RS.getString("roomInfo3"));
					
					roomList.add(rvo);
				}// end while
			}// end exeSQL
		}.execute();
		
		
	
		System.out.println(roomList.toString()+"show me the yours");
		return roomList;
	} // end getRoomList
	
	public int updateRoom(RoomVO bean){// update
		System.out.println("����?"+bean.getRoomID());
		String sql = "update room set roomType = ? ,roomCost =?  ,roomCap = ? , room1 =?"
				+ ", room2 =?, room3 =?, room4 =?,roominfo1= ?, roominfo2= ?, roominfo3= ? where roomID = "+ bean.getRoomID();
		
		new DBUtil() {
		
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, bean.getRoomType());
				PST.setInt(2, bean.getRoomCost());
				PST.setInt(3, bean.getRoomCap());
				PST.setString(4, bean.getRoom1());
				PST.setString(5, bean.getRoom2());
				PST.setString(6, bean.getRoom3());
				PST.setString(7, bean.getRoom4());
				PST.setString(8, bean.getRoomInfo1());
				PST.setString(9, bean.getRoomInfo2());
				PST.setString(10, bean.getRoomInfo3());
				System.out.println("line 96"+sql);
				ok = PST.executeUpdate();
				System.out.println("line 98"+sql);
			}
		}.execute();
		System.out.println(sql);
		return ok;
	}//update end
	
	public int deleteRoom(String Id){// room delete
		String sql = "delete from room where roomId ="+Id;
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				ok = PST.executeUpdate();

			}
			
		}.execute();
		return ok;
		
	}/// delete end
	
	public RoomVO detailRoom(String Id) {
		RoomVO rvo = new RoomVO();
		 String sql = "select * from Room where roomId ="+ Id;
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				while(RS.next()==true){
					rvo.setRoomID(RS.getString("roomID"));
					rvo.setRoomType(RS.getString("roomType"));
					rvo.setRoomCost(RS.getInt("roomCost"));
					rvo.setRoomCap(RS.getInt("roomCap"));
					rvo.setRoom1(RS.getString("room1"));
					rvo.setRoom2(RS.getString("room2"));
					rvo.setRoom3(RS.getString("room3"));
					rvo.setRoom4(RS.getString("room4"));
					rvo.setRoomInfo1(RS.getString("roomInfo1"));
					rvo.setRoomInfo2(RS.getString("roomInfo2"));
					rvo.setRoomInfo3(RS.getString("roomInfo3"));
						
				}
			}
		}.execute();
		
		return rvo;
	}
	
	public List<RoomVO> getRoomList(){// select
		List<RoomVO> roomList = new ArrayList<RoomVO>();
		String sql = "select * from room order by roomId";
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				
				while(RS.next()){
					RoomVO rvo = new RoomVO();
					
					rvo.setRoomID(RS.getString("roomID"));
					rvo.setRoomType(RS.getString("roomType"));
					rvo.setRoomCost(RS.getInt("roomCost"));
					rvo.setRoomCap(RS.getInt("roomCap"));
					rvo.setRoom1(RS.getString("room1"));
					rvo.setRoom2(RS.getString("room2"));
					rvo.setRoom3(RS.getString("room3"));
					rvo.setRoom4(RS.getString("room4"));
					rvo.setRoomInfo1(RS.getString("roomInfo1"));
					rvo.setRoomInfo2(RS.getString("roomInfo2"));
					rvo.setRoomInfo3(RS.getString("roomInfo3"));
					
					roomList.add(rvo);
				}// end while
			}// end exeSQL
		}.execute();
		return roomList;
	} // end getRoomList
	
}// end class
