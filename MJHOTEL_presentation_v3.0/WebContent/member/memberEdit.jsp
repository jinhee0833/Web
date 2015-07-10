<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>​
<%@ page import="java.sql.*" %>  
<%@ page import="member.common.DBbean" %>
<%@ page import="member.common.DBSQL" %>
<html>
<head>
<title>memberEdit</title>
<link rel="stylesheet" type="text/css" href="member/css/member.css">
<script type="text/javascript">

	function check(){	
		var length = document.forms[0].length-1; 
		// submit을 제외한 모든 input태그의 갯수를 가져옴		 
		for(var i = 0; i < length; i++){     // 루프를 돌면서		 
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
		        alert(document.forms[0][i].name + "을/를 입력하세요."); // 경고창을 띄우고		 
		        document.forms[0][i].focus();           // null인 태그에 포커스를 줌		 
		        return false;		 
		    }//if end		
		}//for end
	
		//성별 체크 유무 확인
		if (sigin.gender[0].checked==false && sigin.gender[1].checked==false){
		 alert("성별을 체크해 주세요");
		 return false;
		}
	}//end
	
	function telcheck(){
		var tel=signin.tel.value;
		var num_check=/^[0-9]*$/;
		if(num_check.test(tel)){
			if( signin.tel.value.length < 9 || signin.tel.value.length > 11 ){
			alert("9~11글자만 입력할수 있습니다.");
			signin.tel.value="";
			signin.tel.focus();
			return false;
			}
			}
			else{
			alert ( "숫자만 입력할 수 있습니다." );
			signin.tel.value="";
			signin.tel.focus();
			return false;
			}
	}//end
	
	function checkid(){
		var a=signin.id.value;
		location.href = "search.do?id="+a;
	}//end
	
	function pass(){
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (signin.password1.value.length<4 || signin.password1.value.length>8){
			 document.getElementById("ch_pw1").innerHTML = "4~6자리를 입력해주세요.";
			 signin.password1.value="";
	         signin.password1.focus();
		}
		else{
			document.getElementById("ch_pw1").innerHTML = "";
		}
	}//end
	
	function pass1(){
		if(signin.password1.value!=signin.password2.value) {
			document.getElementById("ch_pw2").innerHTML = "비밀번호가 일치하지 않습니다";
            signin.password2.value="";
            signin.password1.value="";
            signin.password1.focus();
    	}else if (signin.password1.value==signin.password2.value) {
    		document.getElementById("ch_pw2").innerHTML = "일치 합니다.";
    	}
	}//end
	
	
	function emailcheck(){
		var email = signin.email.value;  
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   		  
		if(regex.test(email) === false) {  
		    alert("잘못된 이메일 형식입니다.");
		    signin.email.value="";
		    signin.email.focus();
		    return false;
		}//if end	
	}//end
	
	function zipcheck(){			
		var data = signin.zipcode.value;
		if(data==""){
		    alert("우편번호 데이타가 공백입니다");
			signin.zipcode.focus();
			return false; //아래문장을 수행하지 않고 탈출
		}
		open("login/postsearchEdit.jsp","title","titlebar=no,left=600,top=100,width=600,height=600");
	}		
</script> 
</head>
<%
		String id = (String)session.getAttribute("NowUser");
		
		DBSQL dbsql=new DBSQL();
		DBbean bean=dbsql.memberDetail(id);
%>
<body>
	<div id="member_center">
		<form name=signin method=get onsubmit="return check()" action=memberEdit.do>
		<input type=hidden name=id value=<%=id%>>
		<table id=member_tableF>
			<tr>
			
				<td class="member_tr">
					&nbsp;id <%=id%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					<input type=password name=password1 placeholder=비밀번호 onblur="pass()" class="member_ta" value="<%=bean.getPw()%>">
					<div class="member_ta2">필수 정보입니다.<span class="member_ta3" id="ch_pw1"></span></div>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					<input type=password name=password2 placeholder="비밀번호 재확인" onblur="pass1()" class="member_ta" >
					<div class="member_ta2">필수 정보입니다.<span class="member_ta3" id="ch_pw2"></span></div>
				</td>
			</tr>
		</table><br>
		
		<table id=member_tableF>
			<tr>
				<td class="member_tr">
					&nbsp;이름 <%=bean.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;성별 <%=bean.getGender()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;생일 <%=bean.getBirth()%>
				<div id=member_hr></div>
				</td>
			</tr>
			<tr>
			    <td class="member_tr">
				    &nbsp;주소
				    <input type=text name=zipcode placeholder=동이름 class="member_ta4">
				    <input type=button onClick="zipcheck()" value=우편번호 onLoad="send( )" class="member_bt">
			    	&nbsp;<input type=text name=addr class="member_ta" value="<%=bean.getAddr()%>"><br>
			    	<div id=member_hr></div>
			    </td>
	 		</tr>
			<tr>
				<td class="member_tr">
					<input type=text name=email placeholder="이메일" onblur="emailcheck()" class="member_ta" value="<%=bean.getEmail()%>">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					<input type=text name=tel placeholder="연락처" onblur="telcheck()" class="member_ta" value="<%=bean.getTel()%>">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					멤버십가입여부&nbsp;<input type=radio name=mem value="Membership" checked >Yes
					<input type=radio name=mem value="NON">No
				</td>
			</tr>
		</table><br>
		<div id=member_bottom>
			<input type=submit value="수정하기" class="member_bt2">
		</div>
		</form>
	</div>
</body>
</html>