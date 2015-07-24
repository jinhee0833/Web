<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.vo.EventVO" %>
<%@ page import="java.util.*"%>

<html>
<head><title></title>
	<%
	 List eventlist = (List)request.getAttribute("popup");
	EventVO eventdvo = (EventVO) eventlist.get(0);
	%>



	<script type="text/javascript">
		function setCookie(a,b,c){
			var todayDate = new  Date( );
			todayDate.setMinutes(todayDate.getMinutes()+c);
			var msg = a+"="+escape(b)+";path=/;expires=" + todayDate.toGMTString( )+";" ;
			document.cookie=msg;
			
		}//end
		
		function chkClick( ){
			setCookie("info_pop","false", 1);
			self.close( );
		}//end
	</script>
</head>
<body>
<div align="center">
	 
	<img src="<%=request.getContextPath()%>/board/event/images/<%=eventdvo.getFilename() %>"  width=450 height=550>
	<p>
	<font size=6 color=blue>
	</font>
	<p>
	

		<input type="checkbox" name="chk"  onClick="chkClick( )"><b>오늘 하루동안 안보기</b>
</div>	
</body>
</html>