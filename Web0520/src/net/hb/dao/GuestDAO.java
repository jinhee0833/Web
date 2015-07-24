package net.hb.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import net.hb.dto.GuestDTO;

public class GuestDAO  extends SqlMapClientDaoSupport {
	
		public void dbInsert( GuestDTO dto){//InsertController.java����
			try{
				this.getSqlMapClientTemplate().insert("add", dto);
				 System.out.println("dbInsert(GuestDTO)���强��!!!!!");
			}catch(Exception ex){ System.out.println(ex.toString());		}
		}//end
		
		public List<GuestDTO> dbSelect(){//ListController.java����
			 List<GuestDTO> list=null;
			 list=getSqlMapClientTemplate( ).queryForList("selectAll");
			 System.out.println("List dbSelect(X)��ü��ȸ���� 6:21");
			return list ;
		}//end
		
					
		public int  dbCount( ){//��ü���ڵ尹��
			 int cnt=0;
			 cnt=(int)getSqlMapClientTemplate().queryForObject("countAll");
			 return cnt;
		}//end
		
		public int  dbCountSearch(String skey, String sval ){//�˻����ڵ尹��
		 int cnt=0;
		 GuestDTO  dto = new GuestDTO( );
		 dto.setSkey(skey);
		 dto.setSval(sval);
		 cnt=(int)getSqlMapClientTemplate().queryForObject("countSearch", dto);
		 return cnt;
	}//end======================================================================
	
		public GuestDTO  dbDetail(int data){ //DetailController.java����
			  GuestDTO dto = null;
			  dto = (GuestDTO)this.getSqlMapClientTemplate().queryForObject("detail", data);
			  System.out.println(data + " �������Ÿ �Ѱ� ��ȸ ����");
			  return dto;
		}//end
		
		public void  dbDelete( int data){ //DeleteController.java����
			this.getSqlMapClientTemplate().delete("del", data);
			System.out.println(data + " �������Ÿ �������� ��ȸ ����");
		}//end
		
		
		public void  dbEdit(GuestDTO dto){
			 this.getSqlMapClientTemplate().update("edit", dto);
			 System.out.println( dto.getSabun() +" ����Ÿ ��������");
		}//end
		
}//class END



























