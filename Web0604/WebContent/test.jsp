<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
		
		input,select,b,td { font-size:12pt; font-weight:bold;}
		a{
			font-size:12pt; 
			text-decoration: none;
			
		}
		a:hover{font-size: 14pt;
			font-family: comic San MS; color:blue;
		}
	</style>
	<script type="text/javascript">
		function sendjuso(a,b,c){
			document.writeln("<h1>"+a+" "+ b + " " + c + "</h1>");
		}
	</script>
</head>
<body>
<%
	String area1="서울";
	String area2="마포구";
	String area3="신수동";
%>
	<div align="center">
		<img  src="images/bar.gif" width=1200 height="50"><p>
		<a href="javascript:sendjuso('<%=area1 %>','<%=area2 %>','<%=area3 %>')"><%=area1 %> <%=area2 %> <%=area3 %></a>
	</div>
	
</body>
</html>