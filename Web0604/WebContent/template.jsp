<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title> [template] </title>

	<style type="text/css">
		
		input,select,b,td { font-size:12pt; font-weight:bold;}
		a{
			font-size:12pt; 
			text-decoration: none;
			
		}
		a: hover{font-size: 14pt;
			font-family: comic San MS; color:blue;
		}
	</style>

</head>
<%
	String pageFile = request.getParameter("page");
	if(pageFile==null) { pageFile="main.jsp";}
	else if( pageFile.equals("guest")){ pageFile="guest.jsp"; }
	else if( pageFile.equals("list")){ pageFile="guestList.jsp"; }
	else if( pageFile.equals("delete")){ pageFile="guestDelete.jsp"; }
	else if( pageFile.equals("main")){ pageFile="main.jsp"; }
	
%>
<body>	
	<table  border="1" color=gray cellspacing="0">
		<tr> 
			<td colspan=3 align="left" height="35" width="100%">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		
		<tr>
			<td width="15%" valign="top" style="width:200px;"><br>
				<jsp:include page="left.jsp" />
			</td>
			<td colspan=2 width="85%">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
				<jsp:include page="<%=pageFile %>"/>
			</td>
		</tr>
		
		<tr>
			<td width="100%" colspan=3 height=35 align="center">
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
	</table>
	 
	</body>
</html>





