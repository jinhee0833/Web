<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>


    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="net.hb.common.DBGuestBean" %>
    
    <%!
    private int total ;
 	private int success = 0 ;
 	private int pageCount = 5 ;
 	private int row = 5 ;
 	private String ggtotal ; 
	private String pNum ;
 	private int pageNum = 1 ;
 	private int pageAll ;
 	private int start ;
 	private int end ;
 	private int temp = 1;
 	private int startPage = 1;
 	
 	private String field ;
 	private String word ;
    %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol;}
		
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol; color:black;}
		.facility{
		position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
		}
		
		#f{
			position: absolute;
			margin-left: 200px; 
			top: 50px;
			width: 10px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}
		
		#m{
			position: absolute;
			margin-left: 500px; 
			top: 50px;
			width: 1100px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			
			
		}

</style>
<script type="text/javascript">

function deluser() {
	open("Userdel.jsp", "title", "titlebar=no, left=200, top=200, width=300, height=10");
	}
</script>
</head>

<body>
	<div class="facility">
		
		<%@ include file="managerbar.jsp"%>
		<div id = "f" >
			MANAGER
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > GUEST
		<h1>GUEST</h1><br>
		
	
	
		
<table width=700 border=0>
	<tr>
 		<td colspan=6 align='right'>
 		<%
 		 try{	
 			List data = (List)request.getAttribute("list");
 			total=data.size() ;
 			
 		%>
 			검색된 회원 : <%=total%>
 		</td>
 	</tr>
 
	<tr height="35" align="center"  bgcolor=#81725F>
		<td width=10% >ID</td>
		<td width=15% >Name</td>
		<td width=10% >Sex</td>
		<td width=15% >Birth</td>
		<td width=20% >Call</td>
		<td width=30% >Email</td> 
	</tr>
	</table>
	
<table border=0 width=700>
<%

	pNum =(String)request.getAttribute("pageN") ;
	pageNum = Integer.parseInt(pNum) ;
	
	field =(String)request.getAttribute("field") ;
	word =(String)request.getAttribute("word") ;
	
	
	 if(total%row==0){pageAll = total/row ;}
	 else pageAll = total/row +1 ;

	 if(pageNum%pageCount==0) { startPage = (pageNum/pageCount-1)*pageCount+1 ;}
	 else  {startPage = (pageNum/pageCount)*pageCount+1 ;}
	 
	 start = (pageNum-1)*pageCount ;	
	 end = start + row ;
	 
	if(total!=0){
	for(int i=start ; i<end; i++) {		
	DBGuestBean bean = (DBGuestBean)data.get(i) ;
	if(i==data.size()) break ;	
	
		if(bean.getId().equals("master")){
			i=i+1;
			end=end+2;		
		}else{
%>
	<tr height='30' align='center'>
		<td width=10%><%=bean.getId()%></td>
		<td width=15%><%=bean.getName()%></td>
		<td width=10%><%=bean.getSex()%></td>
		<td width=15%><%=bean.getBirth()%></td>
		<td width=20%><%=bean.getCall()%></td>
		<td width=23%><%=bean.getEmail()%></td> 
		<td width=7%>
		<%if(bean.getId().equals("master")){%><font color=red><b>관리자</b></font>
		<%}else{%>
		<a href="Userdelete.do?userid=<%=bean.getId()%>">탈퇴</a>
		<%}%>
		</td> 
	</tr>
<% 
		}
	}// for	
	}else{
%>
	<tr height='30'>
		<td align="center" colspan=4>회원없음</td>
	</tr>
<% }
	
	
}catch(Exception ex){System.out.println(ex.toString());}
 %>

<tr height='50'>
	<td colspan=6 align='center'>
	<%
	    if (startPage==1) ;
	    else {
		     out.print("<a href='managerguset.do?pageNum="+(startPage-pageCount)+"'>［이전］</a>" );
	    }//else
		  		
	    	
	    	
	    	
		for(int i=startPage ; i<startPage+pageCount ; i++){
			if(i==pageNum){%> <font color = red>［<%=i%>］</font> <%}			
			else {
			
			%>			
			<a href="managerguset.do?pageNum=<%=i%>&keyfield=<%=field %>&keyword=<%=word %>"> <font color = blue>[<%=i%>]</font> </a>
			<%
			} //else
			if(i>=pageAll) break ;		
		}//for
						
		
		
		
		
		if ((startPage+pageCount) < pageAll) {
			out.print("<a href=managerguset.do?pageNum="+(startPage+pageCount)+">［다음］</a>" );
		}//if
		
		
	%>
	</td>
</tr>

</table>
<table width=700 border=0>
	<tr>
		<td align="center">
		<form action="managerguset.do">
			<b><font style="font-size : 11pt;" color="blue"> 검색 : </font></b>
				<select name='keyfield'>
					<option value="userid"> 아이디 </option>
					<option value="username"> 이 름  </option>
				</select>
				<input type='text' name='keyword' >
				<input type='submit' value='검색'>		
		</form>
		</td>
	</tr>
</table>
	
	


		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>