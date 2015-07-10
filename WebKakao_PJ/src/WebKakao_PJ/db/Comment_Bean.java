package WebKakao_PJ.db;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Comment_Bean{
	private int comment_idx;
	private int comment_boardnum;
	private String comment_name;
	private String comment_content;
	private java.util.Date comment_date;
	private int comment_RE_REF;
	private int comment_RE_LEV;
	private int comment_RE_SEQ;
	private String comment_rename;
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public int getComment_boardnum() {
		return comment_boardnum;
	}
	public void setComment_boardnum(int comment_boardnum) {
		this.comment_boardnum = comment_boardnum;
	}
	public String getComment_name() {
		return comment_name;
	}
	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public java.util.Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(java.util.Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_RE_REF() {
		return comment_RE_REF;
	}
	public void setComment_RE_REF(int comment_RE_REF) {
		this.comment_RE_REF = comment_RE_REF;
	}
	public int getComment_RE_LEV() {
		return comment_RE_LEV;
	}
	public void setComment_RE_LEV(int comment_RE_LEV) {
		this.comment_RE_LEV = comment_RE_LEV;
	}
	public int getComment_RE_SEQ() {
		return comment_RE_SEQ;
	}
	public void setComment_RE_SEQ(int comment_RE_SEQ) {
		this.comment_RE_SEQ = comment_RE_SEQ;
	}
	public String getComment_rename() {
		return comment_rename;
	}
	public void setComment_rename(String comment_rename) {
		this.comment_rename = comment_rename;
	}
	
}
