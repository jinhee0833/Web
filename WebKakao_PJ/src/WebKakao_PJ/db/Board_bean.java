package WebKakao_PJ.db;

import java.sql.Date;

public class Board_bean {
	private int brd_idx;
	private int brd_num;
	private String brd_id;
	private String brd_name;
	private String brd_content;
	private Date brd_date;
	private String brd_file;
	private int brd_rcmd;
	private String brd_public;
	private int brd_ref;
	private int brd_lev;
	private int brd_seq;
	public int getBrd_idx() {
		return brd_idx;
	}
	public void setBrd_idx(int brd_idx) {
		this.brd_idx = brd_idx;
	}
	public int getBrd_num() {
		return brd_num;
	}
	public void setBrd_num(int brd_num) {
		this.brd_num = brd_num;
	}
	public String getBrd_id() {
		return brd_id;
	}
	public void setBrd_id(String brd_id) {
		this.brd_id = brd_id;
	}
	public String getBrd_name() {
		return brd_name;
	}
	public void setBrd_name(String brd_name) {
		this.brd_name = brd_name;
	}
	public String getBrd_content() {
		return brd_content;
	}
	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}
	public Date getBrd_date() {
		return brd_date;
	}
	public void setBrd_date(Date brd_date) {
		this.brd_date = brd_date;
	}
	public String getBrd_file() {
		return brd_file;
	}
	public void setBrd_file(String brd_file) {
		this.brd_file = brd_file;
	}
	public int getBrd_rcmd() {
		return brd_rcmd;
	}
	public void setBrd_rcmd(int brd_rcmd) {
		this.brd_rcmd = brd_rcmd;
	}
	public String getBrd_public() {
		return brd_public;
	}
	public void setBrd_public(String brd_public) {
		this.brd_public = brd_public;
	}
	public int getBrd_ref() {
		return brd_ref;
	}
	public void setBrd_ref(int brd_ref) {
		this.brd_ref = brd_ref;
	}
	public int getBrd_lev() {
		return brd_lev;
	}
	public void setBrd_lev(int brd_lev) {
		this.brd_lev = brd_lev;
	}
	public int getBrd_seq() {
		return brd_seq;
	}
	public void setBrd_seq(int brd_seq) {
		this.brd_seq = brd_seq;
	}
}
