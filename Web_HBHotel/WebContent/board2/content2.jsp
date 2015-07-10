<%@page import="java.security.acl.LastOwnerException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.hb.common.DBqnabean"%>
<%@ page import="net.hb.common.DBRebean"%>

<link rel="stylesheet" type="text/css" href="../style.css">
<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">
	function writeSave() {
		if (f.writer.value == "") {
			alert("아 이 디을 입력하세요!!");
			f.writer.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요!!");
			f.content.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요!!");
			f.passwd.focus();
			return false;
		}
		return true;
	}

	function click_btn(reref, num) {
		document.open("qnaReply.jsp?reref=" + reref + "&num=" + num, "popup1",
				"width=500, height=10");
	}
</script>
<%
	int count = 0; //teatre
	int pageSize = 0; //teatre
	int currentPage = 0;//teatre

	DBqnabean db = (DBqnabean) request.getAttribute("dbbean");
	int num = Integer.parseInt(String.valueOf(request
			.getAttribute("num")));

	int recount = Integer.parseInt(String.valueOf(request
			.getAttribute("recount")));
	String pageFile = String.valueOf(request.getAttribute("pageFile"));
	try {

	} catch (Exception ex) {
		System.out.print("content2 catch////");
	}
%>
<div>

	<table border="0" width="600" height="300">
		<tr>
			<th width="20%">글번호</th>
			<td align="left" width="30%"><%=db.getNum()%></td>
			<th width="20%">조회수</th>
			<td align="left" width="30%"><%=db.getReadcount()%></td>
		</tr>

		<tr>
			<td colspan=4><hr></td>
		</tr>

		<tr>
			<th width="20%">작성자</th>
			<td align="left" width="30%"><%=db.getWriter()%></td>
			<th width="20%">작성일</th>
			<td align="left" width="30%"><%=db.getReg_date()%></td>
		</tr>


		<tr>
			<td colspan=4><hr></td>
		</tr>

		<tr>
			<th width="20%">글제목</th>
			<td><%=db.getSubject()%></td>
		</tr>

		<tr>
			<td colspan=4><hr></td>
		</tr>


		<tr height="50%">
			<th width="20%" height=250>글내용</th>
			<td colspan="3"><img
				src="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>"
				height=40% width=70%><br> <%=db.getContent()%></td>
		</tr>


		<tr>
			<td colspan=4><hr></td>
		</tr>

		<tr>
			<td colspan="4" align="right"><input type="button" value="답글쓰기"
				style="font-size: 12pt;"
				onClick="window.location='qna.jsp?page=/board2/writeForm2.jsp&num=<%=db.getNum()%>&ref=<%=db.getRef()%>&re_step=<%=db.getRe_step()%>&re_level=<%=db.getRe_level()%>'">
				&nbsp;&nbsp;&nbsp; <input type="button" value="글수정"
				style="font-size: 12pt;"
				onClick="window.location='qna.jsp?page=/board2/updateForm2.jsp&num=<%=db.getNum()%>'">
				&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
				style="font-size: 12pt;"
				onClick="window.location='qna.jsp?page=/board2/deleteForm2.jsp&num=<%=db.getNum()%>'">
				&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
				style="font-size: 12pt;" onClick="window.location='qnalist.do'">
			</td>
		</tr>


		<tr>
			<td colspan=4><hr></td>
		</tr>
	</table>

	<table>
		<tr>
			<td><%=recount%>개의 댓글</td>
		</tr>
	</table>
	<%
		
	%>
	<div>
		<!-- <%=pageFile%> -->
	</div>

	<%
		try {
			List data = (List) request.getAttribute("list");
			currentPage = Integer.parseInt(String.valueOf((request
					.getAttribute("currentPage"))));
			int startRow = Integer.parseInt(String.valueOf((request
					.getAttribute("startRow"))));
			int endRow = Integer.parseInt(String.valueOf((request
					.getAttribute("endRow"))));
			count = Integer.parseInt(String.valueOf((request
					.getAttribute("count"))));
			int number = Integer.parseInt(String.valueOf((request
					.getAttribute("number"))));
			pageSize = Integer.parseInt(String.valueOf((request
					.getAttribute("pageSize"))));

			for (int i = 0; i < data.size(); i++) {
				DBRebean redb = (DBRebean) data.get(i);
				if (count != 0) {
	%>
	<div style="overflow: auto;">
		<table border="0">
			<tr>
				<td align="left" hidden><%=number--%></td>
				<td width="100">
					<%
						if (redb.getRere_level() > 0) {
					%> <img
					src="<%=request.getContextPath()%>/images/level.gif"
					width="<%=15 * redb.getRere_level()%>" height="15"> <img
					src="<%=request.getContextPath()%>/images/re.gif"> <%
 	}
 %>

					<%
						if (redb.getReexcel() > 5) {
					%> <img
					src="<%=request.getContextPath()%>/images/hot.gif"> <%
 	}
 %>
				</td>
				<td align="left" width="100"><%=redb.getRewriter()%></td>
				<%-- <td align="left"><%=redb.getReexcel()%></td>
                        <td align="left"><%=redb.getReprison()%></td> --%>
				<td align="left"><%=redb.getRecontent()%></td>
				<td width="100"><a
					href="javascript:click_btn('<%=redb.getReref()%>', '<%=db.getNum()%>')">댓글달기</a>
				</td>
			</tr>
		</table>
	</div>
	<%
		}
			}//for(data.size()) end
		} catch (Exception ex) {
			System.out.println("testre의 오류catch");
		}
	%>

	<%
		int renum = 0;
		int reref = 0;
		int rere_step = 0;
		int rere_level = 0;
		String filename = "";
		String resnum = request.getParameter("renum");
		String snum = request.getParameter("num");
		if (snum == null) {
			num = 190;
		}
		if (resnum != null) {
			renum = Integer.parseInt(resnum);
			reref = Integer.parseInt(request.getParameter("reref"));
			rere_step = Integer.parseInt(request.getParameter("rere_step"));
			rere_level = Integer.parseInt(request
					.getParameter("rere_level"));
			filename = request.getParameter("filename");
		}
	%>

	<%
		if (recount > 0) {
			int pageCount = recount / pageSize
					+ (recount % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;

			if (startPage > pageBlock) {
	%>
	<a href="qnacontcon.do?pageNum=<%=startPage - pageBlock%>&num=<%=num%>">[이전]</a>
	<%
		}
			for (int j = startPage; j <= endPage; ++j) {
	%>
	<a href="qnacontcon.do?pageNum=<%=j%>&num=<%=num%>"> <font size=6><b>
				[<%=j%>]
		</b></font>
	</a>
	<%
		}
			if (endPage < pageCount) {
	%>
	<a href="qnacontcon.do?pageNum=<%=startPage + pageBlock%>&num=<%=num%>">[다음]</a>
	<%
		}
		}
	%>
	<form name="f" action="qrwc.do" method="post"
		onsubmit="return writeSave()" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=num%>"> <input
			type="hidden" name="renum" value="<%=renum%>"> <input
			type="hidden" name="reref" value="<%=reref%>"> <input
			type="hidden" name="rere_step" value="<%=rere_step%>"> <input
			type="hidden" name="rere_level" value="<%=rere_level%>">
		<table width="600" border="0">
			<tr height="5">
				<td bgcolor="#81725F" align="left">아 이 디</td>
				<td><input type="text" name="rewriter" size="10"></td>
				<td bgcolor="#81725F" align="left">비밀번호</td>
				<td><input type="password" value="1234" name="repasswd"></td>
			</tr>


			<tr>
				<td colspan=4><hr></td>
			</tr>
			<tr height="100">
				<td colspan="3"><textarea name="recontent" rows="5" cols="50"></textarea>
				</td>
				<td align=right><input type="submit" value="댓글"
					style="width: 100px; height: 100px"></td>
			</tr>
		</table>
	</form>
</div>
