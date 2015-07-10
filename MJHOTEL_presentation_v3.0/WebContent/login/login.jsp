<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page session="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="reservation.common.revDBbean" %>
<%@ page import="reservation.common.revDBsql" %>
<%@ page import="reservation.common.roomDBbean" %>

<html>
<head>
<title>Login</title>
<script type="text/javascript">
	var request = null;

	function tart() {
		request = new XMLHttpRequest();
		var ID = myform.name.value;
		var PW = myform.secret.value;
		if (ID == "" || PW == "") {
			alert("�����Դϴ�.");
		} else {
			var url = "login.do?loginID=" + ID + "&loginPW=" + PW;
			request.onreadystatechange = ResultDisp;
			//callback method������ ()�� ���� �Ѵ�.
			request.open('GET', url, true);
			request.send(null);
		}
	}
	
	  function ResultDisp() {
			if (request.readyState == 4 && request.status == 200) {
				
				var data = request.responseXML;
				var tagA = data.getElementsByTagName("login")[0].childNodes[0].nodeValue;
				if (tagA == 'true') {
					var tagC = location.reload();
				
				} else {
					alert("�α��� �����Ͽ����ϴ�.")
				}
			}// if end	
		} //end 
</script>	
</head>

<body>
<%
if(session.getAttribute("NowUser")==null){
%>
	<div id="message">
		<form name="myform" action="join.jsp">
		<span class="logintext">ID &nbsp;<input type="text" name="name" style="width:70px;"></span>
		<span class="logintext">PW &nbsp;<input type="text" name="secret" style="width:70px;"></span>
		<span><a href="#" class="logintext" onClick="tart()">�α���</a></span>
		<span class="text">&nbsp; / &nbsp;</span>
		<span><a href="login/join.jsp" class="logintext" >ȸ������</a></span>	
		</form>
	</div>	
<%
  } else { String id=(String)session.getAttribute("NowUser"); 
 	 if(id.equals("admin")){
	  %>
	<span class='logintext'><%=id %> ������ ��&nbsp;</span>
  	<span><a href='member.do' class='logintext'>������������</a></span>
  	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href='#' class='logintext' onClick="window.location='login/SessionLogout.jsp'">Logout</a></span>
	<%
 	 }else if(id!="admin"){ 
	%>
  	<span class='logintext'><%=id %> ���� ��&nbsp;</span>
		<%
		if(id!=null){
		%>		
		<span class='logintext'><a href='revStep3.do?&id=<%=id %>'>����Ȯ��</a></span>
		
  	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href='memberDetail.do?id=<%=id %>' class='logintext' onClick=''>ȸ������</a></span>
  	<%
		}
	%>
  	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href='#' class='logintext' onClick="window.location='login/SessionLogout.jsp'">Logout</a></span>  		
<%			
 	 }
  }
%>
</body>
</html>
