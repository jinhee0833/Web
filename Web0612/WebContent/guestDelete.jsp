<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestDelete]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
	<script type="text/javascript">
	function  note(){
		var sb = document.myform.sabun.value;
		var nm = document.myform.name.value;
		if(sb=="" || sb==null){
			alert("�������Ÿ�� �����Դϴ�");
			document.myform.sabun.focus();
			return false;//�Ʒ�������������ʰ� �Լ�Ż��
		}else{ document.myform.name.focus(); }
		
		//����ڸ��� 4�ڸ� üũ
		var size = document.myform.sabun.value.length;
		if(size != 4){ 
			alert("�������Ÿ�� �ڸ����� 4�ڸ��Դϴ�");
			document.myform.sabun.value="";
			document.myform.sabun.focus();	
			return ; 
		}//document.myform.submit(); submit()�Լ��� action�Ӽ��� ����
		document.myform.submit();
	}//note end
	
	function book(){ //����üũ charAt( ���� )< '0' || charAt(����)>'9'
		var len = document.myform.sabun.value.length;
		var str = document.myform.sabun.value;
		
		for(var i=0;i<len;i++){
			if(str.charAt(i)<"0" || str.charAt(i)>"9")
			{	
				
				alert("��Ȯ�� ���ڸ� �Է��ϼ���");
				myform.sabun.value=str.substring(0,i);
				
				myform.sabun.focus();
			}
		}
		
		
	}//book end
	function first(){
		document.myform.sabun.value="";
		document.myform.sabun.style.backgroundColor="#00FF00";
		
	}
	</script>
</head>
<body>
	<font size=6 color=red> [guestDelete.jsp] </font><p>
	<form name="myform" method="get" action="guestDeleteSave.jsp">
		<b>�����һ��:</b> 
		<input type="text" name="sabun" value="���ڸ� �Է��ϼ���" onkeyup="book()" onFocus="first()" style="background: '#FF0000'"> 
		<input type="submit"  value="����Ÿ����" onClick="note()"> &nbsp;
	</form>
	
	<p>
	<h1>
		<a href="guest.jsp">[���ȭ��]</a>
		<a href="guestList.jsp">[��ü���]</a>
		<a href="guestDelete.jsp">[����Ÿ����]</a>
	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










