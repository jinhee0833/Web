<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.td a {color: #000;}
		
		.paging a {
			color: #000;
			font-size: 17px;
		}
	</style>
</head>
<%
String roomid = (String)request.getParameter("roomid");%>
<body>
	<form method='post' action='../../review_insert.do' onsubmit="return check()">	 	
 		<div><font size="3" style="font-weight: bold;">>Review Write</font>
	<hr color="black"></div><p>
 		객실번호 >>> <%=roomid %>
 				<table class="table table-striped" border="1">

		
		<tr>
			<td>글쓴이</td>
			<td><input=type name="name" value="">${user}</td>
		</tr>	
		
		<tr>
			<td>제 목</td>
			<td><input type="text" name="title" >(50자 미만)</td>
		</tr>	
		
		<tr>
			<td>내 용</td>
			<td><textarea name="content" rows=5 cols=50 ></textarea>(3000자 미만)</td>
		</tr>	

 	</table>
 		<input type='hidden' value="<%=roomid %>" name="roomid">
 		<input type='hidden' value="${user}" name="name">
 	<input class="btn btn-default" type="submit" value="write">
 	</form>	
 	 <a class="btn btn-default" href="../../review_list.do?roomid=<%=roomid %>" role="button">Cancel</a>
</div>
</body>
</html>