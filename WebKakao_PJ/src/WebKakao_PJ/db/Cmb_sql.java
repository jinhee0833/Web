package WebKakao_PJ.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Cmb_sql {
	
	private  Connection CN = null ; //java.sql.* 
	private  Statement  ST = null ;
	private  PreparedStatement PST=null ;
	private  ResultSet rs=null ;
	
	private DataSource ds;
	
	public Cmb_sql(){
		try{
			Context init = new InitialContext();
	 		ds = (DataSource)init.lookup("java:comp/env/jdbc/snow");
	 		
			System.out.print("DB���Ἲ��");
		}catch(Exception e){
			e.printStackTrace();
			System.out.print("DB�������"+e);
		}
	}
		
	public String selectDate(){
		String sql="";
		rs =null;
		
		try{
			CN = ds.getConnection();
			sql = "SELECT sysdate as dt FROM dual"; 
			PST=CN.prepareStatement(sql);

			rs = PST.executeQuery();
			rs.next();
			System.out.println("selectDate try");
			return rs.getString(1); 
			
		}catch(Exception ex){
			System.out.println("selectDate error : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	//���� ����Ʈ�� ǥ�õ�...user_name �������� ���
	public String getUser_Name(String userid){//�߰�
		
		String sql="";
		rs =null;
		
		try{
			CN = ds.getConnection();
			sql = "select user_name from kakao_user where user_id=?"; 
			PST=CN.prepareStatement(sql);

			PST.setString(1, userid);
			rs = PST.executeQuery();
			rs.next();
			System.out.println("getUser_Name try");
			return rs.getString(1); //�̸� ��ȯ
			
		}catch(Exception ex){
			System.out.println("getUser_Name error : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
		return null; 
		
	}
	
	//�۾��� ���(�۾��⸸)
	public int Insert(Cmb_bean bean){
		String sql="";
		int result=0;
		rs =null;
		
		int ref_num=0;
		
		try{
			CN = ds.getConnection();
			ST=CN.createStatement();
			rs = ST.executeQuery("select max(g_ref) as ref_num from kakao_guest");
			
			if(rs.next()){
				ref_num += 1;
			}
						
			sql = "insert into kakao_guest(g_idx, g_date, g_name, g_userId,";
			sql+=" g_content, g_public, g_ref, g_lev, g_seq)";
			sql+=" values(guestbook_seq.nextval,sysdate,?,?,?,?,?,?,?)";
				
		
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getG_name()); //name ,not null
			//PST.setString(2, this.selectDate()); //date ,not null //������ ����..
			PST.setString(2, bean.getG_userId());//userId ,not null
			PST.setString(3, bean.getG_content());//content ,not null
			PST.setString(4, bean.getG_public());//public(String "1", "0")
			PST.setInt(5, ref_num); //ref
			PST.setInt(6, 0); //lev
			PST.setInt(7, 0);//seq
			
			System.out.println("Insert try");
			result=PST.executeUpdate();
			
			
		}catch(Exception ex){
			System.out.println("Insert error : "+ex); //!error!
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
		return result; // ���ŵ� ���Ǽ� ��ȯ
	}
	
	//���� �� ������Ʈ�ϴ� ���(������)
	public int update(Cmb_bean bean){
		String sql="";
		int result=0;
		rs =null;
		
		try{
			CN = ds.getConnection();
			//���� ���� id(pkey), �ٲ�°�: ����, �������� 
			sql ="update kakao_guest set g_content=?, g_date=sysdate where g_idx=?";
			
			PST=CN.prepareStatement(sql);
			
			PST.setString(1, bean.getG_content());//content ,not null
			PST.setInt(2, bean.getG_idx()); 
			
			result=PST.executeUpdate();
						
		}catch(Exception ex){
			System.out.println("update error : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
		
		return result; //���ŵ� ���� �� ��ȯ
	}
	
	// ���� ���� ���
	public void delete(int g_idx){
		String sql="";
		rs =null;
		System.out.println("  delete�޼ҵ�� g_idx : " + g_idx +"   ");
		try{
			CN = ds.getConnection();
			sql ="delete from kakao_guest where g_idx=?";

			PST=CN.prepareStatement(sql);
			PST.setInt(1, g_idx); //id(��������ȣ ,not null
			PST.executeUpdate();
						
		}catch(Exception ex){
			System.out.println("delete error : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
	}
	
	//� ������ ��ȣ�� �����ϵ� DB���� �� ����� ī��Ʈ
	public int getCount(){
			String sql="";
			int result=0;
			int cnt = 0;
			rs =null;
			
			try{
				CN = ds.getConnection();
				sql ="select count(*) from kakao_guest";
				ST=CN.createStatement();
				rs = ST.executeQuery(sql);
				
				if(rs.next()){
					cnt=rs.getInt(1);
				}
				System.out.println("getCount success");
			}catch(Exception ex){
				System.out.println("getCount error : "+ex);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(PST!=null) try{PST.close();}catch(SQLException ex){}
				if(ST!=null) try{ST.close();}catch(SQLException ex){}
				if(CN!=null) try{CN.close();}catch(SQLException ex){}
			}
			
			return cnt; //��ü �� ���� ��ȯ
	}
	
	//(�����ÿ� Cmb_bean���� �ҷ����� ���)
	public Cmb_bean getCmb(int g_idx){
		String sql="";
		Cmb_bean bean = new Cmb_bean();
		int result=0;
		rs =null;
		
		try{
			CN = ds.getConnection();
			sql ="select * from kakao_guest where g_idx=?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, g_idx);
			rs = PST.executeQuery();
			
			if(rs.next()){ //g_idx�� �´� select�� DB ���� cmb_bean��ü�� set��.
				bean.setG_idx((rs.getInt("g_idx")));
				bean.setG_date((rs.getDate("g_date")));
				bean.setG_name((rs.getString("g_name")));
				bean.setG_content((rs.getString("g_content")));
				bean.setG_public((rs.getString("g_public")));

			}
			
			
		}catch(Exception ex){
			System.out.println("getCmb error : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
		
		return bean; //������ cmb_bean��ü ��ȯ
	}
	
	//list(���� �ؿ� ��ġ)�� �Ѹ� Cmb_bean��ü(��)�� �����ؼ� jsp(cmb_list.jsp)�� �����ϴ� ���
	public List<Cmb_bean> getList(int startRow, int endRow, String userid){
		System.out.println("startRow!!!!=="+startRow);
		System.out.println("endRow!!!!=="+endRow);
		String sql="";
		ResultSet rs2;
		List<Cmb_bean> beanlist = new ArrayList<Cmb_bean>();
		rs =null;
		try{ //
			CN = ds.getConnection();
			sql ="select * from("+
				 "select rownum rnum, g_idx, g_date,g_name, g_content, g_public from("+
				 "select * from kakao_guest order by g_idx desc))"+
				 "where rnum >=? and rnum <=?";
			
			PST = CN.prepareStatement(sql);
			PST.setInt(1, startRow);
			PST.setInt(2, endRow);
			rs = PST.executeQuery();
			
			//������ �ش��ϴ� ����� ArrayList<Cmb_bean>�� ��� List<Cmb_bean>Ÿ������ ����
			if(rs.next()){ 
				do {
					Cmb_bean bean = new Cmb_bean();
					System.out.print((rs.getInt("G_IDX"))+"  "); //�ش� ���� idx�� �޾ƿͼ�
					bean.setG_idx((rs.getInt("G_IDX")));
					
					System.out.print((rs.getTimestamp("G_DATE"))+"  ");
					bean.setG_date((rs.getTimestamp("G_DATE")));
					
					System.out.print((rs.getString("G_NAME"))+"  ");
					bean.setG_name((rs.getString("G_NAME")));
					
					System.out.print((rs.getString("G_PUBLIC"))+"  ");
					bean.setG_public((rs.getString("G_PUBLIC")));
					
					
					System.out.print((rs.getString("G_CONTENT"))+"       ");
					bean.setG_content((rs.getString("G_CONTENT")));
					
					
					
					//(20�� ������ �߰�) ����,������ư ���� ���� 
					String sql2 = "select g_userId from kakao_guest where g_idx=? and g_userId=?";
					System.out.print("userid:"+userid);
					
					PST = CN.prepareStatement(sql2);
					PST.setInt(1, rs.getInt("G_IDX")); // ���⿡���� ����
					PST.setString(2, userid);
					rs2 = PST.executeQuery();
						
					if(rs2.next()){//
						System.out.print("   writer : " +(rs2.getString(1))+"\n");
						bean.setG_userId((rs2.getString(1)));
					}else{
						bean.setG_userId("defaultId");
						System.out.println();
					}
					
					beanlist.add(bean);
	
				} while (rs.next());
				
				System.out.println("\ngetList success : ");
				return beanlist; // ��� ��ȯ
								
			}else{
				System.out.println("test");
				return java.util.Collections.emptyList();			
				}
		
		}catch(Exception ex){
			System.out.println("getList error : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(PST!=null) try{PST.close();}catch(SQLException ex){}
			if(ST!=null) try{ST.close();}catch(SQLException ex){}
			if(CN!=null) try{CN.close();}catch(SQLException ex){}
		}
		return null;
		
	}


}
