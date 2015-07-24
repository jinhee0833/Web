package qna.dao;

import java.util.ArrayList;
import java.util.List;
import qna.vo.QnAVO;
import db.util.DBUtil;

public class QnADAO {
	int totalRecordNum = 0;

	public void dbInsert(QnAVO bean) {
		final String sql = "insert into qna values(qna_pk.nextval,?,?,?,?,sysdate,0,?,'')";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, bean.getType());
				PST.setString(2, bean.getTitle());
				PST.setString(3, bean.getName());
				PST.setString(4, bean.getContent());
				PST.setInt(5, bean.getSecret());
				if(PST.executeUpdate()==0)
					System.out.println("QnA dbInsert FAIL!");
			}
		}.execute();
		System.out.println("dbInsert END");
	}// end dbInsert
	
	public List<QnAVO> dbList(String keytype, int pagenum, int start, int end){
		List<QnAVO> list = new ArrayList<QnAVO>( );
		final String sql = "select num, type, title, name, nalja, hit, secret, reply from (select rownum rn, g.* from (select * from qna where type like '%'||?||'%' order by num desc) g) where rn between ? and ?";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, keytype);
				PST.setInt(2, start);
				PST.setInt(3, end);
				RS = PST.executeQuery();
				while(RS.next()){
					QnAVO vo = new QnAVO();
					vo.setNum(RS.getInt(1));
					vo.setType(RS.getString(2));
					vo.setTitle(RS.getString(3));
					vo.setName(RS.getString(4));
					vo.setNalja(RS.getDate(5));
					vo.setHit(RS.getInt(6));
					vo.setSecret(RS.getInt(7));
					vo.setReply(RS.getString(8));
					list.add(vo);
				}
			}
		}.execute();
		
		return list;
	}// end dbList
	
	public QnAVO dbDetail(String num){
		dbHit(num);
		QnAVO vo = new QnAVO();
		final String sql = "select * from qna where num=?";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, num);
				RS =  PST.executeQuery();
				if(RS.next()){
					vo.setNum(RS.getInt(1));
					vo.setType(RS.getString(2));
					vo.setTitle(RS.getString(3));
					vo.setName(RS.getString(4));
					vo.setContent(RS.getString(5));
					vo.setNalja(RS.getDate(6));
					vo.setHit(RS.getInt(7));
					vo.setSecret(RS.getInt(8));
					vo.setReply(RS.getString(9));
				}
			}
		}.execute();
		return vo;
	}// end dbDetail
	
	public void dbHit(String num){
		final String sql = "update qna set hit=hit+1 where num=?";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, num);
				PST.executeUpdate();
			}
		}.execute();
		return;
	}// end dbHit
	
	public int dbCount(String keytype){
		final String sql = "select count(*) as cnt from qna where type like '%'||?||'%'";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, keytype);
				RS = PST.executeQuery();
				if(RS.next()){
					totalRecordNum = RS.getInt(1);
				}
			}
		}.execute();
		return totalRecordNum;
	}// end dbCount

	public void dbUpdate(String num, String type, String title, String content){
		final String sql = "update qna set type=?, title=?, content=? where num=?";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, type);
				PST.setString(2, title);
				PST.setString(3, content);
				PST.setInt(4, Integer.parseInt(num));
				PST.executeUpdate();
			}
		}.execute();
	}// end dbUpdate

	public void dbDelete(String num){
		final String sql = "delete from qna where num=?";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setInt(1, Integer.parseInt(num));
				PST.executeUpdate();
			}
		}.execute();
	}// end dbDelete
	
	public void dbReply(String num, String reply){
		final String sql = "update qna set reply=? where num=?";
		new DBUtil(){
			protected void exeSQL() throws Exception {
				PST = CN.prepareStatement(sql);
				PST.setString(1, reply);
				PST.setInt(2, Integer.parseInt(num));
				PST.executeUpdate();
			}
		}.execute();
	}// end dbReply
}// end class
