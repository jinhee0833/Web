package event.dao;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.util.DBUtil;
import event.vo.EventVO;

import com.oreilly.servlet.MultipartRequest;

public class EventDAO { // eventList.jsp & EventDAO.java
	private	 String		sql;
	static 	 DataSource ds;
	
	private  String		pnum;
	private  int 		pageNUM;
	private  int 		limit = 5;	
	private  int 		start = 11; 	// [2]Ŭ��  11���ڵ��ȣ
	private  int 		end = 20; 	// [2]Ŭ��  20���ڵ��ȣ
	private  int 		total = 0; 
	

	
	public void dbInsert(MultipartRequest mr) {// insertController java ����
		sql="insert into event7 values(event7_num_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, 0)" ;
		System.out.println("in db insert");
		System.out.println("bean to string "+ mr.toString());
		System.out.println("sql : " + sql);

		System.out.println("date " + mr.getParameter("e_start"));
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/snow");
			System.out.println("DB Connection!!!\tds= " + ds );
		}catch(Exception e){ 	}
		
		new DBUtil(){
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement( sql );
				 	PST.setString(1, mr.getFilesystemName("filename"));
				 	PST.setString(2, mr.getFilesystemName("th_filename"));
				 	PST.setString(3, mr.getParameter("title"));
				 	PST.setString(4, mr.getParameter("content"));
				 	PST.setString(5, mr.getParameter("e_start"));
					PST.setString(6, mr.getParameter("e_end"));

				PST.executeUpdate();
			}
		}.execute();
	
	}// end dbInsert
	
	
	
	public List<EventVO> dbSelect(String pnum){
		List<EventVO> list = new ArrayList<EventVO>();	
	System.out.print("in db Select");
		
		if(pnum==null || pnum==""){ pnum="1";}
		pageNUM= Integer.parseInt(pnum);
	System.out.print("\tpageNUM= "+pageNUM);
		
		start = (pageNUM-1)*limit+1;
		end	  =  pageNUM*limit;
	System.out.print("\tstart= "+start);
	System.out.println("\tend= "+end);
	
		sql = " select * from ( "; 
		sql+= " select rownum rn, e.* from ( ";
		sql+= " select * from event7 order by num desc ) e ) ";
		sql+= " where rn between "+start+" and "+end;
	System.out.println("sql= "+sql);
	
		new DBUtil(){

			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;			
				while(RS.next()==true){
					EventVO bean = new EventVO();
						bean.setRownum(RS.getInt("rn"));
						bean.setNum(RS.getInt("num"));
						bean.setFilename(RS.getString("filename"));
						bean.setTh_filename(RS.getString("th_filename"));
						bean.setTitle(RS.getString("title"));
						bean.setContent(RS.getString("content"));
						bean.setE_start(RS.getDate("e_start"));
						bean.setE_end(RS.getDate("e_end"));
						bean.setSdate(RS.getDate("sdate"));
						bean.setHit(RS.getInt("hit"));	
					list.add(bean);
				}
			}
		}.execute();
		
		return list;
	}// end dbSelect


	public List<EventVO> eventMainSelect(){
		List<EventVO> list = new ArrayList<EventVO>();	
		System.out.println("event main select");
		String sql ="select E_start, title from event7 where sysdate >  e_start order by e_start asc";
		
		new DBUtil() {
			
			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;			
				while(RS.next()==true){
					EventVO bean = new EventVO();
						bean.setTitle(RS.getString("title"));
						bean.setE_start(RS.getDate("e_start"));
					list.add(bean);
					System.out.println("list add"+ list.toString());
				}
			}
		}.execute();
		return null;
		
	}// end eventMainSelect

	public int dbCount() {		
		sql="select count(*) as cnt from event7";
	System.out.println("in db Count");
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
	}// end dbCount
	
	public void dbDelete(int num) {		
		sql="delete from event7 where num = ?";
	System.out.println("in db Delete");
	System.out.println("sql : " + sql);
	
		new DBUtil(){
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setInt(1, num);
				PST.executeUpdate();
			}
		}.execute();
		
	}// end dbDelete



	public void dbUpdateHit(int dnum) {
	sql="update event7 set hit=hit+1 where num = ?";
	System.out.println("in db dbUpdateHit");
	System.out.println("sql : " + sql);
		
	
		new DBUtil(){
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
					PST.setInt(1, dnum);
				PST.executeUpdate();
			}
		}.execute();
		
	}// end dbUpdateHit

	public EventVO dbDetail(String num) {
		EventVO vo = new EventVO();
		sql = "select * from event7 where num="+num;
	System.out.println("in db dbDetail");
	System.out.println("sql= "+sql);
	
		new DBUtil(){
			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;
				while(RS.next()==true){
					vo.setNum(RS.getInt("num"));
					vo.setFilename(RS.getString("filename"));
					vo.setTh_filename(RS.getString("th_filename"));
					vo.setTitle(RS.getString("title"));
					vo.setContent(RS.getString("content"));
					vo.setE_start(RS.getDate("e_start"));
					vo.setE_end(RS.getDate("e_end"));
					vo.setSdate(RS.getDate("sdate"));
					vo.setHit(RS.getInt("hit"));
				}
			}
			
		}.execute();

		return vo;
	}// end dbDetail

	public void dbUpdate(String dt1, String dt2, String dt3, String dt4,String dt5) {
		sql="update event7 set title=?, content=?, e_start=?, e_end=? where num = ?";
	System.out.println("in db dbUpdate");
	System.out.println("sql : " + sql);
		
		new DBUtil(){
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
					PST.setString(1, dt2);
					PST.setString(2, dt3);
					PST.setString(3, dt4);
					PST.setString(4, dt5);
					PST.setInt(5, Integer.parseInt(dt1));
				PST.executeUpdate();
			}
		}.execute();
	}// end dbUpdate
	
	
	
	public List<EventVO> PopUp(){
		List<EventVO> list = new ArrayList<EventVO>();	
	System.out.print("popupcontroller");
		
	sql = "select e_start,filename from event7 order by e_start";
		
		new DBUtil(){

			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;
				int count = 0;
				while(count<1){
					RS.next();
					EventVO bean = new EventVO();
						bean.setFilename(RS.getString("filename"));
						bean.setE_start(RS.getDate("e_start"));
					list.add(bean);
					System.out.println("listadd" + list.toString());
					
				}
			}
		}.execute();
		
		return list;
	}// pop end
	
	
	
}// end class
