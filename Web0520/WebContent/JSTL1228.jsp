<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%@  taglib  prefix="c"      uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@  taglib  prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> [JSTL1228.jsp]</title>
</head>
<body>
	<h2> [JSTL1228.jsp] </h2>
<hr></hr>
[����5] if�� <br>
<c:set var="car"  value="�ҳ�Ÿ"></c:set>
<c:if test="${car=='�ҳ�Ÿ'}">
	${car}�� �������Դϴ�
</c:if>

<hr><p>
	<form action="JSTL1228.jsp">
		�����Է�: <input type=text  name=num>
		<input type=submit   value="�����Ǻ�">
	</form>

<c:set var="su"  value="${param.num}"></c:set>
<!-- if~else if~else����� choose, when������ ����  -->
<c:catch>
	<c:choose>
		<c:when test="${su>0}"> ${param.num} �� ��� </c:when>
		<c:when test="${su<0}"> ${param.num} �� ���� </c:when>
		<c:when test="${su==0}">  �����Դϴ� </c:when>
		<c:otherwise> ���ڰ� �ƴմϴ�</c:otherwise>
	</c:choose>
</c:catch>
<p>
[����4] �迭�� ����ϼ���1<br>
<%
	int[ ] lotto = {44, 33, 22, 11, 9, 7};
%>
<c:set var="cc"  value="<%= lotto %>"></c:set>
<c:forEach  var="ccData"  items="${cc}" varStatus="i">
	lotto[${i.index}] = ${ccData}  &nbsp;&nbsp;
</c:forEach>

<hr></hr>
<c:set var="cn" value="����,���ǵ�,����,���ֵ�,�︪��"></c:set>
<c:forTokens var="cnData" items="${cn}" delims="," varStatus="j"> 
		����[${j.index}] = ${cnData}  &nbsp;&nbsp;
</c:forTokens>

<p>
[����3] dan������ �Է¶����� �Է��ؼ� ������ ��� forEach������<br>
	<form action="JSTL1228.jsp">
		���Է�: <input type=text  name=dd>
		<input type=submit   value="������">
	</form>
	
	<!-- �ڹ��ڵ带 �ִ��� html�±�ó�� ��ȯ�ؼ� �����  -->
	<c:set var="aa"  value="${param.dd}"></c:set>
	<c:catch>               
		<c:forEach var="gu"  begin="1" end="9" step="1">
			<c:if test="${aa != null && aa != ''}">
				${aa} * ${gu} = ${param.dd * gu}  <br>
			</c:if>
		</c:forEach>
	</c:catch>
	
<hr>	
[����2] dan���� ������ ��� - forEach��<br>	
<c:set var="dan"  value="3"></c:set>
<c:forEach  var="gugu"  begin="1"  end="9"  step="1">
	${dan}  * ${gugu} = ${dan*gugu}<br>
</c:forEach>

	
<br>	
[����1] su1=10, su2=20 ��������, ������, ���, �μ� ���ϱ�
<br>
<%
	int  sua1=10, sua2=20, sua3=0 ; 
    sua3 = sua1+ sua2 ;
%>
<c:set var="su1"  value="${10}"></c:set>
<c:set var="su2"  value="20"></c:set>
<c:set var="su3" > 33 </c:set>
<c:out value="${su3}"></c:out>
<hr>

��1: <%= sua1 %> <br>
��2: <%= sua2 %> <br>
��3: <%= sua3 %> <br>

su1 = ${su1} <br>
su2 = ${su2} <br>
�հ� = ${su1+su2} <br>
su3 = ${su3} <br>
</body>
</html>









