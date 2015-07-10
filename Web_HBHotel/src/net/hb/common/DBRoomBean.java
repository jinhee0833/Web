package net.hb.common;

public class DBRoomBean {

	private int roomPackageCount;
	
	private String mroom;
	private java.util.Date min;
	private java.util.Date mout; 
	private String mcode;
	public String getMroom() {
		return mroom;
	}
	public void setMroom(String mroom) {
		this.mroom = mroom;
	}
	public java.util.Date getMin() {
		return min;
	}
	public void setMin(java.util.Date min) {
		this.min = min;
	}
	public java.util.Date getMout() {
		return mout;
	}
	public void setMout(java.util.Date mout) {
		this.mout = mout;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	
	public int getRoomPackageCount() {
		return roomPackageCount;
	}
	public void setRoomPackageCount(int roomPackage) {
		this.roomPackageCount = roomPackage;
	}
}
