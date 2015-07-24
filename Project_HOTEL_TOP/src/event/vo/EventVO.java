package event.vo;

public class EventVO { //bridge
	
	private int 	num;
	private int		rownum;
	private String 	filename;
	private String 	th_filename;
	private String 	title;
	private String 	content;
	private java.util.Date e_start;
	private java.util.Date e_end;
	private java.util.Date sdate;
	private int 	hit;
	private int 	c_count=0;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getTh_filename() {
		return th_filename;
	}
	public void setTh_filename(String th_filename) {
		this.th_filename = th_filename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.util.Date getE_start() {
		return e_start;
	}
	public void setE_start(java.util.Date e_start) {
		this.e_start = e_start;
	}
	public java.util.Date getE_end() {
		return e_end;
	}
	public void setE_end(java.util.Date e_end) {
		this.e_end = e_end;
	}
	public java.util.Date getSdate() {
		return sdate;
	}
	public void setSdate(java.util.Date time) {
		this.sdate = time;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	@Override
	public String toString() {
		return "EventVO [num=" + num + ", rownum=" + rownum + ", filename="
				+ filename + ", th_filename=" + th_filename + ", title="
				+ title + ", content=" + content + ", e_start=" + e_start
				+ ", e_end=" + e_end + ", sdate=" + sdate + ", hit=" + hit
				+ ", c_count=" + c_count + "]";
	}

	
}//class END
