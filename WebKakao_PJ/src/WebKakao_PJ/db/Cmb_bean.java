package WebKakao_PJ.db;

import java.util.Date;

public class Cmb_bean {
	private int g_idx=0;
	private Date g_date;
	private String g_name="defaultName";
	private String g_userId="defaultId";
	private String g_content="defaultContent";
	private String g_public;
	private int g_ref=1; 
	private int g_lev=0; 
	private int g_seq=0;
	
	public int getG_idx() {		return g_idx;	}
	public void setG_idx(int g_idx) {		this.g_idx = g_idx;	}
	
	public Date getG_date() {		return g_date;	}
	public void setG_date(Date g_date) {		this.g_date = g_date;	}
	
	public String getG_name() {		return g_name;	}
	public void setG_name(String g_name) {		this.g_name = g_name;	}
	public String getG_userId() {		return g_userId;	}
	public void setG_userId(String g_userId) {		this.g_userId = g_userId;	}
	public String getG_content() {		return g_content;	}
	public void setG_content(String g_content) {		this.g_content = g_content;	}
	public String getG_public() {		return g_public;	}
	public void setG_public(String g_public) {		this.g_public = g_public;	}
	public int getG_ref() {		return g_ref;	}
	public void setG_ref(int g_ref) {		this.g_ref = g_ref;	}
	public int getG_lev() {		return g_lev;	}
	public void setG_lev(int g_lev) {		this.g_lev = g_lev;	}
	public int getG_seq() {		return g_seq;	}
	public void setG_seq(int g_seq) {		this.g_seq = g_seq;	} 
	
	
}