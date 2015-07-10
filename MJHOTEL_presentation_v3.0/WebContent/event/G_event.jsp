<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.common.DBbean" %>
<%!
	private int pageSize = 3; 	
	private int limit = 3;   
	private String pnum;
	private int pageNUM;	
	private int pageCount;
	private int temp;		
	private int startPage;	
	private int total;
	private String pageType;
%> 
<html>
<head>
<title>event.jsp</title>
<link rel="stylesheet" type="text/css" href="event/css/event.css">
</head>
<body>
<div id="eventF">
	<div id="eventF2">
	<div id="event_title2">
	<%
	pageType=(String)request.getAttribute("pageType");
	if(pageType.equals("now")){
	%>
		진행이벤트
	<%}else if(pageType.equals("past")){%>
		종료이벤트
	<%}%>
	</div>
<%
try{	
	total = (Integer)request.getAttribute("total");
	pageNUM = (Integer)request.getAttribute("pageNUM");
	pageCount = (Integer)request.getAttribute("pageCount");
	startPage = (Integer)request.getAttribute("startPage");
	String Fnum = (String)request.getAttribute("num") ;	
	int num = Integer.parseInt(Fnum) ;
	int rownum = total-((pageNUM-1)*limit);

	List detail = (List) request.getAttribute("detail");			
	if(num>0){	
		for(int i=0; i<detail.size(); i++){
			DBbean bean = (DBbean)detail.get(i);
%>
		<!-- 이벤트 상세 -->
		<table id="event_tableF">
			<tr class="event_tableB">
				<td width=10%>NO</td>
				<td width=50%>TITLE</td> 
				<td width=30%>DATE</td> 
				<td width=10%>HIT</td>
			</tr>
			<tr>
				<td><%= rownum %></td>
				<td align="left"><%= bean.getTitle() %></td>
				<td><%= bean.getE_start() %> ~ <%= bean.getE_end() %></td>
				<td style="color:#ff6600"><%= bean.getHit() %></td>
			</tr>	
		</table>
		<div id="event_contentsImg">
			<img src="<%=request.getContextPath()%>/event/files/<%=bean.getFilename()%>">
		</div>
		<div id="event_contents">
			<div id="event_contentsS"><%= bean.getContent().replaceAll("\r\n", "<br>")%></div>
		</div>
		<div id="event_comment">
			<jsp:include page="G_reply.jsp" flush="false">
			<jsp:param name="num" value="<%= num %>" />
			</jsp:include>
		</div>
<% 		
		}//for end
	}//if end
}catch(Exception ex){}
%>	
	<!-- 이벤트 리스트 -->
	
	<div id="event_total">전체글 (<%=total %>)</div>
		<table id="event_tableF">
			<tr class="event_tableB">
				<td width=8%>NO</td>
				<td width=70%>TITLE</td> 
				<td width=14%>DATE</td> 
				<td width=8%>HIT</td>
			</tr>
		<%
		List data = (List) request.getAttribute("list");
		try{
			int rownum = total-((pageNUM-1)*limit);
			for(int i=0; i<data.size(); i++){
				DBbean bean = (DBbean)data.get(i);		
		%>
			<tr onMouseOver="style.backgroundColor='#ebe7e7'" onMouseOut="style.backgroundColor=''" class="td" >
				<td class="td"><%= rownum-- %></td>
				<td class="td" align=left>
				<a href="G_event.do?num=<%= bean.getNum() %>">
				<img src="<%=request.getContextPath()%>/event/files/<%=bean.getTh_filename()%>" style="vertical-align: middle; width:220px; height:90px; padding-right:5px; "> 
				<%= bean.getTitle() %>
				<%if(bean.getHit()>10){ %>
					<img src = "<%=request.getContextPath()%>/event/images/hot.png" width=35 height=35 style="vertical-align: middle;">
				<% } %>
				<% if(bean.getC_count() != 0){ %>
					[<%= bean.getC_count() %>]
				<% } %>
				</a> 
				</td> 
				<td class="td"><%= bean.getE_start() %> ~ <%= bean.getE_end() %></td> 
				<td class="td" style="color:#ff6600"><%= bean.getHit() %></td>
			</tr>	
		<% 		
			}//for end
		}catch(Exception ex){System.out.println(ex.toString());}
		%>	
		</table>
	<!-- 페이징 -->		
		<div id="event_page">
			<%	
			if(startPage > pageSize){ 
				out.println("<a href='G_event.do?pageType="+pageType+"&pageNUM="+(startPage-pageSize)+"'>◀ 이전</a>");
		 	}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>["+i+"]</font>"); }
				else{ 
					out.println( "<a href='G_event.do?pageType="+pageType+"&pageNUM="+i+"'>"+i+"</a>");
				}
				if(i>=pageCount) break;
			}		
			if(pageSize <= pageCount-startPage){
				out.println("<a href='G_event.do?pageType="+pageType+"&pageNUM="+(startPage+pageSize)+"'>다음 ▶</a>");  
			}			
			%>
		</div>
	</div>	
</div>	
</body>
</html>