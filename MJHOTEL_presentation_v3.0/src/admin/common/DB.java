package admin.common;

import java.sql.*;

public class DB {
	
	public static Connection getConnection(){
		Connection CN =null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url, "system", "oracle");
		} catch (Exception ex) {System.out.println(ex.toString());}
		return CN;
	} //end
} //class END