<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="event.vo.EventVO" %>
<%@ page import="java.util.*, java.text.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>event7 list</title>
</head>
<body>
<font size="5" style="font-weight:bold;">Event</font>
<hr color="black">
<%!           
	private int 		num;
	private int			rownum;
	private String 	filename;
	private String 	th_filename;
	private String 	title;
	private String 	content;
	private String 	e_start;
	
	private String 	e_end;
	private int 	e_START;
	private int 	e_END;
	private String		today;
	private int			toDAY;
	private java.util.Date sdate;
	private int 		hit;
	private int 		c_count;
	
	private  int 	 	total=0, pagecount=1;  
	private 	String 	dnum;
	private 	int		dNUM;
	
	private  String 	pnum; // <a href=guestList.jsp?pageNUM
	private  int 	 	pageNUM;
	private  int 	 	limit=5, pagesize=5 ;
	private  int 	 	startpage=1, temp=1;
	
%>
<%
	List<EventVO> list = (List<EventVO>) request.getAttribute("naver");
	String st = (String) request.getAttribute("count");
	total = Integer.parseInt(st);

	pnum = request.getParameter("pageNUM");
	if(pnum==null || pnum==""){ pnum="1";}
	pageNUM= Integer.parseInt(pnum);	
	
	dnum = request.getParameter("dnum");
	if(dnum==null || dnum==""){ dnum="0";}
	dNUM = Integer.parseInt(dnum);
	
	if(total%limit==0){ pagecount = total/limit; }
	else{ pagecount = total/limit+1; }

	temp = (pageNUM - 1) %limit;	//81, 82, [83],,,89, 90 => 83-81=2 
	startpage = pageNUM-temp;		//[81]~90

	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
	today = simpleDate.format(date);
	toDAY = Integer.parseInt(today);
	
	if(dNUM>0){
		 for(int i=0; i<list.size(); i++){
			 EventVO bean = (EventVO) list.get(i);
			 if(bean.getNum()==dNUM){
%>
<!-- ------------------------------------------------------------- Detail -->
			  <table width= 700  border="0"  cellspacing="0">
			  		<tr bgcolor="#dddddd">
			  			<th width=5% >NO.</th>
						<th width=30% >Date</th>
						<th>Title</th>
						<th width=5% >Hit</th>
			  		</tr>
			  		<tr align=center>
			  			<td><%=bean.getNum() %></td>
			  			<td><%=bean.getE_start() %> ~ <%=bean.getE_end() %></td>
			  			<td><%=bean.getTitle() %></td>
			  			<td><%=bean.getHit() %></td>
			  		</tr>
			  		<tr align=center>
			  			<td colspan=4><br><img src = "<%=request.getContextPath()%>/board/event/images/<%=bean.getFilename()%>"><br></td>
			  		</tr>
			  		<tr>
			  			<td colspan=4><br><%=bean.getContent() %><br></td>
			  		</tr>
<!-- ------------------------------------------------------------------ reply insert/list -->
					<tr>
			  			<td colspan="4">
			  			<jsp:include page="eventReply.jsp" flush="false">
							<jsp:param value="<%=dNUM %>" name="dnum"/>
						</jsp:include>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td colspan="4" align=right>
			  				<input type=button onClick="javascript=location.href='g_e_list.do?pageNUM=<%=pageNUM%>'" value="목록으로">
			  			</td>
			  		</tr>
			  				
			  		
			  </table>
<%			 
			 }//if
		 }//for
	}//if
%>
<br>
 <table width= 700 border="0" cellspacing=0>
		<tr>
			<td colspan=6 align="right"><font size=1">총 <%=total %>글</font>
			</td>
		</tr>
		<tr bgcolor="#dddddd">
			<th width=5% ></th>
			<th width=30% >Date</th>
			<th colspan=2>Title</th>
			<th width=5% >Hit</th>
		</tr>
<%
  try{	  
	 for(int i=0; i<=list.size(); i++){
		 EventVO bean = (EventVO) list.get(i);
		 	e_start = simpleDate.format(bean.getE_start());
			e_START = Integer.parseInt(e_start);
		 	e_end = simpleDate.format(bean.getE_end());
			e_END = Integer.parseInt(e_end);
%>
  		<tr onmouseOver="style.backgroundColor='#eeeeee' "
		 	onmouseOut="style.backgroundColor='' " >
<%				if(e_END > toDAY && e_START<toDAY){ %>
 			<td align="center"><img src = "<%=request.getContextPath()%>/board/event/images/eventongoing.png"></td>
<% 			}else{ %>
			<td align="center"><img src = "<%=request.getContextPath()%>/board/event/images/eventend.png"></td>
<% 			}%>
 			<td align="center"><%=bean.getE_start() %> ~ <%=bean.getE_end() %> </td>
 			<td><img src="<%=request.getContextPath()%>/board/event/images/<%=bean.getFilename()%>" height=40  width=70></td>
 			<td><a href='g_e_list.do?dnum=<%=bean.getNum()%>&pageNUM=<%=pageNUM%>'><%=bean.getTitle()%></a></td>
 			<td align="center"><%=bean.getHit() %></td>
 		</tr>
<%		 
	 }//for end
  }catch(Exception ex) {  }	
%>	
<!-- ------------------------------------------------------------- Paging -->
	<tr align="center" height="45">
		<td colspan=6>
<%
			if(startpage>limit){
			  out.println("<a href='g_e_list.do?pageNUM="+(startpage-limit)+"'>[이전]</a>");
			}
			for(int i=startpage; i<(startpage+limit); i++){
				if(i == pageNUM){
				  out.println("<font size='4' color='red')>["+(i)+"]</font>");}
				else{
				  out.println("<a href='g_e_list.do?pageNUM="+(i)
						  										+"'>["+i+"] </a>");	
					}
				if(i >= pagecount){ break; }
			}//for end
			if((startpage+limit-1) < pagecount){
			
				  out.println("<a href='g_e_list.do?pageNUM="+(startpage+limit)
						  										+"'>[다음]</a>");
			}
%>
		</td> 
	</tr>
 </table>
</body>
</html>