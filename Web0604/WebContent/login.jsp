<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guest]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
	<script type="text/javascript">
		function move(){
			var sb = document.myform.sabun.value;
			var name = document.myform.name.value;
			if(sb == "" || sb == null){
				alert("��� ����Ÿ�� �����Դϴ�");
				return false;
			}else{
				myform.sabun.focus();
				
			} 
			
			//��� �ڸ��� 4�ڸ� üũ
			/*
			if(document.myform.sabun.length != 4){
				alert("��� ����Ÿ�� 4�ڸ��Դϴ�");
				myform.sabun.value="";
				return false;
			}
			*/
			if(name == "" || name == null){
				alert("�̸� ����Ÿ�� �����Դϴ�");
				return false;
			}else{
				myform.name.focus();
			}
			
			//��� �̸� ���� �޿� -> ��� �Է¶� ������ ����Ÿ�� �Է��ϤŤ� ����Ƿη�
			
			document.myform.submit();
		}// move end
		
		function greeting(){
			window.open("popup.jsp", "title", "top=200, left=300, menubar=no, width=300, height=500");
		}// end greeting
		
		function idcheck(){
			if(document.myform.sabun.value==""){
				alert("��� ����Ÿ�� �����Դϴ�");
				document.myform.sabun.focus();
				return false;
			}
			
			window.open("openID.jsp", "title", "top=200, left=300, width=500, height=150");
			
		}// end idcheck
		
		var xhr;
		function check(){
			xhr = new XMLHttpRequest();
			var dt1 = myform.userid.value;
			var dt2 = myform.pwd.value;
			var url = "login.do?dt1="+dt1+"&dt2="+dt2;
			
			xhr.onreadystatechange = display;
			xhr.open("GET",url,true);
			xhr.send();
			alert("1");
		}//end
		
		function display(){
			if(xhr.readyState==4 && xhr.status==200){
				var ret = xhr.responseText;
				document.getElementById("message").innerHTML = ret;
				alert("2");
			}
			
		}//en
	
	</script>
</head>
<body>
	<font size=7><b> [login.jsp] </b></font><p>
	<div id="message">
	<form method="get" name=myform >
		<b>id:</b> <input type="text" name="userid" value="hb"> <br>
		<b>pwd:</b> <input type="password" name="pwd" value="hb"> <br>
		<input type="button" onclick="check()" value="LOGIN"> &nbsp;
		<input type="reset"   value="Cancel">
	</form>
	</div>
	<p>
	<a href ="guest.jsp">[new create]</a>
	<a href ="list.do">[view list]</a>
	<a href ="guestDelete.jsp">[delete]</a>
	
	<%
	
		out.println("session ID = " + session.getId());
	%>
	<p><br><br><br><br><br><br><br><br><br><br>
	
	 <p><a href="#bottom">Ŭ���ϼ���..</a></p>
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
  <h2 id="bottom">�Ծ��!!</h2>
</body>
</html>