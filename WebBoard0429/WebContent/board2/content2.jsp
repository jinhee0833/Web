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
	<font size=6 color=red><b> [�� �� �� �� ��] </b></font><br>
	<table border="1" width="600" height="300">
		<tr>
			<th bgcolor="yellow" width="20%">�۹�ȣ</th>
			<td align="center" width="30%"><%=db.getNum()%></td>
			<th bgcolor="yellow" width="20%">��ȸ��</th>
			<td align="center" width="30%"><%=db.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=db.getWriter()%></td>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=db.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">������</th>
			<td colspan="3"><%=db.getSubject()%></td>
		</tr>
		<tr height="50%">
			<th bgcolor="yellow" width="20%">�۳���</th>
			<td colspan="3"><%=db.getContent()%></td>
		</tr>
		
		<tr height="50%">
			<th bgcolor="yellow" width="10%">IP������</th>
			<td colspan="3" >
			  <%=db.getIp()%> 
			</td>
		</tr>
		
		<tr height="70%">
			<th bgcolor="yellow" width="10%">�̹���</th>
			<td colspan="3"  align="center">
			  <img src="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>"  height=40  width=150>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" bgcolor="yellow" align="center">
				<input type="button" value="��۾���" style="font-size:12pt;"
					onClick="window.location='writeForm2.jsp?num=<%=db.getNum()%>&ref=<%=db.getRef()%>&re_step=<%=db.getRe_step()%>&re_level=<%=db.getRe_level()%>'">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۼ���"   style="font-size:12pt;" onClick="window.location='updateForm2.jsp?num=<%=db.getNum()%>'">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۻ���"  style="font-size:12pt;" onClick="window.location='deleteForm2.jsp?num=<%=db.getNum()%>'">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="�۸��"  style="font-size:12pt;" onClick="window.location='list2.jsp'">
			</td>
		</tr>
	</table>
</div>
