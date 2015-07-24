package example.dao;

import db.util.DBUtil;
import example.vo.ExampleVO;

public class ExampleDAO { // guestList.jsp & DBSQL.java

//	public DBSQL() {
////		CN = DB.getConnection();
//		try {
//			Context ct = new InitialContext();
//			DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
//			ds.getConnection();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("successful db conection\n");
//	}// end DBSQL

	
	public void dbInsert(ExampleVO bean) {// insertController java ¿¬°á
		final String sql = "insert into guest values(?,?,?,sysdate,?)";
		System.out.println("in db insert");
		System.out.println("bean to string "+ bean.toString());
		System.out.println("sql : " + sql);

		new DBUtil(){
			
			@Override
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setInt(1, bean.getSabun());
				PST.setString(2, bean.getName());
				PST.setString(3, bean.getTitle());
				PST.setInt(4, bean.getPay());

				PST.executeUpdate();

				
			}
		}.execute();
	
	}// end dbInsert
	
	
	public void dbSelect(){
		
		new DBUtil(){

			@Override
			protected void exeSQL() throws Exception {
				// TODO Auto-generated method stub
				
			}
			
		}.execute();
	}
	
}// end class
