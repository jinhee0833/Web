<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.board2.*"%>
  

<jsp:useBean id="data" class="my.board2.BoardDataBean" /> 
<div align="center">
<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");	
	if(pageNum == null || pageNum.trim().equals("") || pageNum.equals("null")){
		pageNum = "1";	
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = startRow + 9;
	int count = data.getCount(); //BoardDataBean DAO���� ������.
	int number = count - startRow + 1; //�̹� �������� ������ߵ� ��ȣ.
	if (endRow>=count) endRow = count;	// 
%>
	<font size=6><b> [board2 �Խ��� ����Ÿ���]</b></font>
	<table width="850">
		<tr>
			<td align="center" bgcolor="yellow" height=50>
				<a href="writeForm2.jsp">  <font size=5 color=red><b> [board2���̺� �Խ��Ǳ۾���]  </b></font></a>
			</td>
		</tr>
	</table>
	
	<table width="850" border="1">
		<tr bgcolor="pink"  height=50>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th width=200>�̹���</th>
		</tr>
<%
			
		if (count==0){%>
		<tr>
			<td colspan="6"> <font size=6><b> �Խõ� ���� �����ϴ� </b></font></td> 
		</tr>
<%	}else { 
			ArrayList<BoardDBBean> al = data.listBoard(startRow, endRow);
			for(BoardDBBean db : al){
			%>
					
		<tr>
			<td align="center"><%=number--%></td>
			<td>
<%			if (db.getRe_level()>0){ %>
					<img src="<%=request.getContextPath()%>/images/level.gif" 
										width="<%=15*db.getRe_level()%>" height="15">
					<img src="<%=request.getContextPath()%>/images/re.gif">										
<%			}%>				
					<a href="content2.jsp?num=<%=db.getNum()%>"><%=db.getSubject()%></a>
				
	<%if(db.getReadcount()>5){ %>		
			<img src = "<%=request.getContextPath()%>/images/hot.gif">
	<%} %>
			</td>  
			<td align="center"><%=db.getWriter()%></td>
			<td align="center"><%=db.getReg_date()%></td>
			<td align="center"><%=db.getReadcount()%></td>
			<td align="center">
				  <img src="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>" height=40  width=70>
			</td>
		</tr>
<%		}	
		}%>		
	</table>

<p>
<%
	if(count>0){
		int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1; 
		int endPage = startPage + pageBlock - 1;
		if(endPage>pageCount)endPage = pageCount;
		
		if(startPage > pageBlock){%>
			<a href="list2.jsp?pageNum=<%=startPage-pageBlock%>">[����]</a>
		<% }
		for(int i=startPage; i<=endPage; ++i){%>
		<a href="list2.jsp?pageNum=<%=i%>"> <font size=6><b> [<%= i%>] </b></font>  </a>
		<%} 
			if(endPage<pageCount){%>
			<a href="list2.jsp?pageNum=<%=startPage+pageBlock%>">[����]</a>  
		<%}
	} 
%>
</div>
