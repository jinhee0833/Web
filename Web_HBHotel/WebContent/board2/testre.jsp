<%@page import="java.security.acl.LastOwnerException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.hb.common.DBRebean"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>testre</title>
</head>
<body>

<script type="text/javascript">
	function writeSave(){
		if (f.writer.value==""){
			alert("아 이 디을 입력하세요!!");
			f.writer.focus();
			return false;
		}
		if (f.content.value==""){
			alert("내용을 입력하세요!!");
			f.content.focus();
			return false;
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력하세요!!");
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>

<%
int count =0;
int pageSize =0;
int currentPage = 0;
%>

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
			DBRebean db = (DBRebean)data.get(i);
		
			if (count!=0){%>
		<table width="850" border="1">
			<tr>
					<td align="center"><%=number--%></td>  
					<td>
		<%			if (db.getRere_level()>0){ %> 
							<img src="<%=request.getContextPath()%>/images/level.gif" 
												width="<%=15*db.getRere_level()%>" height="15">
							<img src="<%=request.getContextPath()%>/images/re.gif">								
		<%			}%>

			<%if(db.getReexcel()>5){ %> 
					<img src = "<%=request.getContextPath()%>/images/hot.gif">
			<%} %>
					</td>
					<td align="center"><%=db.getRewriter()%></td>
					<td align="center"><%=db.getReexcel()%></td>
					<td align="center"><%=db.getReprison()%></td>
					<td align="center">
						  <%=db.getRecontent() %>
					</td>
				</tr>
		</table>
<%
			}
	 	}
 }catch(Exception ex){}
%>
<%
		int renum = 0;
		int num = 0;
		int reref = 0;
		int rere_step = 0;
		int rere_level = 0;
		String filename = "";
		String resnum = request.getParameter("renum");
		String snum = request.getParameter("num");
		if(snum == null){
			num = 190 ;
		}
		System.out.println("resnum=>>"+resnum);
		if (resnum != null){//답글
			renum = Integer.parseInt(resnum);
			reref = Integer.parseInt(request.getParameter("reref"));
			rere_step = Integer.parseInt(request.getParameter("rere_step"));
			rere_level = Integer.parseInt(request.getParameter("rere_level"));
			filename = request.getParameter("filename");// filename////
		}
%>
<form name="f" action="qrwc.do" method="post" onsubmit="return writeSave()" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="renum" value="<%=renum%>">
	<input type="hidden" name="reref" value="<%=reref%>">
	<input type="hidden" name="rere_step" value="<%=rere_step%>">
	<input type="hidden" name="rere_level" value="<%=rere_level%>">
	<table width="850" border="1">
		<tr height="5">
			<td  bgcolor="yellow" align="center">이 름</th>
			<td><input type="text" name="rewriter" size="10"></td>
			<td  bgcolor="yellow"  align="center">비밀번호</th>
			<td><input type="password" value="1234"  name="repasswd"></td>
		</tr>
		<tr height="100">
			<td colspan="3"><textarea name="recontent" rows="5" cols="50"></textarea> </td>
			<td> <input type="submit" value="댓글" style="width: 100px; height: 100px">  </td>
		</tr>
	</table>
</form>
</body>
</html>