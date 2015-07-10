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
				alert("사번데이타가 공백입니다");
				document.myform.sabun.focus();
				return false;//아래문장수행하지않고 함수탈출
			}else{ document.myform.name.focus(); }
			
			//사번자릿수 4자리 체크
			var size = document.myform.sabun.value.length;
			if(size != 4){ 
				alert("사번데이타의 자릿수는 4자리입니다");
				document.myform.sabun.value="";
				document.myform.sabun.focus();	
				return ; 
			}
			
			if(nm==""){
				alert("이름데이타가 공백입니다");
				document.myform.name.focus( );
				return false;//아래문장수행하지않고 함수탈출
			}else { document.myform.title.focus( ); }
			
			//사번,이름,제목,급여 =>모든입력란 적합한데이타를 입력하면 진짜 저장되도록
			document.myform.submit( );
		}//move end 
		
		function greeting( ){
			//window.open(1,2,"3창상태 창크기 메뉴바 상태바옵션")
		   	window.open("popup.jsp", "title", "top=200, left=300,menubar=no, width=300,height=400" );
		}//end
		
		function idcheck( ){
			if(document.myform.sabun.value==""){
				alert("아이디=사번데이타가 공백입니다");
				document.myform.sabun.focus();
				return false;
			}
			//4자릿수 체크하면 좋아요
			open("openID.jsp", "title", "top=400, left=300, width=300,height=100" );
		}//end
		function zipcheck( ){
			if(document.myform.zipcode1.value=="" ){
				alert("우편번호=주소데이타가 공백입니다");
				document.myform.zipcode1.focus();
				return false;
			}
			if(document.myform.zipcode2.value=="" ){
				alert("우편번호=주소데이타가 공백입니다");
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
		<b>사번:</b> 
			<input type="text" name="sabun" size=10> 
			<input type="button" value="아이디중복" onClick="idcheck()" ><br>
		
		<b>이름:</b> 
		  <input type="text" name="name" size=25> <br>
		<b>제목:</b> 
		  <input type="text" name="title" value="snow" size=25> <br>
		<b>급여:</b> 
		  <input type="text" name="pay" value="27" size=25> <p>
		  <b>우편:</b>
			<input type="text" name="zipcode1" size=5 onkeyup="check()">
			-
			<input type="text" name="zipcode2" size=5 onkeyup="check()">
			<input type="button" value="우편번호" onclick="zipcheck()"><br>
			<b>주소:</b>
			<input type="text" name="address" size=25  ><p>  
		<input type="button"  value="데이타저장"  onClick="move( )" > &nbsp;
		<input type="reset"   value="입력데이타취소">
			
	</form>
	
	<p>
	<h1>
		<a href="guest.jsp">[등록화면]</a>
		<a href="guestList.jsp">[전체출력]</a>
		<a href="guestDelete.jsp">[데이타삭제]</a>
	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










