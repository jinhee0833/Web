<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, member.vo.*, member.dao.*" %>
<html>
<head><title>�ּ� ã��</title>	
<%
	String search = request.getParameter("addrs");
	DBSQL dbsql = new DBSQL();	
	List<ZIPbean> list = dbsql.dbGetaddr(search);
%>
		<script type="text/javascript">
		function getcheck(zipcode, sido, gugun, dong){
			opener.join.zipcode.value = zipcode; 
			opener.join.addr.value = sido+" "+gugun+" "+dong;
			self.close();
		}	

		function sendcheck( ){
			subform.addrs.value=opener.join.zipcode.value;
		}

	</script>
</head>
<body onLoad="sendcheck( )">

	<form method=post action="addr.do" name=subform >
		<b>�ּ� �˻�: </b>&nbsp;&nbsp;&nbsp;<input type=text name=addrs><input type=submit value=�˻�><p>
		<table border=1 cellspacing=0>
		<tr>
			<td width=100 align=center>�����ȣ</td>
			<td width=100 align=center>�ּ�</td>
		</tr>
		<%for(int i=0; i<list.size(); i++){ %>
		<tr>
			<td><%=list.get(i).getZipcode()%></td>
			<td><a href="javascript:getcheck('<%=list.get(i).getZipcode()%>','<%=list.get(i).getSido()%>', '<%=list.get(i).getGugun()%>', '<%=list.get(i).getDong()%>')">
			<%=list.get(i).getSido()+" "+list.get(i).getGugun()+" "+list.get(i).getDong()%></a></td>
		</tr>
		<%} %>	
		</table>
	</form>
</body>
</html>