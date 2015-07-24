package member.dao;

import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.util.DBUtil;
import member.vo.DBbean;
import member.vo.ZIPbean;

public class DBSQL {
	private String sql, OK;
	private int total, pageNUM, start, end, pageSize=10, idcnt, join_success, save;
	
	public String loginCheck(String id, String pw){
		OK = "";
		new DBUtil(){
			String sql = "select * from top_login where id = '" + id + "'";
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				if(RS.next()==true){
					if(RS.getString("id").equals(id) && RS.getString("pw").equals(pw)){
						OK = "OK";
					}
				}
			}
		}.execute();
		System.out.println("\nID/PW 확인 성공!");
		return OK;
	}//end

	public List<DBbean> dbSelect(String pnum, String data) {
		List<DBbean> list = new ArrayList<DBbean>();
		if(pnum==null || pnum==""){pnum="1";}
		pageNUM = Integer.parseInt(pnum);
		start = (pageNUM-1)*pageSize+1;
		end = pageNUM*pageSize;
		sql = "select * from(select rownum as rn,id,name,birth,tel,mem from(select * from top_login " + data +")) where rn between " + start+ " and " + end;
		new DBUtil(){
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				while(RS.next()==true){
					DBbean bean = new DBbean();
					bean.setId(RS.getString("id"));
					bean.setName(RS.getString("name"));
					bean.setBirth(RS.getString("birth"));
					bean.setTel(RS.getString("tel"));
					bean.setMem(RS.getString("mem"));
					list.add(bean);
				}
			}
		}.execute();
		System.out.println("\n회원 정보 보기");
		return list;
	}//end

	public int dbCount(String data) {
		total = 0; 
		new DBUtil(){
			String sql = "select count(*) cnt from top_login " + data;
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				if(RS.next()==true){
					total = RS.getInt("cnt");
				}
			}
		}.execute();
		System.out.println("\n레코드갯수 확인!");
		return total;
	}//end
	
	public int dbIdcheck(String id){
		idcnt = 0;
		new DBUtil(){
			String sql = "select count(*) cnt from top_login where id='" + id + "'";
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				if(RS.next()==true){
					idcnt = RS.getInt("cnt");
				}
			}
		}.execute();
		System.out.println("\nID 중복 체크 process 실행");
		return idcnt;
	}//end
	
	public int dbInsert(DBbean bean){
		join_success = 0;
		sql = "insert into top_login values(?,?,?,?,?,?,?,?)";
		new DBUtil(){
			protected void exeSQL() throws Exception{
				PST = CN.prepareStatement(sql);
				PST.setString(1, bean.getId());
				PST.setString(2, bean.getPw());
				PST.setString(3, bean.getName());
				PST.setString(4, bean.getBirth());
				PST.setString(5, bean.getAddr());
				PST.setString(6, bean.getEmail());
				PST.setString(7, bean.getTel());
				PST.setString(8, bean.getMem());
				join_success = PST.executeUpdate();
				System.out.println("\n회원 정보 저장성공");
			}
		}.execute();
		return join_success;
	}//end
	
	public List<ZIPbean> dbGetaddr(String dong) throws SQLException{
		List<ZIPbean> list = new ArrayList<ZIPbean>();
		sql = "select zipcode, sido, gugun, dong from zipcode where dong like '%"+dong+"%'";
		new DBUtil(){
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				while(RS.next()){
					ZIPbean bean = new ZIPbean();
					bean.setZipcode(RS.getString("zipcode"));
					bean.setSido(RS.getString("sido"));
					bean.setGugun(RS.getString("gugun"));
					bean.setDong(RS.getString("dong"));
					list.add(bean);
				}
			}
		}.execute();
		System.out.println("\n주소 가져오기 성공!");
		return list;
	}//end

	public DBbean dbDetail(String id) {
		DBbean bean = new DBbean();
		sql = "select * from top_login where id='" + id + "'";
		new DBUtil(){
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
				while(RS.next()==true){		
					bean.setId(RS.getString("id"));
					bean.setPw(RS.getString("pw"));
					bean.setName(RS.getString("name"));
					bean.setBirth(RS.getString("birth"));
					bean.setAddr(RS.getString("addr"));
					bean.setEmail(RS.getString("email"));
					bean.setTel(RS.getString("tel"));
					bean.setMem(RS.getString("mem"));
				}
			}
		}.execute();
		System.out.println("\n회원 정보 상세보기");
		return bean;
	}//end

	public void dbDelete(String id) {
		sql = "delete from top_login where id='" + id + "'";
		new DBUtil(){
			protected void exeSQL() throws Exception{
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);
			}
		}.execute();
		System.out.println("\n회원 정보 삭제 성공!");
	}//end

	public int dbEdit(DBbean bean, String id) {
		save = 0;
		sql = "update top_login set pw=?, name=?, addr=?, email=?, tel=?, mem=? where id='" + id + "'";
		new DBUtil(){
			protected void exeSQL() throws Exception{
				PST = CN.prepareStatement(sql);
					PST.setString(1, bean.getPw());
					PST.setString(2, bean.getName());
					PST.setString(3, bean.getAddr());
					PST.setString(4, bean.getEmail());
					PST.setString(5, bean.getTel());
					PST.setString(6, bean.getMem());
				save = PST.executeUpdate();
			}
		}.execute();
		System.out.println("\n(dbsql)회원 정보 수정 완료");
		return save;
	}//end
}//class END
