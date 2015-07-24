package review.dao;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import review.vo.reviewVO;
import db.util.DBUtil;

public class reviewDAO { // guestList.jsp & DBSQL.java

	private String 	sql;
	private  int 	start=11; // [2]클릭  11레코드번호
	private  int 	end=20; //   [2]클릭  20레코드번호
	private  int    rcm=0;
	private  int 	total=2, pagecount=1;  
	private  int 	pageNUM;
	private  int 	limit=5, pagesize=5 ;
	static 	 DataSource ds;
	
	public void dbInsert(reviewVO bean) {// insertController java 연결
		sql="insert into review values(review_num_seq.nextval,?,?,?,?,?,sysdate, 0)" ;
		System.out.println("sql : " + sql);
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/snow");
			System.out.println("DB Connection!!!\tds= " + ds );
		}catch(Exception e){ 	}
		new DBUtil(){
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement( sql );
					PST.setString(1, bean.getRoomID());
				 	PST.setString(2, bean.getName());
				 	PST.setString(3, bean.getPwd());
				 	PST.setString(4, bean.getTitle());
				 	PST.setString(5, bean.getContent());
				PST.executeUpdate();
			}
		}.execute();
	
	}// end dbInsert
	
	public List<reviewVO> dbSelect(String pnum , String roomid){
		List<reviewVO> list = new ArrayList<reviewVO>();
		if(pnum==null || pnum==""){ pnum="1";}
		pageNUM= Integer.parseInt(pnum);
	System.out.print("pageNUM= "+pageNUM);
		
		if( total%limit == 0 ){ pagecount = total/limit; }
		else{ pagecount = (total/limit)+1; }
		
		start = (pageNUM-1)*limit+1;
		end	  =  pageNUM*limit;
	System.out.print("\tstart= "+start);
	System.out.println("\tend= "+end);
			

		sql = " select * from ("; 
	    sql+= " select rownum as rn, num, roomid, name, pwd, title, content, sdate, hot from (";
	    sql+= " select * from review where roomid=" + roomid + " order by num desc))";
	    sql+= " where rn between "+start+" and "+end;
	System.out.println("sql= "+sql);
	
		new DBUtil(){

			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;			
				while(RS.next()==true){
					reviewVO bean = new reviewVO();
						bean.setRownum(RS.getInt("rn"));
						bean.setNum(RS.getInt("num"));
						bean.setRoomID(RS.getString("roomid"));
						bean.setName(RS.getString("name"));
						bean.setPwd(RS.getString("pwd"));
						bean.setTitle(RS.getString("title"));
						bean.setContent(RS.getString("content"));
						bean.setSdate(RS.getDate("sdate"));
						bean.setHot(RS.getInt("hot"));	
					list.add(bean);
				}
			}
			
		}.execute();
		
		return list;
	}

	public int dbCount(String roomid) {		
		sql="select count(*) as cnt from review where roomid="+roomid;
	System.out.println("in db select");
	System.out.println("sql : " + sql);
		new DBUtil(){
		@Override
		protected void exeSQL() throws Exception {
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
		    if(RS.next()){ total=RS.getInt("cnt"); 
		    System.out.println("total= "+total);}
		}
	}.execute();
		return total;
	}
	
	public String dbDelete(String NUM) {		
		sql="delete from review where num = " + NUM ;
	System.out.println("sql : " + sql);
		new DBUtil(){
		@Override
		protected void exeSQL() throws Exception {
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
		}
	}.execute();
		return NUM;
	}
	
	public void dbUpdate(reviewVO vo) {		
		sql="update  review set  title=?, content=? where num =" + vo.getNum();
	System.out.println("sql : " + sql);
	new DBUtil(){
		@Override
		protected void exeSQL() throws Exception {
			PST = CN.prepareStatement( sql );
			 	PST.setString(1, vo.getTitle());
			 	PST.setString(2, vo.getContent());
			PST.executeUpdate();
		}
	}.execute();
	}
	
	public reviewVO dbDetail(String pnum){
		reviewVO vo = new reviewVO();
		
		String sql = "select * from review where num="+pnum;
		System.out.println("sql= "+sql);
	
		new DBUtil(){
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;
				while(RS.next()==true){
					vo.setNum(RS.getInt("num"));
					vo.setRoomID(RS.getString("roomid"));
					vo.setName(RS.getString("name"));
					vo.setPwd(RS.getString("pwd"));
					vo.setTitle(RS.getString("title"));
					vo.setContent(RS.getString("content"));
					vo.setSdate(RS.getDate("sdate"));
					vo.setHot(RS.getInt("hot"));
				}
			}
			
		}.execute();
		
		return vo;
	}
	
	public void dbHotUpdate(reviewVO vo) {		
		rcm = vo.getHot()+1;
		sql="update  review set  hot=? where num =" + vo.getNum();
	System.out.println("sql : " + sql);
	new DBUtil(){
		@Override
		protected void exeSQL() throws Exception {
			PST = CN.prepareStatement( sql );
			PST.setInt(1, rcm );
			PST.executeUpdate();
		}
	}.execute();
	}
	
}// end class
