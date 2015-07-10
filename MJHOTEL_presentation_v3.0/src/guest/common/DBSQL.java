package guest.common;

import java.sql.*;
import java.util.*;//List �������̽�
import java.io.*;

//�ؿ� 3���� ��Ʈ�� ������.
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBSQL {
	private Connection CN; //DB�����������, ��ɾ� ����
	private Statement ST; //������ ��ɾ� ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //���������
	private int total; //���ڵ尹��

	public DBSQL(){ //�����ڿ��� DB����
		//CN=DB.getConnection();
		//META-INF/context.xml���� ���ҽ� name����
		try{
			CN= DB.getConnection();
		}catch(Exception ex){}
	} //end
	
	public int dbInsert(DBbean bean){//InsertController.java����
		//Web0807���� guestSave.jsp DBbean bean=>int data1, String data2, String data3, int data4
		int success=0;
		try{
				sql="insert into login values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PST = CN.prepareStatement(sql);//PST��ɾ� �غ�, sql���������� �̸� ������
				PST.setString(1, bean.getId());// (1, data1)
				PST.setString(2, bean.getPw());// (2, data2)
				PST.setString(3, bean.getName());// (3, data3)
				PST.setInt(4, bean.getGender());// (4, data4)
				PST.setString(5, bean.getBirth());// (3, data3)
				PST.setString(6, bean.getAddr());// (3, data3)
				PST.setString(7, bean.getEmail());// (3, data3)
				PST.setString(8, bean.getTel());// (3, data3)
				PST.setInt(9, bean.getMem());// (3, data3)
					
				success = PST.executeUpdate();//��¥����ó���޼ҵ� =>�ܵ�ó�� �����߻�
				if(success>0){System.out.print("dbInsert(DBbean)���强��!!!");}
		}catch(Exception ex){System.out.print("dbInsert(DBbean)�������!!!");}
		return success;
	} //dbInsert(DBbean bean) end 
	
	public int dbSearch(String ID, String PW){
		int count = 0;
		try{
			String sql = "select * from login where ID='"+ID+"'";
			ST= CN.createStatement();
			RS= ST.executeQuery(sql);
			if(RS.next()==true) {
				if(RS.getString("ID").equals(ID) && RS.getString("PW").equals(PW)){ 
					count=1;}
			}
		}catch(Exception ex){ex.toString();}
		return count;
	}//dbSerch(int ID) end
	
	/*
	public List<DBbean> dbSelect(int start, int end, String skey, String sval){//ListController.java����
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			String subsql=" where "+skey+" like '%"+sval+"%'";	
			sql="select * from";
			sql+=" (select rownum as rn, sabun, name, nalja, title, pay from ";
			sql+=" (select * from guest "+subsql+" order by nalja desc ))";
			sql+=" where rn between "+start+" and " + end;
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setRn(RS.getInt("rn"));
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setPay(RS.getInt("pay"));
				LT.add(bean);
				System.out.println("dd");
			} //while end
		}catch(Exception ex){System.out.println("dbSelect(��ŸƮ �ص�) : " + ex.toString());}
		return LT;
	} //dbSelect() end
	
	public DBbean dbDetail(String data){//DetailController.java����
		DBbean bean = new DBbean();
		try{
			sql="select * from guest where sabun="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setPay(RS.getInt("pay"));
			} //while end
		}catch(Exception ex){}
		return bean;
	} //dbDetail() end
	
	public void dbDelete(String data){//DetailController.java����
		try{
			sql="select count(*) as cnt from guest where sabun=" + data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){total=RS.getInt("cnt");}
			if(total>0){
			sql="delete from guest where sabun="+data;
			ST=CN.createStatement();//��ɾ����
			ST.executeUpdate(sql);//��¥ ����ó��			
			System.out.println("\n"+data+"��������");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	public DBbean dbEditPre(String data){//EditProController.java����
		DBbean bean = new DBbean();
		try{
			sql="select * from guest where sabun="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setPay(RS.getInt("pay"));
			} //while end
		}catch(Exception ex){System.out.println(ex.toString());}
		return bean;
	} //dbEditPro() end	
	
	public int dbEdit(DBbean bean){//EditProController.java����
		int success=0;
		try{	

			sql="update guest set name=?, title=?, pay=? where sabun=? ";//�ӵ��� ������ �ϱ� ���ؼ�...
			PST=CN.prepareStatement(sql);
				PST.setString(1, bean.getName());
				PST.setString(2, bean.getTitle());
				PST.setInt(3, bean.getPay());
				PST.setInt(4, bean.getSabun());
			success = PST.executeUpdate();//��ȣ�ȿ� �Ű����� sql�� �ٽ� ������ ���� ?�� ��.
			if(success>0){System.out.println("<h1>��������!!!</h1>");}
		}catch(Exception ex){System.out.println("��������"+ex.toString());}
		return success;
	} //dbEdit() end	

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	public int dbTotal(){
		try{
			sql="select count(*) as cnt from guest";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
				System.out.println(total);
			}
		}catch(Exception ex){ }
		return total;
	} //dbTotal() end 
	
	public int dbTotal(String skey, String sval){
		try{
			sql="select count(*) as cnt from guest where "+skey+" like '%"+sval+"%' ";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
				System.out.println(total);
			}
		}catch(Exception ex){ }
		return total;
	} //dbTotal() end 
	*/

} //class END
