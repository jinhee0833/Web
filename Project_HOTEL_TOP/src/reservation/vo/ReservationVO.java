package reservation.vo;

import java.util.Date;


/*
 	create table reservation(
 revID number(10) primary key,
 revMemberID varchar2(16),
 revRoomID varchar2(10),
 revTotalCost number(8),
 revNumberGuest number(2),
 revIn varchar2(10),
 revOut varchar2(10),
 revTerm number,
 revComment varchar(1000),
 revDate date
);
 */
public class ReservationVO {

	private int revID;
	private String revMemberID;
	private String revRoomID;
	private int revTotalCost;
	private int revNumberGuest;
	private String revIn;
	private String revOut;
	private int revTerm;
	private String revComment;
	private Date revDate;
	
	public int getRevID() {
		return revID;
	}
	public void setRevID(int revID) {
		this.revID = revID;
	}
	public String getRevMemberID() {
		return revMemberID;
	}
	public void setRevMemberID(String revMemberID) {
		this.revMemberID = revMemberID;
	}
	public String getRevRoomID() {
		return revRoomID;
	}
	public void setRevRoomID(String revRoomID) {
		this.revRoomID = revRoomID;
	}
	public int getRevTotalCost() {
		return revTotalCost;
	}
	public void setRevTotalCost(int revTotalCost) {
		this.revTotalCost = revTotalCost;
	}
	public int getRevNumberGuest() {
		return revNumberGuest;
	}
	public void setRevNumberGuest(int revNumberGuest) {
		this.revNumberGuest = revNumberGuest;
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
	public String getRevComment() {
		return revComment;
	}
	public void setRevComment(String revComment) {
		this.revComment = revComment;
	}
	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	@Override
	public String toString() {
		return "ReservationDAO [revID=" + revID + ", revMemberID="
				+ revMemberID + ", revRoomID=" + revRoomID + ", revTotalCost="
				+ revTotalCost + ", revNumberGuest=" + revNumberGuest
				+ ", revIn=" + revIn + ", revOut=" + revOut + ", revTerm="
				+ revTerm + ", revComment=" + revComment + ", revDate="
				+ revDate + "]";
	}
	
}
