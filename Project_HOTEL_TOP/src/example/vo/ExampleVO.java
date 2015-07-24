package example.vo;

import java.util.Date;

public class ExampleVO {
	private int sabun;
	private String name;
	private String title;
	private Date nalja;
	private int pay;
	
	private int rownum;
	private int startPage;
	private int pageCount=10;
	private int pageAll;
	
	private String returnpage;

	public String getReturnpage() {
		return returnpage;
	}
	public void setReturnpage(String returnpage) {
		this.returnpage = returnpage;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageAll() {
		return pageAll;
	}
	public void setPageAll(int pageAll) {
		this.pageAll = pageAll;
	}
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "DBbean [sabun=" + sabun + ", name=" + name + ", title=" + title
				+ ", nalja=" + nalja + ", pay=" + pay + ", rownum=" + rownum
				+ ", startPage=" + startPage + ", pageCount=" + pageCount
				+ ", pageAll=" + pageAll + "]";
	}
}
