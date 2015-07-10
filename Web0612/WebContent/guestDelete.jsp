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
		}//document.myform.submit(); submit()함수가 action속성과 연결
		document.myform.submit();
	}//note end
	
	function book(){ //숫자체크 charAt( 숫자 )< '0' || charAt(숫자)>'9'
		var len = document.myform.sabun.value.length;
		var str = document.myform.sabun.value;
		
		for(var i=0;i<len;i++){
			if(str.charAt(i)<"0" || str.charAt(i)>"9")
			{	
				
				alert("정확한 숫자를 입력하세요");
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
		<b>삭제할사번:</b> 
		<input type="text" name="sabun" value="숫자를 입력하세요" onkeyup="book()" onFocus="first()" style="background: '#FF0000'"> 
		<input type="submit"  value="데이타삭제" onClick="note()"> &nbsp;
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










