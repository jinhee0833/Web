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
[문제5] if문 <br>
<c:set var="car"  value="소나타"></c:set>
<c:if test="${car=='소나타'}">
	${car}는 현대차입니다
</c:if>

<hr><p>
	<form action="JSTL1228.jsp">
		숫자입력: <input type=text  name=num>
		<input type=submit   value="숫자판별">
	</form>

<c:set var="su"  value="${param.num}"></c:set>
<!-- if~else if~else문대신 choose, when문으로 구현  -->
<c:catch>
	<c:choose>
		<c:when test="${su>0}"> ${param.num} 은 양수 </c:when>
		<c:when test="${su<0}"> ${param.num} 은 음수 </c:when>
		<c:when test="${su==0}">  제로입니다 </c:when>
		<c:otherwise> 숫자가 아닙니다</c:otherwise>
	</c:choose>
</c:catch>
<p>
[문제4] 배열을 출력하세요1<br>
<%
	int[ ] lotto = {44, 33, 22, 11, 9, 7};
%>
<c:set var="cc"  value="<%= lotto %>"></c:set>
<c:forEach  var="ccData"  items="${cc}" varStatus="i">
	lotto[${i.index}] = ${ccData}  &nbsp;&nbsp;
</c:forEach>

<hr></hr>
<c:set var="cn" value="신촌,여의도,독도,제주도,울릉도"></c:set>
<c:forTokens var="cnData" items="${cn}" delims="," varStatus="j"> 
		도시[${j.index}] = ${cnData}  &nbsp;&nbsp;
</c:forTokens>

<p>
[문제3] dan변수를 입력란에서 입력해서 구구단 출력 forEach문으로<br>
	<form action="JSTL1228.jsp">
		단입력: <input type=text  name=dd>
		<input type=submit   value="단전송">
	</form>
	
	<!-- 자바코드를 최대한 html태그처럼 변환해서 사용함  -->
	<c:set var="aa"  value="${param.dd}"></c:set>
	<c:catch>               
		<c:forEach var="gu"  begin="1" end="9" step="1">
			<c:if test="${aa != null && aa != ''}">
				${aa} * ${gu} = ${param.dd * gu}  <br>
			</c:if>
		</c:forEach>
	</c:catch>
	
<hr>	
[문제2] dan변수 구구단 출력 - forEach문<br>	
<c:set var="dan"  value="3"></c:set>
<c:forEach  var="gugu"  begin="1"  end="9"  step="1">
	${dan}  * ${gugu} = ${dan*gugu}<br>
</c:forEach>

	
<br>	
[문제1] su1=10, su2=20 변수선언, 값대입, 출력, 두수 더하기
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

수1: <%= sua1 %> <br>
수2: <%= sua2 %> <br>
수3: <%= sua3 %> <br>

su1 = ${su1} <br>
su2 = ${su2} <br>
합계 = ${su1+su2} <br>
su3 = ${su3} <br>
</body>
</html>









