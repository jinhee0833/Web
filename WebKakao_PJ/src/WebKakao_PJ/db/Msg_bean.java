package WebKakao_PJ.db;

import java.sql.Date;

public class Msg_bean {

	private int msg_idx;
	private String msg_sendID;
	private String msg_receiveID;
	private String msg_content;
	private String msg_check;
	private Date msg_senddate;
	private Date msg_receivedate;
	public int getMsg_idx() {
		return msg_idx;
	}
	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}
	public String getMsg_sendID() {
		return msg_sendID;
	}
	public void setMsg_sendID(String msg_sendID) {
		this.msg_sendID = msg_sendID;
	}
	public String getMsg_receiveID() {
		return msg_receiveID;
	}
	public void setMsg_receiveID(String msg_receiveID) {
		this.msg_receiveID = msg_receiveID;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_check() {
		return msg_check;
	}
	public void setMsg_check(String msg_check) {
		this.msg_check = msg_check;
	}
	public Date getMsg_senddate() {
		return msg_senddate;
	}
	public void setMsg_senddate(Date msg_senddate) {
		this.msg_senddate = msg_senddate;
	}
	public Date getMsg_receivedate() {
		return msg_receivedate;
	}
	public void setMsg_receivedate(Date msg_receivedate) {
		this.msg_receivedate = msg_receivedate;
	}
	
	
	
	
}
