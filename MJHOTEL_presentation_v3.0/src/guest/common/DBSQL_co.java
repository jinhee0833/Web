package guest.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBSQL_co {
	private Connection CN; //DB�����������, ��ɾ� ����
	private Statement ST; //������ ��ɾ� ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //���������
	private int total; //��۰���
	
	public DBSQL_co(){
		CN=DB.getConnection();
	}
	
	public int coInsert(DBbean_co bean, String data){
		
		DBbean_re bean1=new DBbean_re();
		int success=0;
		try{
			sql="insert into cmtreply values(co_seq.nextval, ?, ?, ?, ?)";
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getCowriter());
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			PST.setString(2, sdf.format(date));
			PST.setString(3, bean.getCmt());
			PST.setInt(4, Integer.parseInt(data));
			
			success=PST.executeUpdate();
			if(success>0){  System.out.println("���DB��� ����");}
		}catch(Exception ex){ System.out.println("��� ��Ͽ��� : "+ex.toString()); }
		return success;
	}//insert END
	
	public List<DBbean_co> coSelect(String num){
		List<DBbean_co> list=new ArrayList<DBbean_co>();
		try{			
			sql="select conum, cowriter, codate, cmt from cmtreply where num="+num+"order by conum";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean_co bean=new DBbean_co();
				bean.setConum(RS.getInt("conum"));
				bean.setCowriter(RS.getString("cowriter"));
				bean.setCodate(RS.getString("codate"));
				bean.setCmt(RS.getString("cmt"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("��� List ���� : "+ex.toString()); }
		return list;
	}//select() END
	
	public int cototal(int num){
		try{
			String sql2="select count(*) as cnt from cmtreply where num="+num;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	
	public void coDelete(String data1){
		try{
			sql="delete from cmtreply where conum="+data1;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("��������");  }
		}catch(Exception ex){ System.out.println("�������� :"+ex.toString()); }
	}//dbDelete() END

}//class END
