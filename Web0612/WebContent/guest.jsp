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
		function  move( ){
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
			}
			
			if(nm==""){
				alert("�̸�����Ÿ�� �����Դϴ�");
				document.myform.name.focus( );
				return false;//�Ʒ�������������ʰ� �Լ�Ż��
			}else { document.myform.title.focus( ); }
			
			//���,�̸�,����,�޿� =>����Է¶� �����ѵ���Ÿ�� �Է��ϸ� ��¥ ����ǵ���
			document.myform.submit( );
		}//move end 
		
		function greeting( ){
			//window.open(1,2,"3â���� âũ�� �޴��� ���¹ٿɼ�")
		   	window.open("popup.jsp", "title", "top=200, left=300,menubar=no, width=300,height=400" );
		}//end
		
		function idcheck( ){
			if(document.myform.sabun.value==""){
				alert("���̵�=�������Ÿ�� �����Դϴ�");
				document.myform.sabun.focus();
				return false;
			}
			//4�ڸ��� üũ�ϸ� ���ƿ�
			open("openID.jsp", "title", "top=400, left=300, width=300,height=100" );
		}//end
		function zipcheck( ){
			if(document.myform.zipcode1.value=="" ){
				alert("�����ȣ=�ּҵ���Ÿ�� �����Դϴ�");
				document.myform.zipcode1.focus();
				return false;
			}
			if(document.myform.zipcode2.value=="" ){
				alert("�����ȣ=�ּҵ���Ÿ�� �����Դϴ�");
				document.myform.zipcode2.focus();
				return false;
			}
			
			open("zipcheck.jsp", "zipcode", "top=400, left=300, width=500,height=400" );
		}//end
		function check(){
			var size1 = document.myform.zipcode1.value.length;
			var size2 = document.myform.zipcode2.value.length;
			var str = document.myform.zipcode2.value;
			if(size1==3){
				document.myform.zipcode2.focus();
			}
			
			if(size2==3){
				document.myform.zipcode2.value = document.myform.zipcode2.value.subString(0,3);
			}
		}
		
	</script>
</head>

<body>
	
	<font size=7><b> [guest.jsp] </b></font><p>
	<form name="myform"  method="post" action="guestSave.jsp">
		<b>���:</b> 
			<input type="text" name="sabun" size=10> 
			<input type="button" value="���̵��ߺ�" onClick="idcheck()" ><br>
		
		<b>�̸�:</b> 
		  <input type="text" name="name" size=25> <br>
		<b>����:</b> 
		  <input type="text" name="title" value="snow" size=25> <br>
		<b>�޿�:</b> 
		  <input type="text" name="pay" value="27" size=25> <p>
		  <b>����:</b>
			<input type="text" name="zipcode1" size=5 onkeyup="check()">
			-
			<input type="text" name="zipcode2" size=5 onkeyup="check()">
			<input type="button" value="�����ȣ" onclick="zipcheck()"><br>
			<b>�ּ�:</b>
			<input type="text" name="address" size=25  ><p>  
		<input type="button"  value="����Ÿ����"  onClick="move( )" > &nbsp;
		<input type="reset"   value="�Էµ���Ÿ���">
			
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










