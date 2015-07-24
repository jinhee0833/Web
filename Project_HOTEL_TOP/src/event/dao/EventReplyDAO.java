package event.dao;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.util.DBUtil;
import event.vo.EventReplyVO;
import event.vo.EventVO;
import example.vo.ExampleVO;

import com.oreilly.servlet.MultipartRequest;

public class EventReplyDAO { // eventReply.jsp & EventReplyDAO.java
	private String 	sql;

	
	public void dbInsert(EventReplyVO bean) {// insertController java ¿¬°á
		sql="insert into r_event7 values(event7_num_seq.nextval,?,?,?,?,sysdate)" ;
	System.out.println("in db Insert");
//	System.out.println("bean to string "+ bean.toString());
	System.out.println("sql : " + sql);

		new DBUtil(){
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement( sql );
				 	PST.setInt(1, bean.getNum());
				 	PST.setString(2, bean.getR_name());
				 	PST.setString(3, bean.getR_content());
				 	PST.setString(4, bean.getR_passwd());
				PST.executeUpdate();
			}
		}.execute();
	
	}// end dbInsert
	
	
	
	public List<EventReplyVO> dbSelect(int dnum){
		List<EventReplyVO> list = new ArrayList<EventReplyVO>();
		sql = "select * from r_event7 where num = "+ dnum +"order by num desc"; 

	System.out.println("in db Select");
	System.out.println("sql= "+sql);
	
		new DBUtil(){

			@Override
			protected void exeSQL() throws Exception {
				ST = CN.createStatement();
				RS = ST.executeQuery(sql) ;			
				while(RS.next()==true){
					EventReplyVO bean = new EventReplyVO();
						bean.setR_num(RS.getInt("r_num"));
						bean.setNum(RS.getInt("num"));
						bean.setR_name(RS.getString("r_name"));
						bean.setR_content(RS.getString("r_content"));
						bean.setR_passwd(RS.getString("r_passwd"));
						bean.setR_sdate(RS.getDate("r_sdate"));
					list.add(bean);
				}
			}
			
		}.execute();
		
		return list;
	}// end dbSelect

	public void dbDelete(int num) {
		sql="delete from r_event7 where r_num = ?";
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
	
}// end class
