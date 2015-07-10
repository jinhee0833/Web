<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head><title> [12_colorSelect.jsp=357페이지] </title>
	<style type="text/css">
		input,b,select{ font-size:24pt; font-weight:bold;}
		span,div{ font-size:36pt; font-weight:bold;}
		a{text-decoration:none;}
	</style>
</head>
<body>
	<!-- span=문자열길이만큼=라인개행X,  div=끝까지=라인개행 -->

	<c:if test="${param.color==1}">
		<div style="background:red;">빨강</div>
	</c:if>
	
	<c:if test="${param.color==2}">
		<div style="background:green;">초록</div>
	</c:if>
	
	<c:if test="${param.color==3}">
		<div style="background:blue;">파란강</div>
	</c:if>
	
	<c:if test="${param.color==4}">
		<div style="background:yellow;">노란색</div>
	</c:if>
	
	<!-- 360페이지 if대신에  choose -->
	<c:choose>
		<c:when test="${param.color==1}">
			<div>redred선택</div>
		</c:when>
		<c:when test="${param.color==2}">
			<div>그린그린선택</div>
		</c:when>
		<c:when test="${param.color==3}">
			<div>블루블루선택</div>
		</c:when>
		<c:when test="${param.color==4}">
			<div>yellow선택</div>
		</c:when>
	    <c:otherwise><span>칼라를 선택하지 않았습니다</span></c:otherwise>
	</c:choose>
	
	<font size=7>
		<a href="12_colorSelectForm.jsp">[12_colorSelectForm.jsp]</a>
	</font>
</body>
</html>








