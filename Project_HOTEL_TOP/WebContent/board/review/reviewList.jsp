<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="review.vo.reviewVO" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>review list</title>
<link href="css/main/bootstrap.css" rel='stylesheet' type='text/css' />
	<style>
		.td a {color: #000;}
		
		.paging a {
			color: #000;
			font-size: 17px;
		}
	</style>

	<script type="text/javascript">
     function send(){ alert("추천되었습니다!"); }
     function mysend(){ alert("본인글은 추천할수없습니다."); }
  </script>
</head>  
 
<body>
<%!           
	private int 		num;
	private int			rownum;
	private String 	title;
	private String 	content;
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
	private  int 	 	ppnum=0;  // num = totalpage  - ( ) * limit ; 
	
	private  String 	skey; //select에서 선택한 항목
	private  String 	sval; //검색키워드
	private  String 	sqry; //검색에필요한 쿼리문
	private  String 	returnpage ; //이름검색 g => [1][2][3][4][5]
	private  String 	user;
	private  String roomid;
	private   int  count ; 
%>
<%
	user = (String)session.getAttribute("user");
	List<reviewVO> list = (List<reviewVO>) request.getAttribute("naver");
	String st = (String) request.getAttribute("count");
	total = Integer.parseInt(st);
	
	if(total%limit==0){ pagecount = total/limit; }
	else{ pagecount = total/limit+1; }
	
	pnum = request.getParameter("pageNUM");
	if(pnum==null || pnum==""){ pnum="1";}
	pageNUM= Integer.parseInt(pnum);	
	
	dnum = request.getParameter("dnum");
	if(dnum==null || dnum==""){ dnum="0";}
	dNUM = Integer.parseInt(dnum);

	temp = (pageNUM%limit) - 1;	
	startpage = pageNUM-temp;		
	count= (total)-((pageNUM-1)*5);
	
	if(dNUM>0){
		 for(int i=0; i<list.size(); i++){
			 reviewVO bean = (reviewVO) list.get(i);
			 if(bean.getNum()==dNUM){
%>
<!-- ------------------------------------------------------------- Detail -->
	
			<table border="0"  class="table table-striped" style="margin-bottom: 0">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 50%" />
					<col style="width: 20%" />
					<col style="width: 20%" />
				</colgroup>
			  		<tr bgcolor="#dddddd">
			  			<th>NO.</th>
			  			<th>Title</th>
			  			<th>Writer</th>
			  			<th>Date</th>
			  		</tr>
			  		<tr align=center>
			  			<td><%=bean.getRownum() %></td>
			  			<td><%=bean.getTitle() %></td>
			  			<td><%=bean.getName() %></td>
			  			<td><%=bean.getSdate() %></td>
			  		</tr>
			  		<tr>
			  			<td colspan=4><br><%=bean.getContent() %><br><br>
			  			<div align="center">
			  		<%if(user.equals(bean.getName())){%><img src="images/hitch.png" width=50 height=50 onclick="mysend()"><br>
			  		<%}else {%><a href="review_hotup.do?num=<%=bean.getNum()%>&hot=<%=bean.getHot()%>&roomid=<%=roomid%>" onclick="send()">
	      			 <img src="images/hitch.png" width=50 height=50></a><br> 
	      		<%} %> <%=bean.getHot() %>명이 좋아합니다!
	      			</div>
			  		 </td>
			  	</tr>
			  	<tr><td colspan="4"></td></tr>
			  </table>
	
						<div align="right">
			  			 <a class="btn btn-default" href="review_list.do?&roomid=<%=roomid%>" role="button">List</a>


<%if(user.equals(bean.getName())){%>		
							 <a class="btn btn-default" href="review_detail.do?idx=<%=bean.getNum()%>&roomid=<%=bean.getRoomID() %>" role="button">Edit</a>
							 <a class="btn btn-default" href="review_delete.do?idx=<%=bean.getNum()%>&roomid=<%=bean.getRoomID() %>" role="button">Delete</a>	  		 
<%}%>
<%if(user.equals("admin")){%>	 	
							<a class="btn btn-default" href="../../review_delete.do?idx=<%=bean.getNum()%>&roomid=<%=bean.getRoomID() %>" role="button">Delete</a>	
<%} %>
				</div><br><br>

<%			 
			 }
		 }
	}
%>
	<div align="right">
		<a class="btn btn-default" href="board/review/reviewInsert.jsp?roomid=<%=roomid%>" role="button">Write</a>
	</div>
 <table border="0" class="table table-striped"  style="margin-bottom: 0">
 		<colgroup>
			<col style="width: 10%" />
			<col style="width: 50%" />
			<col style="width: 20%" />
			<col style="width: 20%" />
		</colgroup>
 		<tr bgcolor="lightgray">
 			<th>No.</th>
 			<th>Title</th>
 			<th>Writer</th>
 			<th>Date</th>
 		</tr>
<%

  try{	  
	 for(int i=0; i<list.size(); i++){
		 reviewVO bean = (reviewVO) list.get(i);
		 roomid = bean.getRoomID();
		 
%>
  		<tr onmouseOver="style.backgroundColor='#dddddd' "
		 	onmouseOut="style.backgroundColor='' " height="40">
 			<td align="center"><%=count--%></td>
 			<td><a href='review_list.do?dnum=<%=bean.getNum()%>&pageNUM=<%=pageNUM%>&roomid=<%=roomid%>'><%=bean.getTitle() %>&nbsp;
 			
<%if((bean.getHot() > 0)){%>
	<SUP>[<%=bean.getHot() %>]</SUP>
<%} %>

<%if(bean.getHot()>100){ %>
&nbsp;&nbsp;<font color="red"><SUB>[hot!!]</SUB> </font></a></td>
<%} %>
			<td><%=bean.getName() %></td>
 			<td align="center"><%=bean.getSdate() %></td>
 		</tr>
<%		 
	 }//for end
  }catch(Exception ex) {  }	
%>		
	<tr>
	 <td colspan="4"></td>
	</tr>
</table>

 <!-- ------------------------------------------------------------- Paging -->
		<nav style="text-align: center;">
			<ul class="pagination">
					<%
					if (startpage > limit) {
						out.println("<li><a href='review_list.do?pageNUM=" + (startpage - limit) + "&dnum=" + (dNUM) +"&roomid="+(roomid)+ "' aria-label='Previous'>"
								+"<span aria-hidden='true'>&laquo;</span></a></li>");
					}
					for (int i = startpage; i < (startpage + limit); i++) {
						out.println("<li><a href='review_list.do?pageNUM=" + (i) + "&dnum=" + (dNUM) +"&roomid="+(roomid)+ "'>" + i + " </a></li>");
						if (i >= pagecount) {
							break;
						}
					} //for end
					if ((startpage + limit - 1) < pagecount) {
						out.println("<li><a href='review_list.do?pageNUM=" + (startpage + limit) + "&dnum=" + (dNUM) +"&roomid="+(roomid)+ "' aria-label='Previous'>"
						+"<span aria-label='Next'>&raquo;</a></li>");
					}
				%>
			</ul>
		</nav>
</body>
</html>