package net.hb.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import net.hb.dto.GuestDTO;

public class GuestDAO  extends SqlMapClientDaoSupport {
	
		public void dbInsert( GuestDTO dto){//InsertController.java접근
			try{
				this.getSqlMapClientTemplate().insert("add", dto);
				 System.out.println("dbInsert(GuestDTO)저장성공!!!!!");
			}catch(Exception ex){ System.out.println(ex.toString());		}
		}//end
		
		public List<GuestDTO> dbSelect(){//ListController.java접근
			 List<GuestDTO> list=null;
			 list=getSqlMapClientTemplate( ).queryForList("selectAll");
			 System.out.println("List dbSelect(X)전체조회성공 6:21");
			return list ;
		}//end
		
					
		public int  dbCount( ){//전체레코드갯수
			 int cnt=0;
			 cnt=(int)getSqlMapClientTemplate().queryForObject("countAll");
			 return cnt;
		}//end
		
		public int  dbCountSearch(String skey, String sval ){//검색레코드갯수
		 int cnt=0;
		 GuestDTO  dto = new GuestDTO( );
		 dto.setSkey(skey);
		 dto.setSval(sval);
		 cnt=(int)getSqlMapClientTemplate().queryForObject("countSearch", dto);
		 return cnt;
	}//end======================================================================
	
		public GuestDTO  dbDetail(int data){ //DetailController.java접근
			  GuestDTO dto = null;
			  dto = (GuestDTO)this.getSqlMapClientTemplate().queryForObject("detail", data);
			  System.out.println(data + " 사번데이타 한건 조회 성공");
			  return dto;
		}//end
		
		public void  dbDelete( int data){ //DeleteController.java접근
			this.getSqlMapClientTemplate().delete("del", data);
			System.out.println(data + " 사번데이타 삭제성공 조회 성공");
		}//end
		
		
		public void  dbEdit(GuestDTO dto){
			 this.getSqlMapClientTemplate().update("edit", dto);
			 System.out.println( dto.getSabun() +" 데이타 수정성공");
		}//end
		
}//class END



























