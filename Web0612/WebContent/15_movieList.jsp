<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head><title> [15_movieList.jsp=363������] </title>
	<style type="text/css">
		input,b,select, td{ font-size:24pt; font-weight:bold;}
		span,div{ font-size:36pt; font-weight:bold;}
		a{text-decoration:none;}
	</style>
</head>
<body>
<%
  String[ ] movieList ={"Ÿ��Ÿ��","�ó׸�õ��","Ȥ��Ż��","ŷ��"};
  pageContext.setAttribute("movieList", movieList);
%>
	<table border="1" width=500>
			<tr bgcolor=yellow  height=50>
		  	 <td>index</td> <td>count</td> <td>title</td>
			</tr>
		<c:forEach var="movie" items="${movieList}" varStatus="status">
			<tr>
			  <td> ${status.index} </td>
			  <td> ${status.count} </td>
			  <td> ${movie} </td>	
			</tr>
		</c:forEach>
	</table>

</body>
</html>








