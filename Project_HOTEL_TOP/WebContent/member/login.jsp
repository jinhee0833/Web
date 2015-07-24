<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*" %>  
<%@ page import="member.vo.*, member.dao.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/member/member.css">
<!-- AJAX를 이용한 로그인 코드-->
<script type="text/javascript">
	var xhr;
	
	function loginTry(){
		xhr = new XMLHttpRequest();
		var id = loginform.id.value;
		var pw = loginform.pw.value;
		var url = "login.do?loginID=" + id + "&loginPW=" + pw;
		if(id==null || id==""){
			alert("ID를 입력하십시오");
			loginform.id.focus();
			return false;
		}else if(pw==null || pw==""){
			alert("비밀번호를 입력하십시오");
			loginform.pw.focus();
			return false;
		}else{
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = loginResult;
		}
	}//end
	
	function loginResult(){
		if(xhr.readyState==4 && xhr.status==200){
			var ret = xhr.responseText;
			document.getElementById("login").innerHTML = ret;
			location.reload();
		}
	}//end
	
	function logout(){
		window.location = "member/logout.jsp";
	}
</script>
</head>
<body>
<!--loginController에서 넘어온 "user" 값이 없을 경우-->
<%if(session.getAttribute("user")==null){ %>
<div class="row">
	<div class="col-xs-12">
		<form name="loginform" action="join.jsp">
			<div id="login" align="right">	
				<label class="fontawesome-user"><span class="hidden">ID</span></label> &nbsp;<input type="text" name="id" style="width:70px;" >
				<label class="fontawesome-lock"><span class="hidden">PW</span></label> &nbsp;<input type="password" name="pw"  style="width:70px;">
				<span><a href="#" class="logintext" onClick="loginTry()">&nbsp;▶ LOGIN</a></span>
				<span><a href="toJoin.do" class="logintext">&nbsp; ▶ Sign up now  </a></span>
			</div>	
		</form>
	</div>
</div>
<!--loginController에서 넘어온 "user" 값이 있는 경우(관리자)-->
<%}else{ 
	String id = (String)session.getAttribute("user");
	if(id.equals("admin")){ %>
	<div align="right">
		<label class="fontawesome-cog"> &nbsp; [<%=id%>] &nbsp;</label>
		<span><a href='updateselect.do' class='logintext'>▶ Room List</a></span>
  		<span><a href='list.do' class='logintext'>▶ Member List</a></span>
  		<span><a href='selectReservation.do' class='logintext'>▶ Member Book Status</a></span>
  		<span class='logintext'>&nbsp; / &nbsp;</span>
  		<span><a href='#' class='logintext' onClick="logout()">▶ Logout</a></span>	
	</div>		
<!--loginController에서 넘어온 "user" 값이 있는 경우(일반 회원)-->
<%	}else{ %>
<div align="right">
	<label class="fontawesome-user"> &nbsp;[<%=id%>] &nbsp;</label>
<%		if(id!=null || id!=""){ %>
			<span class='logintext'><a href='myReservation.do?revId=<%=id%>'>▶ Book Status</a></span>
  			<span class='logintext'>&nbsp; / &nbsp;</span>
  			<span><a href='detail.do?id=<%=id%>' class='logintext'>▶ Member Information</a></span>
<%		} %>	
	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href='#' class='logintext' onClick="logout()">▶ Logout</a></span>  		
<%	}
}%>
</div>

</body>
</html>