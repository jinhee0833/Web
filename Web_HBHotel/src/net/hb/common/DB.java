package net.hb.common;

import java.sql.*;

public class DB {

	public static Connection getConnection(){
		Connection CN = null ;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@203.236.209.125:1521:XE";
			CN = DriverManager.getConnection(url,"system","oracle");
			System.out.println("DB connected");
		}catch(Exception ex){
			System.out.println("DB연결실패 : " + ex.toString() );
		}
		return CN ;
	}
}
