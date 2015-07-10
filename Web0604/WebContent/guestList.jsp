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
	private  int Gsabun; //���
	private  String Gname; //�̸�
	private  String Gtitle; //����
	private int record;
	
	private  int start=11; // [2]Ŭ��  11���ڵ��ȣ
	private  int end=20; //   [2]Ŭ��  20���ڵ��ȣ
	
	private  int total=0, pagecount=1;  
	///////////////����¡���п� �ʿ��� �ʵ�///////////////////
	private  String pnum; // <a href=guestList.jsp?pageNUM
	private  int pageNUM;
	private  int limit=10, pagesize=10 ;
	private  int startpage=1, temp=1;
	private  int num=0;  // num = ��������  - ( ) * limit ; 
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
			<font size=6> ���ڵ尹��: <%=  total %> &nbsp;&nbsp;</font>
		</td> 
	</tr>
	
	<tr bgcolor="pink" align="center" height="45">
		<td>�� ��</td> <td>�� ��</td> <td>�� ��</td>
		<td>�� ��</td>  <td>�� ¥</td> <td>�� ��</td> 
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
				<b>�˻�:</b>
				<select name="keyfield">
					<option value="name">�̸��˻�</option>
					<option value="title">����˻�</option>
					<option value="content">����˻�</option>
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="�� ��">
				
			</form>
		</td>
	</tr>
	
	<!-- ���������� -->
	<tr align="center" height=45>
		<td colspan=6>
			<%	
				
				if(startpage-limit>0){
					
					out.println("<a href=list.do?pageNUM="+(startpage-limit)+returnpage+">[����]</a>");
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
					out.println("<a href=list.do?pageNUM="+(startpage+limit)+returnpage +">[����]</a>");
				}
			%>
		</td>
	</tr>

</table>




	<p>
	<h1>
	<a href="guest.jsp">[���ȭ��] </a>
	<a href="list.do">[��ü���] </a>
	<a href="guestDelete.jsp">[����ȭ��] </a>
	<a href="guestEdit.jsp">[�����ͼ���]</a>
</h1>
</body>
</html>






