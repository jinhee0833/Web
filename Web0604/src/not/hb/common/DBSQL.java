package not.hb.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBSQL {
	private Connection CN; // DB����, id, pass / ��ɻ����Ҷ� ����
	private Statement ST; // select������ ������ɾ�
	private PreparedStatement PST; // insert,update, delete�����ϵȸ�ɾ�
	private ResultSet RS; // RS=ST.executeQuery("select������")
	private String sql, sql2;

	private int start = 11; // [2]Ŭ�� 11���ڵ��ȣ
	private int end = 20; // [2]Ŭ�� 20���ڵ��ȣ
	private int total = 0, pagecount = 1, Gtotal = 0;
	// /////////////����¡���п� �ʿ��� �ʵ�///////////////////
	private String pnum; // <a href=guestList.jsp?pageNUM
	private int pageNUM;
	private int limit = 10, pagesize = 10;
	private int startpage = 1, temp = 1;
	private int num = 0; // num = �������� - ( ) * limit ;

	// /////////////�˻� �ʿ��� �ʵ�///////////////////
	private String skey; // select���� ������ �׸�
	private String sval; // �˻�Ű����
	private String sqry; // �˻����ʿ��� ������
	private String returnpage; // �̸��˻� g => [1][2][3][4][5]

	public DBSQL() {
		// CN = DB.getConnection();
		try {
			Context ct = new InitialContext();
			DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/snow");
			CN = ds.getConnection();
			System.out.println("DBSQL������ db���Ἲ��");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}// end

	public void dbInsert(DBbean bean) {// InsertController.java ����
		try {
			sql = "insert into guest values(?, ?, ?, sysdate, ?)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, bean.getSabun());
			PST.setString(2, bean.getName());
			PST.setString(3, bean.getTitle());
			PST.setInt(4, bean.getPay());
			PST.executeUpdate();
		} catch (Exception ex) {
			System.out.println("PST�������: " + ex);
		}
	}// end

	public int getGuestCount(){
		try{
			ST = CN.createStatement();
			RS = ST.executeQuery("select count(*) as cnt from guest " + sqry);
			if(RS.next()==true){
				total = RS.getInt("cnt");
			}
		}catch(Exception ex){
			
		}
		return total;
	}
	
	public List<DBbean> dbSelect(String pnum,String sf,String skey) {
		List list = new ArrayList();
		try {
			if(sf==null || skey==null){
				sf="name";
				skey="";
			}
			sqry = " where " + sf.trim()+ " like '%" + skey.trim() +"%' "; // where name like '%b%'
			returnpage = "&keyfield="+sf+"&keyword="+skey;
			
			
			
			if(pnum==null || pnum==""){
				pnum="1";
			}
			
			pageNUM = Integer.parseInt(pnum);
			
			if(total%limit==0){
				pagecount = total/limit;
			}
			else{pagecount = total/limit+1;}
			
			start =(pageNUM-1)*limit+1;
			end = pageNUM*limit;
			
			sql = "select * from ( ";
			sql += " select rownum rn , sabun,name,title,nalja,pay from  ";
			sql += " (select * from guest " + sqry + " order by sabun )";
			sql += " ) where rn between "+ start + " and " + end;
			
			
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);


			while (RS.next() == true) {
				DBbean bean = new DBbean();
				bean.setRownum(RS.getInt("rn"));
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));
				bean.setReturnpage(returnpage);

				list.add(bean);
			}
			

		} catch (Exception ex) {
		}
		return list;
	}// end

	public DBbean dbDetail(String data) {
		DBbean bean = new DBbean();
		try {
			sql = "select * from guest where sabun= " + data;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while (RS.next() == true) {
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));
			}
			System.out.println("������: " + data);
		} catch (Exception ex) {
		}
		return bean;
	}

	public void Delete(String data) {
		DBbean bean = new DBbean();
		try {
			sql = "delete from guest where sabun = " + data;
			PST = CN.prepareStatement(sql);
			PST.executeUpdate();
		} catch (Exception ex) {
			System.out.println("PST�������: " + ex);
		}
	}// end

	public void Edit(DBbean bean) {
		try {
			sql = "update guest set  name=?, title=?, pay=? where sabun = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setInt(3, bean.getPay());
			PST.setInt(4, bean.getSabun());
			PST.executeUpdate();

		} catch (Exception ex) {

		}
	}// end

	public String loginCheck(String dt1, String dt2) {
		String ret = "";
		try {
			System.out.println("\nString loginCheck(String,String)");
			sql = "select * from login where userid=? and pwd=?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, dt1);
			PST.setString(2, dt2);
			RS = PST.executeQuery();
			if (RS.next() == true) {
				System.out.println("userid=" + RS.getString("userid"));
				System.out.println("pwd=" + RS.getString("pwd"));
				ret = RS.getString("userid");
				System.out.println("5");
				
			}

		} catch (Exception ex) {

		}
		return ret;
	}// end
}
