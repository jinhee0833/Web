<%@page import="java.security.acl.LastOwnerException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.hb.common.DBqnabean"%>
<%
int count =0;
int pageSize =0;
int currentPage = 0;
%>

<style>
A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
}

A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
	color: black;
}

 .testlist {
	position: absolute;
	top: 115px;
	padding: 0px;
	hight: 900px;
	background-color: #ffffff;
} 

</style>
<div class="testlist">
	
	<table  width=800 border=0>
		<tr bgcolor=#81725F align="center"  height="35" >
			<td width= 5%>번호</td>
			<td width=40%>제목</td>
			<td width=10%>작성자</td>
			<td width=10%>작성일</td>
			<td width=5%>조회</td>
			<td width=30%>이미지</td>
		</tr>
<%
	try{
	List data = (List)request.getAttribute("list");
 	currentPage=Integer.parseInt(String.valueOf((request.getAttribute("currentPage"))));
 	int startRow=Integer.parseInt(String.valueOf((request.getAttribute("startRow"))));
 	int endRow=Integer.parseInt(String.valueOf((request.getAttribute("endRow"))));
 	count=Integer.parseInt(String.valueOf((request.getAttribute("count"))));
 	int number=Integer.parseInt(String.valueOf((request.getAttribute("number"))));
 	pageSize=Integer.parseInt(String.valueOf((request.getAttribute("pageSize"))));
 	
	for(int i = 0; i<data.size() ; i++){
		DBqnabean db = (DBqnabean)data.get(i);
		if (count==0){
%>
				<tr>
					<td colspan="6"> <font size=6><b> 게시된 글이 없습니다 </b></font></td> 
				</tr>
<%
			}else {
				String date = db.getReg_date().substring(0, 11); 
%>
				<tr>
					<td align="center"><%=number--%></td>  
					<td>
<%			if (db.getRe_level()>0){ %>
							<img src="<%=request.getContextPath()%>
								width="<%=15*db.getRe_level()%>" height="15">
							<img src="<%=request.getContextPath()%>/images/re.gif">	
<%			}%>
							<a href="qnacontcon.do?num=<%=db.getNum()%>"><%=db.getSubject()%></a>
								

			<%if(db.getReadcount()>5){ %> 
					<img src = "<%=request.getContextPath()%>/images/hot.gif">
			<%} 
			if(db.getRefcnt()>0){%>
				<font color="red">[<%=db.getRefcnt() %>] </font>
			<%}
			
			%>글번호 :<%=db.getNum() %>
					</td>
					<td align="center"><%=db.getWriter()%></td>
					<td align="center"><%=date%></td>
					<td align="center"><%=db.getReadcount()%></td>
					<td align="center">
				 	<img src="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>" height=40  width=70>
					</td>
				</tr>
<%				}%>
		<p>
		<%
	}//for()
}catch(Exception ex){}
%>
<tr><td colspan="6" align="center">
<%
			if(count>0){
				int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
				int pageBlock = 3; 
				int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;  
				int endPage = startPage + pageBlock - 1;
				if(endPage>pageCount)endPage = pageCount;
				
				if(startPage > pageBlock){%>
					<a href="qnalist.do?pageNum=<%=startPage-pageBlock%>">[이전]</a>
				<% }
				for(int j=startPage; j<=endPage; ++j){%>
				<a href="qnalist.do?pageNum=<%=j%>"> <font size=3><b> <%=j%> </b></font>  </a>
				<%}
					if(endPage<pageCount){%>
					<a href="qnalist.do?pageNum=<%=startPage+pageBlock%>">[다음]</a>
				<%}
			}%>
</tr></td>
			
			<tr><td colspan="6" align="right">
			<input type="button" value="글쓰기" onclick="window.location='qna.jsp?page=board2/writeForm2.jsp'">
</td></tr>
</table>
</div>

