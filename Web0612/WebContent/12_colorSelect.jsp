<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head><title> [12_colorSelect.jsp=357������] </title>
	<style type="text/css">
		input,b,select{ font-size:24pt; font-weight:bold;}
		span,div{ font-size:36pt; font-weight:bold;}
		a{text-decoration:none;}
	</style>
</head>
<body>
	<!-- span=���ڿ����̸�ŭ=���ΰ���X,  div=������=���ΰ��� -->

	<c:if test="${param.color==1}">
		<div style="background:red;">����</div>
	</c:if>
	
	<c:if test="${param.color==2}">
		<div style="background:green;">�ʷ�</div>
	</c:if>
	
	<c:if test="${param.color==3}">
		<div style="background:blue;">�Ķ���</div>
	</c:if>
	
	<c:if test="${param.color==4}">
		<div style="background:yellow;">�����</div>
	</c:if>
	
	<!-- 360������ if��ſ�  choose -->
	<c:choose>
		<c:when test="${param.color==1}">
			<div>redred����</div>
		</c:when>
		<c:when test="${param.color==2}">
			<div>�׸��׸�����</div>
		</c:when>
		<c:when test="${param.color==3}">
			<div>����缱��</div>
		</c:when>
		<c:when test="${param.color==4}">
			<div>yellow����</div>
		</c:when>
	    <c:otherwise><span>Į�� �������� �ʾҽ��ϴ�</span></c:otherwise>
	</c:choose>
	
	<font size=7>
		<a href="12_colorSelectForm.jsp">[12_colorSelectForm.jsp]</a>
	</font>
</body>
</html>








