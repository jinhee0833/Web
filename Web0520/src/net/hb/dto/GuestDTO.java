package net.hb.dto;

public class GuestDTO { //DBbean.java��������
		private  int sabun;
		private  String name;
		private  String title;
		private  java.util.Date  nalja ;
		private  int pay;

		private  int rn ; //���ȣ
		private  int start; //select ~~ where rn between  1  and  10
		private  int end;
		private  String skey; //�ʵ�  <select><option name="title">����
		private  String sval; //�˻��ܾ��Է� <input type=text name=keyword>
		public int getRn() {
			return rn;
		}
		public void setRn(int rn) {
			this.rn = rn;
		}
		public int getStart() {
			return start;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			return end;
		}
		public void setEnd(int end) {
			this.end = end;
		}
		public String getSkey() {
			return skey;
		}
		public void setSkey(String skey) {
			this.skey = skey;
		}
		public String getSval() {
			return sval;
		}
		public void setSval(String sval) {
			this.sval = sval;
		}
		
		public int getSabun() {		return sabun;		}
		public void setSabun(int sabun) {			this.sabun = sabun;		}
		public String getName() {			return name;		}
		public void setName(String name) {			this.name = name;		}
		public String getTitle() {			return title;		}
		public void setTitle(String title) {			this.title = title;		}
		public java.util.Date getNalja() {			return nalja;		}
		public void setNalja(java.util.Date nalja) {			this.nalja = nalja;		}
		public int getPay() {			return pay;		}
		public void setPay(int pay) {			this.pay = pay;		}
}//class end
