<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board2.*"%>
>    
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="data" class="my.board2.BoardDataBean" />    

<%
		String num = request.getParameter("num");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list2.jsp");
			return;
		}
		BoardDBBean db = data.getBoard(num, "content");   
%> 
<div align="center">
	<font size=6 color=red><b> [글 내 용 보 기] </b></font><br>
	<table border="1" width="600" height="300">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td align="center" width="30%"><%=db.getNum()%></td>
			<th bgcolor="yellow" width="20%">조회수</th>
			<td align="center" width="30%"><%=db.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작성자</th>
			<td align="center" width="30%"><%=db.getWriter()%></td>
			<th bgcolor="yellow" width="20%">작성일</th>
			<td align="center" width="30%"><%=db.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글제목</th>
			<td colspan="3"><%=db.getSubject()%></td>
		</tr>
		<tr height="50%">
			<th bgcolor="yellow" width="20%">글내용</th>
			<td colspan="3"><%=db.getContent()%></td>
		</tr>
		
		<tr height="50%">
			<th bgcolor="yellow" width="10%">IP아이피</th>
			<td colspan="3" >
			  <%=db.getIp()%> 
			</td>
		</tr>
		
		<tr height="70%">
			<th bgcolor="yellow" width="10%">이미지</th>
			<td colspan="3"  align="center">
			  <img src="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>"  height=40  width=150>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" bgcolor="yellow" align="center">
				<input type="button" value="답글쓰기" style="font-size:12pt;"
					onClick="window.location='writeForm2.jsp?num=<%=db.getNum()%>&ref=<%=db.getRef()%>&re_step=<%=db.getRe_step()%>&re_level=<%=db.getRe_level()%>'">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="글수정"   style="font-size:12pt;" onClick="window.location='updateForm2.jsp?num=<%=db.getNum()%>'">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"  style="font-size:12pt;" onClick="window.location='deleteForm2.jsp?num=<%=db.getNum()%>'">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록"  style="font-size:12pt;" onClick="window.location='list2.jsp'">
			</td>
		</tr>
	</table>
</div>
