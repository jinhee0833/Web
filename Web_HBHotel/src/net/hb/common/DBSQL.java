package net.hb.common;

import java.sql.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class DBSQL {

	private Connection CN;
	private Statement ST;
	private PreparedStatement PST;
	private ResultSet RS;
	private String sql;
	private int roomPackage = 3;
	private int total = 0;
	private int success = 0;

	public DBSQL() {

		try {
			CN = DB.getConnection();
		} catch (Exception ex) {
		}
	}

	public int dbReviewInsert(DBListBean bean) {

		try {
			sql = "select max(num) from guest ";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next() == true) {
				int number = RS.getInt(1);
				sql = "insert into guest values(?,?,sysdate,?,?,?,?)";
				PST = CN.prepareStatement(sql);
				number++;
				PST.setInt(1, number);
				PST.setString(2, bean.getTitle());
				PST.setString(3, bean.getName());
				PST.setInt(4, bean.getReadcount());
				PST.setString(5, bean.getContent());
				PST.setInt(6, bean.getCnt());
				success = PST.executeUpdate();
			} else {
				int number = 1;
				sql = "insert into guest values(?,?,sysdate,?,?,?,?)";
				PST = CN.prepareStatement(sql);
				PST.setInt(1, number);
				PST.setString(2, bean.getTitle());
				PST.setString(3, bean.getName());
				PST.setInt(4, bean.getReadcount());
				PST.setString(5, bean.getContent());
				PST.setInt(6, bean.getCnt());
				success = PST.executeUpdate();
			}

		} catch (Exception ex) {
			System.out.println("DBSQL : dbInsert()" + ex.toString());
		}

		return success;

	}// dbInsert

	public List dbReviewSelect(String keyword, String search) {

		List LT = new ArrayList();
		try {
			// sql = "select * from guest order by num desc";
			sql = "select * ";
			sql += "from (select num as re_num , count(*) as count from reply group by num)a, ";
			sql += "(select * from ( ";
			sql += "select rownum rn, A.* from (select * from guest order by num  desc)A))b ";
			sql += "where a.re_num(+) = b.num and " + keyword + " like '%"
					+ search + "%' order by nalja desc";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while (RS.next() == true) {
				DBListBean bean = new DBListBean();
				bean.setNum(RS.getInt("num"));
				bean.setTotal(total);
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setName(RS.getString("name"));
				bean.setReadcount(RS.getInt("readcount"));
				bean.setContent(RS.getString("content"));
				bean.setCnt(RS.getInt("count"));
				LT.add(bean);
			}// while

		} catch (Exception ex) {
		}
		return LT;
	}// dbSelect

	public List dbReviewSearch(String keyword, String search) {

		List LT = new ArrayList();
		try {
			sql = "select * from (select num as re_num , count(*) as count from reply group by num)a, ";
			sql += " (select * from ( select rownum rn, A.* from ";
			sql += " (select * from guest where order by num  desc)A))b ";
			sql += " where a.re_num(+) = b.num and b." + keyword + " like '%"
					+ search + "%' order by nalja desc";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while (RS.next() == true) {

				DBListBean bean = new DBListBean();
				bean.setNum(RS.getInt("num"));
				bean.setTotal(total);
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setName(RS.getString("name"));
				bean.setReadcount(RS.getInt("readcount"));
				bean.setContent(RS.getString("content"));
				bean.setCnt(RS.getInt("count"));

				LT.add(bean);
			}// while

		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return LT;
	}// dbSelect

	public void dbReviewReadcount(String num) {

		String sql = "update guest set readcount = readcount + 1 where num=?";

		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			PST.executeUpdate();
		} catch (Exception e) {
		}
	}

	public DBListBean dbReviewDetail(String num) {

		dbReviewReadcount(num);
		DBListBean bean = new DBListBean();
		try {
			sql = "select * from guest where num =" + num;

			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next() == true) {

				bean.setNum(RS.getInt("num"));
				bean.setTotal(total);
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setName(RS.getString("name"));
				bean.setReadcount(RS.getInt("readcount"));
				bean.setContent(RS.getString("content"));
				bean.setCnt(RS.getInt("cnt"));
			}
		} catch (Exception ex) {
			System.out.println("DBSQL : dbDetail()");
		}
		return bean;
	}

	public void dbReviewDelete(String data) {

		try {
			sql = "delete from guest where num= " + data;
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		} catch (Exception ex) {
		}

	}// dbDelete

	public void dbReviewEdit(DBListBean bean) {

		try {
			int num = bean.getNum();
			String title = bean.getTitle();
			String content = bean.getContent();

			sql = "update guest set title= ?,content= ? ";
			sql += "where num = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, title);
			PST.setString(2, content);
			PST.setInt(3, num);

			PST.executeUpdate();
		} catch (Exception ex) {
		}
	}// dbEdit

	public List<DBRoomBean> dbReservationCheck(String chkIn, String chkOut) {

		ArrayList<DBRoomBean> mroom = new ArrayList<DBRoomBean>();
		try {
			ST = CN.createStatement();
			for (int i = 1; i <= roomPackage; i++) {
				DBRoomBean room = new DBRoomBean();
				sql = "select count(*) as cnt from (select * from inforeservation where "
						+ "chkin < '"
						+ chkIn
						+ "' and chkout > '"
						+ chkIn
						+ "' and chkout <= '"
						+ chkOut
						+ "')a, "
						+ "(select * from product where roompackage = "
						+ i
						+ ")b where a.code = b.code";
				RS = ST.executeQuery(sql);

				if (RS.next() == true) {
					room.setRoomPackageCount(RS.getInt("cnt"));
				}
				sql = "select count(*) as cnt from (select * from inforeservation where chkin >= '"
						+ chkIn
						+ "' and chkout <= '"
						+ chkOut
						+ "')a, (select * from product where roompackage = "
						+ i + ")b where a.code = b.code";
				RS = ST.executeQuery(sql);
				if (RS.next() == true) {
					int count = room.getRoomPackageCount() + RS.getInt("cnt");
					room.setRoomPackageCount(count);
				}
				sql = "select count(*) as cnt from (select * from inforeservation where chkin < '"
						+ chkOut
						+ "' and chkout > '"
						+ chkOut
						+ "')a, (select * from product where roompackage = "
						+ i + ")b where a.code = b.code";

				RS = ST.executeQuery(sql);
				if (RS.next() == true) {
					int count = room.getRoomPackageCount() + RS.getInt("cnt");
					room.setRoomPackageCount(count);
				}
				mroom.add(room);
			}
		} catch (SQLException e) {
			System.out.println("DBSQL : reservationCheck() " + e.toString());
		}
		return mroom;
	}

	public int dbReservationInsert(String chkIn, String chkOut,
			int roomPackage, String loginId, int price) {

		int code = 1;
		try {
			while (true) {
				code = (int) (Math.random() * 1000000000);
				if (code >= 100000000) {
					sql = "select code from product where code = " + code;
					ST = CN.createStatement();
					RS = ST.executeQuery(sql);
					if (RS.next() != true) {
						break;
					}
				}
			}

			sql = "insert into inforeservation values(?,?,?,?,?)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, code);
			PST.setString(2, loginId);
			PST.setString(3, chkIn);
			PST.setString(4, chkOut);
			PST.setInt(5, price);
			PST.executeUpdate();

			sql = "insert into product values(?,?,?)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, code);
			PST.setInt(2, roomPackage);
			PST.setInt(3, price);

			PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("dbReservationInsert()" + e.toString());
		}
		return code;
	}

	public DBReservationBean reservationSearch(int code) {

		DBReservationBean bean = null;
		try {
			bean = new DBReservationBean();
			sql = "select * from inforeservation, product where inforeservation.code=product.code and product.code = "
					+ code;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next() == true) {
				bean.setChkIn(RS.getDate("chkIn"));
				bean.setChkOut(RS.getDate("chkOut"));
				bean.setCode(RS.getInt("code"));
				bean.setUserId(RS.getString("userId"));
				bean.setRoomPackage(RS.getInt("roompackage"));
			}
		} catch (Exception ex) {
			System.out.println("reservationSearch" + ex.toString());
		}
		return bean;
	}

	public int dbReservtionChange(int code, String chkIn, String chkOut,
			String loginId, int roomPackage) {

		try {
			sql = "update inforeservation set chkIn=?, chkOut=?, userId=?, price=? where code=?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, chkIn);
			PST.setString(2, chkOut);
			PST.setString(3, loginId);
			PST.setInt(4, 10000);
			PST.setInt(5, code);
			PST.executeUpdate();

			sql = "update product set chkIn=?, chkOut=?, roomPackage=? where code=?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, chkIn);
			PST.setString(2, chkOut);
			PST.setInt(3, roomPackage);
			PST.setInt(4, code);
			PST.executeUpdate();
		} catch (Exception ex) {
			System.out.println("reservatonChange() " + ex.toString());
		}
		return code;
	}

	public void dbReservationCancel(int code) {

		try {
			sql = "delete from inforeservation where code = " + code;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			sql = "delete from product where code = " + code;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
		} catch (Exception ex) {
			System.out.println("dbReservationCancel() " + ex.toString());
		}
	}

	public DBGuestBean dbReservationUserDetail(String data) {
		DBGuestBean bean = new DBGuestBean();
		try {
			sql = "select * from member where userid='" + data + "'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next() == true) {
				bean.setId(RS.getString("userid"));
				bean.setName(RS.getString("username"));
				bean.setBirth(RS.getInt("birth"));
				bean.setCall(RS.getInt("call"));
				bean.setEmail(RS.getString("email"));
			}// if
		} catch (Exception ex) {
		}
		return bean;
	}

	public int dbJoinInsert(DBGuestBean bean) {

		try {
			sql = "insert into member values(?, ?, ?, ?, ?, ?, ?)";
			PST = CN.prepareStatement(sql);

			PST.setString(1, bean.getId());
			PST.setInt(2, bean.getPw());
			PST.setString(3, bean.getName());
			PST.setString(4, bean.getSex());
			PST.setInt(5, bean.getBirth());
			PST.setInt(6, bean.getCall());
			PST.setString(7, bean.getEmail());

			PST.executeUpdate();

		} catch (Exception ex) {
			System.out.println("dbJoinInsert() : " + ex.toString());
		}
		return success;
	}// dbInsert

	public int dbDeleteMypage(String id) {
		try {
			sql = "delete from member where userid='" + id + "'";
			ST = CN.createStatement();
			success = ST.executeUpdate(sql);
		} catch (Exception ex) {
			System.out.println("dbMypageShow : " + ex.toString());
		}
		return success;
	}

	public DBGuestBean dbMypageShow(DBGuestBean bean) {

		try {
			sql = "select * from member where userid='" + bean.getId() + "'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next()) {
				bean.setPw(RS.getInt("pwd"));
				bean.setName(RS.getString("username"));
				bean.setSex(RS.getString("sex"));
				bean.setBirth(RS.getInt("birth"));
				bean.setCall(RS.getInt("call"));
				bean.setEmail(RS.getString("email"));
			}
		} catch (Exception ex) {
			System.out.println("�똌ypageShow() : " + ex.toString());
		}
		return bean;
	}// dbModify

	public void dbModify(DBGuestBean bean) {

		try {
			sql = "update member set pwd=?,username=?,sex=?,birth=?,call=?,email=? where userid=?";
			PST = CN.prepareStatement(sql);

			PST.setInt(1, bean.getPw());
			PST.setString(2, bean.getName());
			PST.setString(3, bean.getSex());
			PST.setInt(4, bean.getBirth());
			PST.setInt(5, bean.getCall());
			PST.setString(6, bean.getEmail());
			PST.setString(7, bean.getId());

			success = PST.executeUpdate();
		} catch (Exception ex) {
			System.out.println("�똌odify() : " + ex.toString());
		}
	}// dbModify

	public DBGuestBean dbIDFind(DBGuestBean bean) {

		try {
			sql = "select userid, pwd from member";
			sql += " where username='" + bean.getName() + "' and call="
					+ bean.getCall() + " and email='" + bean.getEmail() + "'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next()) {
				bean.setId(RS.getString(1));
				bean.setPw(RS.getInt(2));
			}
		} catch (Exception ex) {
			System.out.println("dbIDFind() : " + ex.toString());
		}
		return bean;
	}// dbFind

	public int dbLogin(DBGuestBean bean) {

		try {
			sql = "select * from member where userid=? and pwd=?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getId());
			PST.setInt(2, bean.getPw());
			success = PST.executeUpdate();
		} catch (Exception ex) {
			System.out.println("dbLogin() : " + ex.toString());
		}
		return success;
	}// dbInsertcheckID

	public int dbJoinCheckID(DBGuestBean bean) {

		try {
			sql = "select count(*) as cnt from member where userid='"
					+ bean.getId() + "'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next()) {
				success = RS.getInt("cnt");
			}
		} catch (Exception ex) {
			System.out.println("dbJoinCheckID() : " + ex.toString());
		}
		return success;
	}// dbCheckID

	public int dbJoinCheckCall(DBGuestBean bean) {

		try {
			sql = "select count(*) as cnt from member where call="
					+ bean.getCall();
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next() == true) {
				success = RS.getInt("cnt");
			}
		} catch (Exception ex) {
			System.out.println("dbJoinCheckCall() : " + ex.toString());
		}
		return success;
	}// dbCheckID

	public List dbManagementSelect(int GpageNum, String Year, String Month) {

		List LT = new ArrayList();
		try {

			sql = "select * from (select * from inforeservation where chkin  like'%"
					+ Year
					+ "/"
					+ Month
					+ "%' order by chkin asc)a, (select * from product)b where a.code = b.code";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while (RS.next() == true) {
				DBRoomBean bean = new DBRoomBean();
				bean.setMroom(RS.getString("roomPackage"));
				bean.setMin(RS.getDate("chkin"));
				bean.setMout(RS.getDate("chkout"));
				bean.setMcode(RS.getString("code"));
				LT.add(bean);
			}// while

		} catch (Exception ex) {
		}
		return LT;
	}// dbSelect

	public int rdbInsert(DBReplybean rbean) {

		int num = rbean.getNum();
		String r_name = rbean.getR_name();
		String r_content = rbean.getR_content();
		try {
			sql = "insert into reply values(?,?,sysdate,?)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, num);
			PST.setString(2, r_name);
			PST.setString(3, r_content);

			success = PST.executeUpdate();
		} catch (Exception ex) {

		}
		return success;

	}// dbInsert

	public ArrayList<DBReplybean> RedbSelect(int num) {

		ArrayList<DBReplybean> LT = new ArrayList<DBReplybean>();
		try {
			sql = "select r_content as cnt, r_name as rname from reply where num="
					+ num;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			while (RS.next() == true) {
				DBReplybean bean2 = new DBReplybean();
				bean2.setR_content(RS.getString("cnt"));
				bean2.setR_name(RS.getString("rname"));

				LT.add(bean2);
			}// while

		} catch (Exception ex) {
		}
		return LT;
	}// dbSelect

	public void dbReplyDelete(int num, String data) {
		try {
			sql = "delete from reply where num= " + num + " and r_content= '"
					+ data + "'";
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		} catch (Exception ex) {
		}

	}// dbDelete

	public List dbManagementguesetSelect(int GpageNum, String Mselect,
			String Mkeyword) {
		List LT = new ArrayList();
		try {
			sql = "select * from member where " + Mselect + " like'%"
					+ Mkeyword + "%'order by userid asc";

			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while (RS.next() == true) {
				DBGuestBean bean = new DBGuestBean();
				bean.setId(RS.getString("userid"));
				bean.setName(RS.getString("username"));
				bean.setSex(RS.getString("sex"));
				bean.setBirth(RS.getInt("birth"));
				bean.setCall(RS.getInt("Call"));
				bean.setEmail(RS.getString("email"));
				LT.add(bean);
			}// while

		} catch (Exception ex) {
		}
		return LT;
	}// dbManagementguesetSelect

	public void dbManagementDelete(String data) {
		try {
			sql = "delete from member where userid='" + data + "'";
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		} catch (Exception ex) {
			System.out.println("fail");
		}

	}// dbDelete

	public int noticeInsert(DBNoticeBean bean) {
		int success = 0;
		int aa = 1;

		try {

			sql = "select max(num) from board5";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next() == true) {
				aa = RS.getInt(1);
				aa++;
				bean.setNum(aa);
			}

			sql = "insert into board5 values(?,?,?,?,?,sysdate)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, bean.getNum());
			PST.setString(2, bean.getWriter());
			PST.setString(3, bean.getTitle());
			PST.setString(4, bean.getContent());
			PST.setString(5, bean.getFilename());

			success = PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("DBSQL.noticeInsert===" + e.toString());
		}
		return success;
	}// noticeInsert end

	public int noticecnt(DBNoticeBean bean, String file, String word) {
		try {
			sql = "select count(*) as cnt from (select * from board5 where "
					+ file + " like '%" + word + "%')";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next() == true) {
				total = RS.getInt("cnt");
				bean.setTotal(total);
			}
		} catch (Exception ex) {
			System.out.println("DBSQL cnt====" + ex.toString());
		}
		return total;
	}

	public List noticeList(int start, int end, String file, String word) {

		List list = new ArrayList<DBNoticeBean>();

		try {
			sql = "select * from (select rownum as rn, num, title, writer, nalja, filename "
					+ "from(select * from board5 where "
					+ file
					+ " like '%"
					+ word
					+ "%' order by nalja asc)"
					+ " order by rn desc) where rn between "
					+ start
					+ " and "
					+ end;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			while (RS.next() == true) {
				DBNoticeBean bean = new DBNoticeBean();
				bean.setNum(RS.getInt("num"));
				bean.setRn(RS.getInt("rn"));
				bean.setWriter(RS.getString("writer"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setFilename(RS.getString("filename"));
				list.add(bean);
			}

		} catch (Exception ex) {
			System.out.println("DBSQL noticeList()==" + ex.toString());
		}
		return list;
	}

	public DBNoticeBean noticeDetail(int num) {
		DBNoticeBean bean = new DBNoticeBean();
		try {
			sql = "select * from board5 where num =" + num;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if (RS.next() == true) {
				bean.setWriter(RS.getString("writer"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));

				bean.setFilename(RS.getString("filename"));

				bean.setNum(RS.getInt("num"));
			}
		} catch (Exception ex) {
			System.out.println("DBSQL.noticeDetail===" + ex.toString());
		}
		return bean;
	}

	public void noticeDelete(int num) {
		try {
			sql = "delete from board5 where num=" + num;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

		} catch (Exception ex) {
			System.out.println("DBSQL.delete==" + ex.toString());
		}
	}

	public int noticeEdit(DBNoticeBean bean) {
		int ok = 0;
		try {
			sql = "update board5 set title=?, content=?, filename=? where num=?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContent());
			PST.setString(3, bean.getFilename());
			PST.setInt(4, bean.getNum());
			ok = PST.executeUpdate();
		} catch (Exception ex) {
			System.out.println("DBSQL.edit===" + ex.toString());
		}
		return ok;
	}

	public DBqnabean getBoard(String num, String mode) throws SQLException {
		if (mode.equals("content")) {
			readcount(num);
		}
		String sql = "select * from board2 where num = ?";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			RS = PST.executeQuery();
			ArrayList<DBqnabean> al = makeContentList(RS);
			return al.get(0);
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();
		}
	} // end

	public int getCount() throws SQLException {
		String sql = "select count(*) from board2";
		try {
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			RS.next();
			int count = RS.getInt(1);
			return count;
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();

		}
	} // end

	public int getReCount() throws SQLException {
		String sql = "select count(*) from board2 a, boardre b where a.num = b.num";
		try {
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			RS.next();
			int count = RS.getInt(1);
			return count;
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();
		}
	} // end

	public ArrayList<DBRebean> listReBoard(String contNum, int start, int end)
			throws SQLException {
		String sql = " select * from " + "(select * from "
				+ " (select rownum rn, A.* from " + " (select * from "
				+ " (select * " + " from boardre " + " where num = " + contNum
				+ ") " + " order by reref desc, rere_step asc)A) "
				+ " where rn between ? and ? )" + " order by sysdate";
		try {
			PST = CN.prepareStatement(sql);
			PST.setInt(1, start);
			PST.setInt(2, end);
			RS = PST.executeQuery();
			ArrayList<DBRebean> al = makeReArrayList(RS);

			return al;
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();
		}
	} // end

	public int getReCount(String num) throws SQLException {
		String sql = "select count(*) from boardre where num = ?";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			RS = PST.executeQuery();
			RS.next();
			int count = RS.getInt(1);
			return count;
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();
		}
	}

	public boolean checkBoard(String num, String passwd) throws SQLException {
		String sql = "select passwd from board2 where num=?";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			RS = PST.executeQuery();
			RS.next();
			String dbPasswd = RS.getString(1);
			if (dbPasswd.equals(passwd)) {
				return true;
			}
			return false;
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();
		}
	} // end

	public int deleteBoard(String num) throws SQLException {
		String sql = "delete from board2 where num = ?";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			int res = PST.executeUpdate();
			return res;
		} finally {
			if (PST != null)
				PST.close();
		}
	}// end

	public ArrayList<DBqnabean> listBoard(int start, int end)
			throws SQLException {

		String sql = "select a.refcnt, b.* "
				+ " from (select num, count(*) refcnt from boardre group by num)a, "
				+ " (select * from (select rownum rn, A.* from "
				+ " (select * from board2 order by ref desc, re_step asc)A) "
				+ " where rn between ? and ?)b " + " where a.num(+) = b.num "
				+ " order by rn";

		try {
			PST = CN.prepareStatement(sql);
			PST.setInt(1, start);
			PST.setInt(2, end);
			RS = PST.executeQuery();
			ArrayList<DBqnabean> al = makeArrayList(RS);

			return al;
		} finally {
			if (RS != null)
				RS.close();
			if (PST != null)
				PST.close();
		}
	} // end

	public ArrayList<DBRebean> makeReArrayList(ResultSet rs)
			throws SQLException {
		ArrayList<DBRebean> al = new ArrayList<DBRebean>();
		while (rs.next() == true) {
			int num = rs.getInt("num");
			int renum = rs.getInt("renum");
			String rewriter = rs.getString("rewriter");
			String repasswd = rs.getString("repasswd");
			String rereg_date = rs.getString("rereg_date");
			int reexcel = rs.getInt("reexcel");
			int rebad = rs.getInt("rebad");
			int reprison = rs.getInt("reprison");
			String recontent = rs.getString("recontent");
			String reip = rs.getString("reip");
			int reref = rs.getInt("reref");
			int rere_step = rs.getInt("rere_step");
			int rere_level = rs.getInt("rere_level");

			DBRebean db = new DBRebean(num, renum, rewriter, repasswd,
					rereg_date, reexcel, rebad, reprison, recontent, reip,
					reref, rere_step, rere_level);
			al.add(db);
		}
		return al;
	} // end

	public ArrayList<DBqnabean> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<DBqnabean> al = new ArrayList<DBqnabean>();
		while (rs.next() == true) {
			int num = rs.getInt("num");
			String writer = rs.getString("writer");
			String email = rs.getString("email");
			String subject = rs.getString("subject");
			String passwd = rs.getString("passwd");
			String reg_date = rs.getString("reg_date");
			int readcount = rs.getInt("readcount");
			String content = rs.getString("content");
			String ip = rs.getString("ip");
			int ref = rs.getInt("ref");
			int re_step = rs.getInt("re_step");
			int re_level = rs.getInt("re_level");
			String filename = rs.getString("filename");
			int refcnt = rs.getInt("refcnt");
			DBqnabean db = new DBqnabean(num, writer, email, subject, passwd,
					reg_date, readcount, content, ip, ref, re_step, re_level,
					filename, refcnt);
			al.add(db);
		}
		return al;
	} // end

	public ArrayList<DBqnabean> makeContentList(ResultSet rs)
			throws SQLException {
		ArrayList<DBqnabean> al = new ArrayList<DBqnabean>();
		while (rs.next() == true) {
			int num = rs.getInt("num");
			String writer = rs.getString("writer");
			String email = rs.getString("email");
			String subject = rs.getString("subject");
			String passwd = rs.getString("passwd");
			String reg_date = rs.getString("reg_date");
			int readcount = rs.getInt("readcount");
			String content = rs.getString("content");
			String ip = rs.getString("ip");
			int ref = rs.getInt("ref");
			int re_step = rs.getInt("re_step");
			int re_level = rs.getInt("re_level");
			String filename = rs.getString("filename");
			DBqnabean db = new DBqnabean(num, writer, email, subject, passwd,
					reg_date, readcount, content, ip, ref, re_step, re_level,
					filename);
			al.add(db);
		}
		return al;
	} // end

	public void readcount(String num) throws SQLException {
		String sql = "update board2 set readcount = readcount + 1 where num=?";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, num);
			PST.executeUpdate();
		} finally {
			if (PST != null)
				PST.close();
		}
	} // end

	public int insertBoard(MultipartRequest mr, String ip) throws SQLException {
		int num = Integer.parseInt(mr.getParameter("num"));
		int ref = Integer.parseInt(mr.getParameter("ref"));
		int re_step = Integer.parseInt(mr.getParameter("re_step"));
		int re_level = Integer.parseInt(mr.getParameter("re_level"));
		int number = 0;
		String sql = "";
		sql = "select max(num) from board2";
		PST = CN.prepareStatement(sql);
		RS = PST.executeQuery();
		if (RS.next() == true) {
			number = ref = RS.getInt(1) + 1;
		} else {
			number = 1;
		}
		if (num == 0) {
			ref = number;
			re_step = 0;
			re_level = 0;

		} else {
			ref = Integer.parseInt(mr.getParameter("ref"));
			sql = "update board2 set re_step = re_step + 1 where ref=? and re_step>?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, ref);
			PST.setInt(2, re_step);
			PST.executeUpdate();
			re_step++;
			re_level++;
		}
		sql = "insert into board2 values(board2_seq.nextval, ?,?,?,?,?,0,?,?,?,?,?,?)";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, mr.getParameter("writer"));
			PST.setString(2, mr.getParameter("email"));
			PST.setString(3, mr.getParameter("subject"));
			PST.setString(4, mr.getParameter("passwd"));
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd");
			PST.setString(5, sdf.format(date));

			PST.setString(6, mr.getParameter("content"));
			PST.setString(7, ip);

			PST.setInt(8, ref);
			PST.setInt(9, re_step);
			PST.setInt(10, re_level);

			PST.setString(11, mr.getFilesystemName("filename"));

			int result = PST.executeUpdate();
			return result;
		} finally {
			if (PST != null)
				PST.close();
		}
	} // end

	public int updateBoard(MultipartRequest mr) throws SQLException {
		String sql = "update board2 set subject=?, email=?, content=?, filename=? where num=?";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, mr.getParameter("subject"));
			PST.setString(2, mr.getParameter("email"));
			PST.setString(3, mr.getParameter("content"));
			String filename = mr.getFilesystemName("filename");
			if (filename == null) {
				filename = mr.getParameter("filename2");
			}
			PST.setString(4, filename);
			PST.setInt(5, Integer.parseInt(mr.getParameter("num")));
			int res = PST.executeUpdate();
			return res;
		} finally {
			if (PST != null)
				PST.close();
		}
	} // end

	public int insertReBoard(MultipartRequest mr, String reip)
			throws SQLException {
		int renum = Integer.parseInt(mr.getParameter("renum"));
		int reref = Integer.parseInt(mr.getParameter("reref"));
		int rere_step = Integer.parseInt(mr.getParameter("rere_step"));
		int rere_level = Integer.parseInt(mr.getParameter("rere_level"));
		int number = 0;
		sql = "select max(renum) from boardre";
		PST = CN.prepareStatement(sql);
		RS = PST.executeQuery();
		if (RS.next() == true) {
			number = reref = renum = RS.getInt(1) + 1;
		} else {
			number = 1;
		}
		if (renum == 0) {
			reref = number;
			rere_step = 0;
			rere_level = 0;

		} else {
			reref = Integer.parseInt(mr.getParameter("reref"));
			sql = "update boardre set rere_step = rere_step + 1 where reref=? and rere_step>?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, reref);
			PST.setInt(2, rere_step);
			PST.executeUpdate();
			rere_step++;
			rere_level++;
		}
		sql = "insert into boardre values(?, ?, ?,?,?,0,0,0,?,?,?,?,?)";
		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, mr.getParameter("num"));
			PST.setInt(2, renum);
			PST.setString(3, mr.getParameter("rewriter"));
			PST.setString(4, mr.getParameter("repasswd"));
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd");
			PST.setString(5, sdf.format(date));
			PST.setString(6, mr.getParameter("recontent"));
			PST.setString(7, reip);
			PST.setInt(8, reref);
			PST.setInt(9, 0);
			PST.setInt(10, 0);

			int result = PST.executeUpdate();
			return result;
		} finally {
			if (PST != null)
				PST.close();
		}
	} // end

	public int dbQnaReply(String userId, String pwd, String reply, int num,
			int reref) {

		int renum = 0;
		System.out.println("ref" + reref);
		try {
			sql = "select max(renum)  from boardre";

			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next() == true) {
				renum = RS.getInt(1) + 1;
			}
			System.out.println(renum);
			sql = "insert into boardre values(?,?,?,?,sysdate,0,0,0,?,?,?,?,?)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, num);
			PST.setInt(2, renum);
			PST.setString(3, userId);
			PST.setString(4, pwd);
			PST.setString(5, reply);
			PST.setString(6, "ip");
			PST.setInt(7, reref);
			PST.setInt(8, 1);
			PST.setInt(9, 1);

			PST.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return success;
	}
}// class