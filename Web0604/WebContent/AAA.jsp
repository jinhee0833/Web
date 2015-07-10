<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[AAA]</title>
	<style type="text/css">
		b,input{ font-size:26pt; font-weight:bold; }
		a{font-size:26pt; text-decoration:none; }
		a:hover{ 
		 	font-size:32pt; color:blue; 
			font-family:Comic Sans MS;
		}
	</style>
	<script type="text/javascript">
		function first(){
			xhr= new XMLHttpRequest();
			var str = myform.name.value;
			var url="BBB.jsp?name="+encodeURIComponent(str);
			//var url="BBB.jsp?name="+str;
			xhr.onreadystatechange = two;
			xhr.open("GET",url,true);
			xhr.send();
			
		}
		function two( ){
			if(xhr.readyState==4){
				if(xhr.status==200){
					var  ret = xhr.responseText;
					//alert("ret=" + ret );
					document.getElementById("message").innerHTML = ret ;
				}
			}
		}//end
	</script>
</head>

<body>
<div  id="message" style="font-size:32pt; font-weight:bold;">
   <form  name="myform">
    	<b>이름:</b>
    	<input type="text" name="name" value="snow">
 	    <input type="button" value="Ajax보내기" onClick="first( )" >
   </form>


</div>
<p><br>
  
  <img src="images/bar.gif" width=800><br>
  <img src="images/bar.gif" width=800><br>
  <img src="images/bar.gif" width=800>
</body>
</html>










