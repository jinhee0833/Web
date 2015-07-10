package admin.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import member.common.DB;

public class DBSQL_re {
	private Connection CN; //DB�����������, ��ɾ� ����
	private Statement ST; //������ ��ɾ� ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //���������
	private int total; //���ڵ尹��
	
	private int limit=10; //1~10�� ����
	private String pnum; //request.getParameter("pageNUM")
   	private int pageNUM;
	private int pageCount; //���������� 900/10=>90
	private int start; //�������ȣ
	private int end; //�����ȣ
	private int temp; 
	private int startPage; //����������
	private String returnPage;
	
	public DBSQL_re(){
		CN=DB.getConnection();
	}
	
	public int boardInsert(DBbean_re bean){
		int success=0;
		
		try{
			sql="insert into reviewboard values(review_seq.nextval, ?, ?, ?, sysdate, 0, 0, ?, 0)";
			PST=CN.prepareStatement(sql);			
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContents());
			PST.setString(3, bean.getWriter());
			PST.setString(4, bean.getPwd());			
			success=PST.executeUpdate();
			if(success>0){  System.out.println("�Խ���DB��� ����");}
		}catch(Exception ex){ System.out.println("DBSQL_re.java  �̿��ı��Ͽ��� : "+ex.toString()); }
		return success;
	}//insert END
	
	public List<DBbean_re> boardSelect(String pnum){
		List<DBbean_re> list=new ArrayList<DBbean_re>();
		try{
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);
			
			start=total()-((pageNUM-1)*limit);
			end=total()-((pageNUM*limit)-1);
			System.out.println("total="  + total()+", start="+start+", end="+end);
						
			sql="select * from (select rownum rn, num, title, contents, writer, wdate, count, reco, pwd, count from reviewboard order by wdate desc) where rn between "+end+" and "+start;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			while(RS.next()==true){
				DBbean_re bean=new DBbean_re();
				bean.setNum(RS.getInt("num"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setCount(RS.getInt("count"));
				bean.setReco(RS.getInt("reco"));
				bean.setPwd(RS.getString("pwd"));
				bean.setCmtcount(RS.getInt("count"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("DBSQL_re.java �̿��ı� List ���� ~~~~ : "+ex.toString()); }
		return list;
	}//select() END
	
	public int total(){
		try{
			String sql2="select count(*) as cnt from reviewboard ";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	
	public DBbean_re boardDetail(String nn){
		DBbean_re bean=new DBbean_re();
		readCount(nn);
		try{
			sql="select * from reviewboard where num="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(RS.getInt("num"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setCount(RS.getInt("count"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
			}
		}catch(Exception ex){ System.out.println("DBSQL_re.java  �̿��ı�Detail ���� : "+ex.toString());  }
		return bean;
	}//detail() END
	
	public DBbean_re boardDetail(String nn, String reco){
		DBbean_re bean=new DBbean_re();
		readCount(nn);
		try{
			if(reco!=null){
				sql="update reviewboard set reco=reco+1, count=count-1 where num="+nn;
				PST=CN.prepareStatement(sql);
				PST.executeUpdate();
			}
			
			sql="select * from reviewboard where num="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(RS.getInt("num"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setCount(RS.getInt("count"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setReco(RS.getInt("reco"));
			}
		}catch(Exception ex){ System.out.println("DBSQL_re.java  �̿��ı�Detail ���� : "+ex.toString());  }
		return bean;
	}//detail() 2 END

	
	public int dbEdit(DBbean_re bean){
		int ok=0;
		try{
			sql="update reviewboard set title=?, contents=? where num="+bean.getNum()+" and pwd="+bean.getPwd();
			System.out.println(sql);
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContents());
			
			ok=PST.executeUpdate();
			System.out.println(ok);
		}catch(Exception ex){ System.out.println(" DBSQL_re.java  �������� :" + ex.toString());  }
		return ok;
	}//eddit() END
	
	public int cmtcountEdit(int ss){
		DBbean_re bean=new DBbean_re();
		int ok=0;
		try{
			sql="update reviewboard set count=? where num="+ss;
			System.out.println(sql);
			PST=CN.prepareStatement(sql);
			PST.setInt(1, bean.getCmtcount());
			
			ok=PST.executeUpdate();
			if(ok>0){ System.out.println("��ۼ� db���� ���� ");  }
		}catch(Exception ex){ System.out.println("DBSQL_re.java  cmtcountEdit ���� :" + ex.toString());  }
		return ok;
	}//eddit() END
	
	public void dbDelete(String data1, String data2){
		try{
			sql="delete from reviewboard where num="+data1+" and pwd="+data2;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("��������");  }
		}catch(Exception ex){ System.out.println("DBSQL_re.java  �������� :"+ex.toString()); }
	}//dbDelete() END
	
	public void readCount(String num){
		String sql = "update reviewboard set count = count + 1 where num=?";
		int n=Integer.parseInt(num);
		try{
			PST = CN.prepareStatement(sql);
			PST.setInt(1, n);
			int res = PST.executeUpdate();
		}catch(Exception e){  System.out.println("DBSQL_re.java  readCount(String)��ȸ�� ���� : "+e.toString());  }
	}//readCount() END

}//class END
