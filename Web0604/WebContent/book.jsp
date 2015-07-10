<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title> [book] </title> 
	<style type="text/css">
		td,a{font-size:20pt; text-decoration:none; }
		a:hover{ 
		 	font-size:30pt; 
			color:blue; 
			text-decoration:underline;
			font-family:Comin Sans MS;
		}
	</style>
</head>

<body>
   <font size=7 color=red><b> [book.jsp]</b></font><p>
	   
   <table width="700" border="1" cellspacing="0">
   	 <tr align="center">
   	 	<td colspan=5> 
   	 		<img src="images/bar.gif"> 
   	 	</td>
   	 </tr>
   	 
   	 <tr bgcolor=yellow height=60>
   	 	<td>사 번</td>  <td>이 름</td> <td>제 목</td>
   	 	<td>날 짜</td>  <td>급 여</td>
   	 </tr>
   	 
   	 <tr>
   	 	<td>1100</td>  <td>IBM</td> <td>computer</td>
   	 	<td>06-05</td>  <td>27</td>
   	 </tr>
   	 
   	 <tr>
   	 	<td>2200</td>  <td>kB</td> <td>bank</td>
   	 	<td>06-07</td>  <td>74</td>
   	 </tr>
   	 
   	 <tr>
   	 	<td>3300</td>  <td>HP</td> <td>print</td>
   	 	<td>06-08</td>  <td>31</td>
   	 </tr>
   </table>
   
   <!-- 5행 4열 -->
   <p><br>
   <table width="700" border="1" cellspacing="0">
   		<tr bgcolor="pink" height="60">
   			<td> 사 번 </td> <td> 이 름 </td>
   			<td> 제 목 </td> <td> 비 고 </td>
   		</tr>
   		
   		<tr>
   			<td>1100</td> 
   			<td>IBM</td> 
   			<td>computer</td>
   			<td rowspan=4>
   				&nbsp;<img src="images/pen2.gif">공지사항<img src="images/pen2.gif">
   				<br>
   				 &nbsp;&nbsp;<img src="images/star.gif">지각하기<br>
   				 &nbsp;&nbsp;<img src="images/star.gif">늦잠자기<br>
   			     &nbsp;&nbsp;<img src="images/star.gif">결석금지<br>
   			</td>
   		</tr>
   		
   		<tr>
   			<td>2200</td>  <td>kB</td> <td>bank</td>
   		</tr>
   		
   		<tr>
   			<td>3300</td>  <td>HP</td> <td>print</td>
   		</tr>
   		
   		<tr>
   		   <td>7700</td>  <td>rim</td> <td>hb</td>
   		</tr>
   </table>
   
    <!-- ul, ol, DD -->
   <p><br>
   <h1>
	   <ul>
	   		<li>웹서버</li>
	   		<li>메일서버</li>
	   		<li>db서버</li>
	   </ul>
	   
	   <p>
	   <b>아메리카노</b><br>
	   <i>아메리카노</i><br>
	   <s>아메리카노</s><br>
	     아메리카노<br>
	   <u>아메리카노</u><p>
	    
	   <img src="images/bar.gif" height=100 width=700><p>
	   &lt;img src="images/bar.gif" height=100 width=700&gt;
	   
	   <p><br>
	   <DL>
	   	<dt>jsp및서블릿
	   		<dd>
	   			웹프로그램을 대표하는 서버페이지 프로그램입니다.<br>
	   			ASP, PHP, JSP 3종류가 있으면 
	   			JSP는 톰캣웹서버로<br> 작업을 하도록 하겠습니다.<br>
	   			페이스북, 싸이월드, 신한은행 인터넷뱅크 문서에서 확인<br>
	   			작업을 하도록 하겠습니다.
	   		</dd>
	   	</dt>
	   </DL>
   </h1>
   
   
   <br><br><br><br><br><br><br><br><br><br><br><br>
   <p>
</body>
</html>














