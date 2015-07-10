package net.hb.common;

public class DBNoticeBean {

	
	private String writer;
	private String  title;
	private String  content;
	private java.util.Date nalja;
	private int rn;
	private int num;
	private int total;
	private String filename;
	
	
	public String getFilename() {return filename;}
	public void setFilename(String filename) {this.filename = filename;	}

	public int getTotal() {	return total;}
	public void setTotal(int total) {this.total = total;}
	
	public String getWriter() {	return writer;}
	public void setWriter(String writer) {	this.writer = writer;}
	
	public String getTitle() {	return title;}
	public void setTitle(String title) {this.title = title;}
	
	
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	
	public java.util.Date getNalja() {return nalja;	}
	public void setNalja(java.util.Date nalja) {this.nalja = nalja;	}
	
	public int getRn() {return rn;}
	public void setRn(int rn){this.rn = rn;}
	
	public int getNum() {return num;}
	public void setNum(int num){this.num = num;}
	

}
