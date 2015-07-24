package room.vo;

import room.dao.RoomDAO;

public class TestRoomMain {

	public static void main(String[] args) {
		RoomDAO rdao = new RoomDAO();
		
		
		rdao.getRoomList();
		
		
	}
}
