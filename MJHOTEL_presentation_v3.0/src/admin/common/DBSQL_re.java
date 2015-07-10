package admin.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import member.common.DB;

public class DBSQL_re {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST; //정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //쿼리문기억
	private int total; //레코드갯수
	
	private int limit=10; //1~10개 단위
	private String pnum; //request.getParameter("pageNUM")
   	private int pageNUM;
	private int pageCount; //총페이지수 900/10=>90
	private int start; //시작행번호
	private int end; //끝행번호
	private int temp; 
	private int startPage; //시작페이지
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
			if(success>0){  System.out.println("게시판DB등록 성공");}
		}catch(Exception ex){ System.out.println("DBSQL_re.java  이용후기등록오류 : "+ex.toString()); }
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
		}catch(Exception ex){ System.out.println("DBSQL_re.java 이용후기 List 오류 ~~~~ : "+ex.toString()); }
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
		}catch(Exception ex){ System.out.println("DBSQL_re.java  이용후기Detail 오류 : "+ex.toString());  }
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
		}catch(Exception ex){ System.out.println("DBSQL_re.java  이용후기Detail 오류 : "+ex.toString());  }
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
		}catch(Exception ex){ System.out.println(" DBSQL_re.java  수정실패 :" + ex.toString());  }
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
			if(ok>0){ System.out.println("댓글수 db저장 성공 ");  }
		}catch(Exception ex){ System.out.println("DBSQL_re.java  cmtcountEdit 실패 :" + ex.toString());  }
		return ok;
	}//eddit() END
	
	public void dbDelete(String data1, String data2){
		try{
			sql="delete from reviewboard where num="+data1+" and pwd="+data2;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("삭제성공");  }
		}catch(Exception ex){ System.out.println("DBSQL_re.java  삭제실패 :"+ex.toString()); }
	}//dbDelete() END
	
	public void readCount(String num){
		String sql = "update reviewboard set count = count + 1 where num=?";
		int n=Integer.parseInt(num);
		try{
			PST = CN.prepareStatement(sql);
			PST.setInt(1, n);
			int res = PST.executeUpdate();
		}catch(Exception e){  System.out.println("DBSQL_re.java  readCount(String)조회수 오류 : "+e.toString());  }
	}//readCount() END

}//class END
