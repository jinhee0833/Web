package net.hb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.hb.dto.GuestDTO;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class GuestDAO extends SqlMapClientDaoSupport{
	public void dbInsert(GuestDTO dto){
		try{
				this.getSqlMapClientTemplate().insert("add",dto);
				System.out.println("dbInsert(GuestDTO) 저장성공\n");
		}catch(Exception ex){
			System.out.println("dbInsert(GuestDTO) error:"+ex);
		}
	}//end
	
	public void dbEdit(GuestDTO dto){
		try{
			this.getSqlMapClientTemplate().update("edit",dto);
		}catch(Exception ex){
			
		}
	}
	
//	public GuestDTO dbDetail(int num){
//		
//		GuestDTO  dto = new GuestDTO( );
//		dto = (GuestDTO)getSqlMapClientTemplate().queryForObject("detail", num);
//		
//
//		return dto;
//		
//		
//	}//end
	
	public List<GuestDTO> dbDtail(GuestDTO dto){
		System.out.println("dbDtail");
		List<GuestDTO> list = new ArrayList<GuestDTO>();
		list = (List<GuestDTO>)getSqlMapClientTemplate().queryForList("detail",dto);
		return list;
	}
	
	public List<GuestDTO> dbSelect(){
			List<GuestDTO> list = null;
			list = this.getSqlMapClientTemplate().queryForList("selectAll");
			System.out.println("dbSelect");
			return list;
	}//end
	
	public void dbDelete(GuestDTO dto){
		try{
			this.getSqlMapClientTemplate().delete("del",dto);
			System.out.println("삭제 성공");
		}catch(Exception ex){
			System.out.println("에러: " + ex);
		}
		
	}//end
	
	public int dbCount(){
		int cnt=0;
		try{
			System.out.println("dbCount");
			
			cnt = (int)getSqlMapClientTemplate().queryForObject("countAll");
		
		}catch(Exception ex){
			System.out.println("에러  "+ex);
		}
		return cnt;
	}//end
	
	public List<GuestDTO> dbSearch(GuestDTO dto){
		List<GuestDTO> list = new ArrayList<GuestDTO>();
		try{
			System.out.println("dbsearch");
			list= getSqlMapClientTemplate().queryForList("search2", dto);
		}catch(Exception ex){
			System.out.println("에러: " + ex);
		}
	
		return list;
	}//end
	
}//class END
