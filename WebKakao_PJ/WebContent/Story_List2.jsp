<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="WebKakao_PJ.db.*" %>
<html>
<head>
<title>MyStory</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="kakao_header.jsp" %>
<%!
	private int pageSize;
	private int startPage;
	private int pageNUM;
	private int pageCount;
%>
<%
try{
	pageSize = (Integer) request.getAttribute("pageSize");
	startPage = (Integer) request.getAttribute("startPage");
	pageNUM = (Integer) request.getAttribute("pageNUM");
	pageCount = (Integer) request.getAttribute("pageCount");
	
%>
<table width="800" border="0" cellspacing=0 cellpadding=0>
	<tr>
		<td width=25>&nbsp;</td>
		<td style='font-size:1px; width:2px; border:1px solid #000;'>
			<table width="750" border="0" cellspacing=0 cellpadding=0>
				<tr>
					<td height=3>&nbsp;</td>
					<td height=3 width=25>&nbsp;</td>
					<td height=3>&nbsp;</td>
					<td height=3 width=25>&nbsp;</td>
					<td height=3>&nbsp;</td>
					<td height=3 width=25>&nbsp;</td>
					<td height=3>&nbsp;</td>
					<td height=3 width=25>&nbsp;</td>
				</tr>
				<!-- 그림 줄 3개씩 start-->
				<tr>
					<td>&nbsp;</td>	
					<td></td>
				<%
					List list = (List) request.getAttribute("list");
					int temp =1;
					for(int i=0; i<list.size() ; i++){
						Board_bean bean = (Board_bean) list.get(i);
						if(bean.getBrd_file()==null || bean.getBrd_file().equals("")){
				%>
							<td width="188" height="125"><%= bean.getBrd_content() %>, <%= bean.getBrd_idx() %></td>
				<%
						}else{
				%>
					<td><a href="detail.do?idx=<%= bean.getBrd_idx() %>&pageNUM=<%= pageNUM %>&flag=false&action=detail">
					<% if (bean.getBrd_file().equals("noimage.jpg") ){ %>
						<img src="images/noimage.jpg" width="188" height="125" alt="<%= bean.getBrd_date()%> 에  저장한 글 입니다"  border="0"></a>
					<%}else{ %><img src="./imgUpload/<%= bean.getBrd_file() %>" width="188" height="125" alt="<%= bean.getBrd_date()%> 에  저장한 글 입니다"  border="0"></a>
					<% } %></td>
					<td></td>
					
				<%
						}
						if(temp%3 == 0) {
				%>
					<td></td>
				</tr>
				<tr>
					<td colspan=8 height=25></td>
				</tr>
				<tr>
				<td>&nbsp;</td>	
					<td></td>
<%
		}
		temp++;
	}
}catch(Exception ex){ }
%>	
				</tr>		
				<!-- 그림 줄 3개씩 끝 -->

				<!-- 페이징 모듈 -->
				<tr>
					<td colspan=8 align="center">
						<table>
							<tr>
								<td>
<%
	//[이전]
	if(startPage-pageSize>0){
		out.println("<a href='frList.do?pageNUM="+(startPage-1)+"'>[이전]</a>");
	}
	
	//◀
	if(pageNUM-1 > 0){
		out.println("<a href='frList.do?pageNUM="+(pageNUM-1)+"'><font size=2 >◀</font></a>");
	}
	
	//[1][2][3][4]....[10]
	for(int i=startPage ; i<startPage+pageSize ; i++){
		if(i==pageNUM){
			out.println("<font color=red><b>["+i+"] </b></font>");
		}else{
			out.println("<a href='frList.do?pageNUM="+i+"'> ["+i+"]</a>");
		}
		if(i==pageCount) break;
	}
	
	//▶
	if(pageNUM+1 <= pageCount){
		out.println("<a href='frList.do?pageNUM="+(pageNUM+1)+"'> <font size=2 >▶</font></a>");
	}
	
	//[다음]
	if(startPage+pageSize <= pageCount){
		out.println("<a href='frList.do?pageNUM="+(startPage+pageSize)+"'>[다음]</a>");
	}
%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan=8 height=25>&nbsp;</td>
				</td>
			</table>
		</td>
		<td width=25>&nbsp;</td>
	</tr>
</table>
</body>
</html>