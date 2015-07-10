package notice.common;

public class DBbean {
	private int num;
	private String title;
	private String contents;
	private java.util.Date sdate;
	private int hit;
	private int rownum;
	
	public int getRownum() {return rownum;}
	public void setRownum(int rownum) {this.rownum = rownum;}
	
	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}	
	
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	
	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}

	public java.util.Date getSdate() {return sdate;}
	public void setSdate(java.util.Date sdate) {this.sdate = sdate;}
	
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
}//DBbean()
