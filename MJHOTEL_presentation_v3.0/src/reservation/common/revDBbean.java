package reservation.common;

import java.util.Date;

public class revDBbean {

public int getRevId() {
		return revId;
	}
	public void setRevId(int revId) {
		this.revId = revId;
	}
	public String getRevMember() {
		return revMember;
	}
	public void setRevMember(String revMember) {
		this.revMember = revMember;
	}
	public int getRevRoomID() {
		return revRoomID;
	}
	public void setRevRoomID(int revRoomID) {
		this.revRoomID = revRoomID;
	}
	public int getRevCost() {
		return revCost;
	}
	public void setRevCost(int revCost) {
		this.revCost = revCost;
	}
	public int getRevCap() {
		return revCap;
	}
	public void setRevCap(int revCap) {
		this.revCap = revCap;
	}
	public String getRevIn() {
		return revIn;
	}
	public void setRevIn(String revIn) {
		this.revIn = revIn;
	}
	public String getRevOut() {
		return revOut;
	}
	public void setRevOut(String revOut) {
		this.revOut = revOut;
	}
	public int getRevTerm() {
		return revTerm;
	}
	public void setRevTerm(int revTerm) {
		this.revTerm = revTerm;
	}
	
private int revId ;
private String revMember;
private String revName;
private int revRoomID ;
private int revCost ;
private int revCap ;
private String revIn ;
private String revOut ;
private int revTerm ;
private Date revDate ;
private String revRoomType ;

public String getRevRoomType() {
	return revRoomType;
}
public void setRevRoomType(String revRoomType) {
	this.revRoomType = revRoomType;
}
public String getRevName() {
	return revName;
}
public void setRevName(String revName) {
	this.revName = revName;
}

public Date getRevDate() {
	return revDate;
}
public void setRevDate(Date revDate) {
	this.revDate = revDate;
}

}//class
