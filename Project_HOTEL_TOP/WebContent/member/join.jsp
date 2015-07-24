<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join</title>
<link rel="stylesheet" type="text/css" href="css/member/member.css">
<script type="text/javascript">
	function idcheck(){
		var id = join.id.value;
		location.href = "check.do?id=" + id;
	}//end
	
	function pw1check(){
		if(join.pwd1.value.length<4 || join.pwd1.value.length>16){
			document.getElementById("pwd1_ch").innerHTML = "비밀번호는 4~16자리로 입력하십시오.";
			join.pwd1.value="";
			join.pwd1.focus();
			return false;
		}else{
			document.getElementById("pwd1_ch").innerHTML = "사용 가능한 비밀번호입니다.";
			return false;
		}
	}//end
	
	function pw2check(){
		if(join.pwd1.value != join.pwd2.value){
			document.getElementById("pwd2_ch").innerHTML = "비밀번호가 일치하지 않습니다.";
			join.pwd2.value="";
			join.pwd2.focus();
			return false;
		}else if(join.pwd1.value == join.pwd2.value){
			document.getElementById("pwd2_ch").innerHTML = "비밀번호가 일치합니다.";
			return false;
		}
	}//end
	
	function emailcheck(){
		var email = join.email.value;  
		var email_check = /^([a-zA-Z0-9_-\.]{3,16})@([a-zA-Z0-9_-]{3,16})\.([a-zA-Z]{2,6})$/;   		  
		if(email_check.test(email)==false) {  
			document.getElementById("email_ch").innerHTML = "잘못된 이메일 형태입니다.";
		    join.email.value="";
		    join.email.focus();
		    return false;
		}
	}//end
	
	function addrcheck(){
		open("addr.do", "title", "top=400,left=300,width=700,height=300")	
	}//end
	
	function telcheck(){
		var tel = join.tel.value;
		var tel_check = /^[0-9]$/;
		if(tel_check.test(tel)==false){
			if(join.tel.value.length < 10 || join.tel.value.length > 11){
			document.getElementById("tel_ch").innerHTML = "10 또는 11자리 숫자로 입력하십시오.";
			join.tel.value="";
			join.tel.focus();
			return false;
			}
		}else{
		document.getElementById("tel_ch").innerHTML = "숫자만 입력하십시오.";
		join.tel.value="";
		join.tel.focus();
		return false;
		}
	}//end
	
</script>
</head>
<body id="login_center">
	<form name="join" action="join.do" method="post">
		<table class="table table-striped">
		<caption>신규 등록 </caption>
			<tr>
			<% 
				String idcheck=(String)request.getAttribute("idcheck");
				String condition=(String)request.getAttribute("condition");
				if(condition==null){ condition="";}
				if(idcheck==null){ idcheck=""; }
			%>
				<td>
					<label for="InputId">ID</label>
				</td>
				
				<td>
					<div class="form-group form-inline">
						<input type="text" name="id" id=InputId" placeholder="아이디 영문,숫자 4~16자리" value="<%=idcheck%>" class="form-control">
						<div class="form-group ta2">필수 정보입니다.<span class="ta3"><%=condition%></span></div>
						<input type=button value="중복확인" onclick="idcheck()"  class="btn btn-default">
						<div id=hr></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="InputId">비밀번호</label>
				</td>
				
				<td>
					<div class="form-group form-inline">
						<input type=password name=pwd1 placeholder=비밀번호 onblur="pw1check()" class="form-control">
						<div class="form-group ta2">필수 정보입니다.<span class="ta3" id="pwd1_ch"></span></div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="InputId">비밀번호 확인</label>
				</td>
				
				<td>
					<div class="form-group form-inline">
						<input type=password name=pwd2 placeholder="비밀번호 확인" onblur="pw2check()" class="form-control">
						<div class="form-group ta2">필수 정보입니다.<span class="ta3" id="pwd2_ch"></span></div>
					</div>
				</td>
			</tr>

		<tr>
			<td>
				<label >이름</label>
			</td>
			<td>
				<input type=text name=name placeholder="이름"  class="btn btn-default">
				<div id=hr></div>
			</td>
		</tr>
		<tr>
			<td>
				<label >생년월일</label>
			</td>
			<td>
							
			<script type="text/javascript">  
				var std_yr = parseInt(new Date().getYear()); 
				var start_yr = (std_yr+1900) - 10;
				var end_yr = (std_yr+1900) - 100; 
				
				document.write("<font size=2><select name=year>"); 
				document.write("<option value='' placeholder=생년 selected>"); 
				for (i=start_yr; i>=end_yr; i--){document.write("<option>"+i);} 
				document.write("</select>년  "); 
				
				document.write("<select name=month>"); 
				document.write("<option value='' placeholder=월 selected>"); 
				for (i=1; i<=12;i++){document.write("<option>"+i);} 
				document.write("</select>월  "); 
				
				document.write("<select name=day>"); 
				document.write("<option value='' placeholder=일 selected>"); 
				for (i=1; i<=31;i++){document.write("<option>"+i);} 
				document.write("</select>일  </font>"); 
			</script> 
			<div id=hr></div>
			</td>
		</tr>
		<tr>
			<td>
				<div><label>우편번호</label></div>
				<div><label>주소</label></div>
			</td>
		    <td><div class="form-group form-inline">
				    <input type=text name=zipcode placeholder="동 검색" class="form-control" style="width:70px">
				    <input type=button onClick="addrcheck()" value="우편번호 찾기"  class="btn btn-default">
			    </div>
		    	<input type=text name=addr class="form-control"><br>
		    	<div id=hr></div>
		    </td>
 		</tr>
 			
 		<tr>
 			<td>
				<label >이메일</label>
			</td>
			<td><input type=text name=email placeholder="이메일" onblur="emailcheck()" class="form-control">
			<div id=hr></div>
			<div class="ta2">****@******.*** 형태로 입력하십시오.<span class="ta3" id="email_ch"></span></div>
			</td>
		</tr>
		<tr>
			<td>
				<label>연락처</label>
			</td>
			<td><input type=text name=tel placeholder="연락처" onblur="telcheck()" class="form-control">
			<div id=hr></div>
			<div class="ta2">'-'를 제외하고 입력하십시오.<span class="ta3" id="tel_ch"></span></div>
			</td>
		</tr>
		<tr>
			<td>
				<label>멤버십가입희망여부</label>
			</td>
			<td>
				<input type=radio name=mem value="1" checked>Yes
				<input type=radio name=mem value="0">No
				<div class="ta2">멤버십가입을 희망하시는 고객님께서는 02-000-000으로 연락주시기 바랍니다.<span class="ta3"></span></div>
			</td>
		</tr>
		</table>
		<div id=login_bottom align="right">
		<input type="submit" value="가입하기"  class="btn btn-default">
		<a href=index.jsp><input type=button value="메인화면"  class="btn btn-default"></a>
	</div>
	</form>
</body>
</html>