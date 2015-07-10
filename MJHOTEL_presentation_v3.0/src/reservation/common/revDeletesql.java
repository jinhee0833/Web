package reservation.common;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import reservation.common.revDBbean;
import reservation.common.roomDBbean;

public class revDeletesql {

	private Connection CN ; // 
	private Statement ST ; 
	private PreparedStatement PST ; // 
	private ResultSet RS ; 
	private String sql ;

	public revDeletesql() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url,"system","oracle");
		}catch(Exception ex){System.out.println("<h1>" + ex.toString()+"</h1>");}
	}//con

	public int revDelete(int ID){	
		int ok = 0; 
		String sql = "delete from reservation where revID = "+ID ;
		try{
			ST = CN.createStatement() ;
			ok = ST.executeUpdate(sql);						
		}catch(Exception ex){System.out.println("revDelete : "+ex.toString());}
		return ok ;
	}
	
}//class
