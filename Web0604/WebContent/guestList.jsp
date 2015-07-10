<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="not.hb.common.DBbean" %>


<html>
<head> <title> [guestList.jsp]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<body>

<%!           
	private  String sql;
	private  int Gsabun; //사번
	private  String Gname; //이름
	private  String Gtitle; //제목
	private int record;
	
	private  int start=11; // [2]클릭  11레코드번호
	private  int end=20; //   [2]클릭  20레코드번호
	
	private  int total=0, pagecount=1;  
	///////////////페이징구분에 필요한 필드///////////////////
	private  String pnum; // <a href=guestList.jsp?pageNUM
	private  int pageNUM;
	private  int limit=10, pagesize=10 ;
	private  int startpage=1, temp=1;
	private  int num=0;  // num = 총페이지  - ( ) * limit ; 
	private String returnpage;
	
	
%>

<%
	List list =(List) request.getAttribute("naver");
	String ob = (String)request.getAttribute("count");
	total = Integer.parseInt(ob);
	
	if(total%limit==0){
		pagecount=total/limit;
	}else{
		pagecount=total/limit+1;
	}
	
	pnum = request.getParameter("pageNUM");
	if(pnum==null || pnum==""){
		pnum="1";
	}
	
	pageNUM = Integer.parseInt(pnum);
	
	temp=(pageNUM%limit)-1;
	startpage=pageNUM-temp;
%>	


<table  width=800  border="1"  cellspacing="0">	
	
	<tr align="right"  height="45" bgcolor=yellow>
		<td colspan=6>	
			<font size=6> 레코드갯수: <%=  total %> &nbsp;&nbsp;</font>
		</td> 
	</tr>
	
	<tr bgcolor="pink" align="center" height="45">
		<td>순 서</td> <td>사 번</td> <td>이 름</td>
		<td>제 목</td>  <td>날 짜</td> <td>급 여</td> 
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			
		DBbean bean = (DBbean)list.get(i);
		returnpage = bean.getReturnpage();
		int Gsabun = bean.getSabun();
		String Gtitle = bean.getTitle();
		String Gname = bean.getName();
	%>
	
	<tr>
		<td><%= bean.getRownum() %></td>
		<td> <%= Gsabun%></td>
		<td> <a href="detail.do?idx= <%= Gsabun%>"><%= Gname%></a> </td>
		<td> <%= Gtitle%></td>
		<td><%= bean.getNalja()%></td>
		<td><%= bean.getPay()%></td>
	</tr>	
	<%
		}
	%>
	<tr align="center">
		<td colspan=6>
			<form action="list.do">
				<b>검색:</b>
				<select name="keyfield">
					<option value="name">이름검색</option>
					<option value="title">제목검색</option>
					<option value="content">내용검색</option>
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="검 색">
				
			</form>
		</td>
	</tr>
	
	<!-- 페이지구분 -->
	<tr align="center" height=45>
		<td colspan=6>
			<%	
				
				if(startpage-limit>0){
					
					out.println("<a href=list.do?pageNUM="+(startpage-limit)+returnpage+">[이전]</a>");
				}
				
				for(int i=startpage;i<(startpage+limit);i++){
					if(i==pageNUM){
						
						out.println("<font color=red>["+ i +"]</font>");
					}else{
						out.println("<a href=list.do?pageNUM="+i+returnpage+">["+ i +"]</a> ");	
						
					}
					if(i>=pagecount) break;
				}
			
				if((startpage+limit)<=pagecount){
					out.println("<a href=list.do?pageNUM="+(startpage+limit)+returnpage +">[다음]</a>");
				}
			%>
		</td>
	</tr>

</table>




	<p>
	<h1>
	<a href="guest.jsp">[등록화면] </a>
	<a href="list.do">[전체출력] </a>
	<a href="guestDelete.jsp">[삭제화면] </a>
	<a href="guestEdit.jsp">[데이터수정]</a>
</h1>
</body>
</html>






