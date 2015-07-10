<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head><title> [two.jsp] </title></head>
<body>
	<h1>	
		<c:set  var="dan" value="-2" > </c:set>
		<!-- 366페이지  forEach반복문 -->		
		<c:catch>
			<c:if test="${dan>0 && dan<10}">
				<c:forEach var="i"  begin="1" end="9" step="1">
					${dan}*${i}=${dan*i}<br>
				</c:forEach>
			</c:if>
			
		</c:catch>
	</h1>
</body>
</html>






