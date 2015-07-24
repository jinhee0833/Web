package room.vo;
/*
 * create table room(
roomID varchar2(5) primary key,
roomType varchar2(10),
roomCost number(8),
roomCap number,
room1 varchar2(20),
room2 varchar2(20),
room3 varchar2(20),
room4 varchar2(20),
roomInfo1 varchar2(2000),
roomInfo2 varchar2(2000),
roomInfo3 varchar2(2000)
);
 */
public class RoomVO {

	private String roomID;
	private String roomType;
	private int roomCost;
	private int roomCap;
	private String room1;
	private String room2;
	private String room3;
	private String room4;
	private String roomInfo1;
	private String roomInfo2;
	private String roomInfo3;
	
	
	
	public String getRoomID() {
		return roomID;
	}
	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRoomCost() {
		return roomCost;
	}
	public void setRoomCost(int roomCost) {
		this.roomCost = roomCost;
	}
	public int getRoomCap() {
		return roomCap;
	}
	public void setRoomCap(int roomCap) {
		this.roomCap = roomCap;
	}
	public String getRoom1() {
		return room1;
	}
	public void setRoom1(String room1) {
		this.room1 = room1;
	}
	public String getRoom2() {
		return room2;
	}
	public void setRoom2(String room2) {
		this.room2 = room2;
	}
	public String getRoom3() {
		return room3;
	}
	public void setRoom3(String room3) {
		this.room3 = room3;
	}
	
	
	public String getRoom4() {
		return room4;
	}
	public void setRoom4(String room4) {
		this.room4 = room4;
	}
	public String getRoomInfo1() {
		return roomInfo1;
	}
	public void setRoomInfo1(String roomInfo1) {
		this.roomInfo1 = roomInfo1;
	}
	public String getRoomInfo2() {
		return roomInfo2;
	}
	public void setRoomInfo2(String roomInfo2) {
		this.roomInfo2 = roomInfo2;
	}
	public String getRoomInfo3() {
		return roomInfo3;
	}
	public void setRoomInfo3(String roomInfo3) {
		this.roomInfo3 = roomInfo3;
	}
	@Override
	public String toString() {
		return "RoomVO [roomID=" + roomID + ", roomType=" + roomType
				+ ", roomCost=" + roomCost + ", roomCap=" + roomCap
				+ ", room1=" + room1 + ", room2=" + room2
				+ ", room3=" + room3 + ", room4=" + room4
				+ ", roomInfo1=" + roomInfo1 + ", roomInfo2=" + roomInfo2
				+ ", roomInfo3=" + roomInfo3 + "]";
	}

	
	
}
