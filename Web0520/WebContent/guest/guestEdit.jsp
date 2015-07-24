4<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>
<head>

<title>[guestEdit.jsp]</title>
	<style type="text/css">
		input, b{font-size:16pt; font-weight:bold;}
	</style>
</head>
<body>
<h2> [guestEdit.jsp] </h2>
	<form  method="get"  action="edit.do"> <!-- EditController.java -->
		<b>사번:</b> <input type=text name="sabun"  value="${bean.sabun}"  readonly=readonly> <br>
		<b>이름:</b> <input type=text name="name"   value="${bean.name}" > <br>
		<b>제목:</b> <input type=text name="title"  value="${bean.title}" > <br>
		<b>급여:</b> <input type=text name="pay"    value="${bean.pay}"  > <p>
		<input type="submit"  value="스프링수정">  &nbsp;	&nbsp;
		<input type="reset"  value="수정취소">  &nbsp;	&nbsp;
	</form>
	
 <p>
  <h2>
  	<input type="button" value="신규등록" onClick="location.href='/Web0223SpringAOPhb/write.do';"/> &nbsp;&nbsp;
  	<input type="button" value="목록" onClick="location.href='/Web0223SpringAOPhb/list.do';"/> &nbsp;&nbsp;
  </h2>
</body>
</html>


















