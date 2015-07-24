<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.vo.reviewVO" %>
<html>
<head>
<title>reviewInsert.jsp</title>
<link href="css/main/bootstrap.css" rel='stylesheet' type='text/css' />
<script type="text/javascript">
	function check(){		
		var length = document.forms[0].length-1; 
		// submit을 제외한 모든 input태그의 갯수를 가져옴		 
		for(var i = 0; i < length; i++){     // 루프를 돌면서		 
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
		        alert(document.forms[0][i].name + "을 를 입력하세요."); // 경고창을 띄우고		 
		        document.forms[0][i].focus();           // null인 태그에 포커스를 줌		 
		        return false;		 
		    }//end if		
		}//end for
	}//end	
</script>  
<style>
th,span {font-size: 10pt; }
hr {margin: 0;}
</style>
</head>
<body>
<%
	reviewVO rvo = (reviewVO)request.getAttribute("naver");
%>
<div>
	<form method='post' action='review_update.do'>
	 		<div><font size="3" style="font-weight: bold;">>Review Update</font>
	<hr color="black"></div>	 	
 	 		<table class="table table-striped" border="1">
 	 			<colgroup>
					<col style="width: 30%" />
					<col style="width: 70%" />
				</colgroup>
 		<th>객실번호</th><td><%=rvo.getRoomID() %></td>
		<tr>
			<td>글쓴이</td>
			<td><input=type name="name" value="">${user}</td>
		</tr>	
		<tr>
			<td>제 목</td>
			<td><input type="text" name="title" value="<%=rvo.getTitle()%>" >(50자 미만)</td>
		</tr>	
		<tr>
			<td>내 용</td>
			<td><textarea name="content" rows=5 cols=50 ><%=rvo.getContent()%></textarea>(3000자 미만)</td>
		</tr>	
 	</table>
 		<input name="roomid" type="hidden" value="<%=rvo.getRoomID()%>">
		<input name="num" type="hidden" value="<%=rvo.getNum()%>">
 		<input class="btn btn-default" type="submit" value="write">
 	</form>	
 		<a class="btn btn-default" href="review_list.do?roomid=<%=rvo.getRoomID()%>" role="button">Cancel</a></div>
</body>
</html>