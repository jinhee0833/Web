package net.hb.common;

public class DBRebean {
		private int num;
		private int renum;
		private String rewriter;
		private String repasswd;
		private String rereg_date;
		private int reexcel;
		private int rebad;
		private int reprison;
		private String recontent;
		private String reip;
		private int reref;
		private int rere_step;
		private int rere_level;
		
		public DBRebean(){
			
		}
		
		public DBRebean(int num, int renum, String rewriter, String repasswd,
				String rereg_date, int reexcel, int rebad, int reprison,
				String recontent, String reip, int reref, int rere_step,
				int rere_level) {
			super();
			this.num = num;
			this.renum = renum;
			this.rewriter = rewriter;
			this.repasswd = repasswd;
			this.rereg_date = rereg_date;
			this.reexcel = reexcel;
			this.rebad = rebad;
			this.reprison = reprison;
			this.recontent = recontent;
			this.reip = reip;
			this.reref = reref;
			this.rere_step = rere_step;
			this.rere_level = rere_level;
		}

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public int getRenum() {
			return renum;
		}

		public void setRenum(int renum) {
			this.renum = renum;
		}

		public String getRewriter() {
			return rewriter;
		}

		public void setRewriter(String rewriter) {
			this.rewriter = rewriter;
		}

		public String getRepasswd() {
			return repasswd;
		}

		public void setRepasswd(String repasswd) {
			this.repasswd = repasswd;
		}

		public String getRereg_date() {
			return rereg_date;
		}

		public void setRereg_date(String rereg_date) {
			this.rereg_date = rereg_date;
		}

		public int getReexcel() {
			return reexcel;
		}

		public void setReexcel(int reexcel) {
			this.reexcel = reexcel;
		}

		public int getRebad() {
			return rebad;
		}

		public void setRebad(int rebad) {
			this.rebad = rebad;
		}

		public int getReprison() {
			return reprison;
		}

		public void setReprison(int reprison) {
			this.reprison = reprison;
		}

		public String getRecontent() {
			return recontent;
		}

		public void setRecontent(String recontent) {
			this.recontent = recontent;
		}

		public String getReip() {
			return reip;
		}

		public void setReip(String reip) {
			this.reip = reip;
		}

		public int getReref() {
			return reref;
		}

		public void setReref(int reref) {
			this.reref = reref;
		}

		public int getRere_step() {
			return rere_step;
		}

		public void setRere_step(int rere_step) {
			this.rere_step = rere_step;
		}

		public int getRere_level() {
			return rere_level;
		}

		public void setRere_level(int rere_level) {
			this.rere_level = rere_level;
		}
		
		
}
