package net.hb.common;

public class DBReservationBean {

	private int code;
	private int roomPackage;
	private String userId;
	private java.util.Date chkIn;
	private java.util.Date chkOut;
	private int price;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public java.util.Date getChkIn() {
		return chkIn;
	}
	public void setChkIn(java.util.Date chkin) {
		this.chkIn = chkin;
	}
	public java.util.Date getChkOut() {
		return chkOut;
	}
	public void setChkOut(java.util.Date chkOut) {
		this.chkOut = chkOut;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRoomPackage() {
		return roomPackage;
	}
	public void setRoomPackage(int roomPackage) {
		this.roomPackage = roomPackage;
	}
}
