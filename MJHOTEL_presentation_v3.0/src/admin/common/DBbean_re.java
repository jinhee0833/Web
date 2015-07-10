package admin.common;

public class DBbean_re {
	private int num;
	private String title;
	private String contents;
	private String writer;
	private java.util.Date wdate;
	private int count;
	private int reco;
	private String pwd;
	private int cmtcount;
	
	public int getCmtcount() {
		return cmtcount;
	}
	public void setCmtcount(int cmtcount) {
		this.cmtcount = cmtcount;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public java.util.Date getWdate() {
		return wdate;
	}
	public void setWdate(java.util.Date wdate) {
		this.wdate = wdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReco() {
		return reco;
	}
	public void setReco(int reco) {
		this.reco = reco;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}//END
