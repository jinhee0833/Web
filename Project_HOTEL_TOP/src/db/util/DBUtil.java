package db.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public abstract class DBUtil {

	protected Connection CN; // db server  id pass / 명령생성할때 참조
	protected Statement ST; // delete selecct query
	protected PreparedStatement PST; // insert, update compile
	protected ResultSet RS; // RS=ST.executeQuery("select query")
	
	private void getConnection(){
		CN = null;
		try{
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
//			CN = DriverManager.getConnection(url, "system", "oracle");
			Context ct = new InitialContext();
			DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
			CN = ds.getConnection();
			System.out.println("in getConnection CN" + CN);
			System.out.println("DB서버 연결성공");
		}catch(Exception ex){
			System.out.println("DB서버 연결실패"+ ex.toString());
		}
		
	}// end getConnection
	
	private void closeAll() {
		System.out.println("close all");
		
		if(RS != null){
			try{ RS.close();} catch(Exception e){}
		}
		if(PST != null){
			try{ PST.close();} catch(Exception e){}
		}
		if(ST != null){
			try{ ST.close();} catch(Exception e){}
		}
		if(CN != null){
			try{ CN.close();} catch(Exception e){}
		}
	}// end closeAll
	
	public final void execute(){
		try {
			getConnection();
			System.out.println("in execute CN " + CN);
			exeSQL();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeAll();
		}
		
	}// end exe

	protected abstract void exeSQL() throws Exception;
		
}
