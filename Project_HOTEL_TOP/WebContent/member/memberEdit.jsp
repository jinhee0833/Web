<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.vo.*, member.dao.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberEdit</title>
</head>
<body>
<%
	try{
		String id = request.getParameter("id");
		DBSQL dbsql = new DBSQL();
		DBbean bean = dbsql.dbDetail(id);
%>
<script type="text/javascript">
	function pw1check(){
		if(join.pwd1.value.length<4 || join.pwd1.value.length>16){
			document.getElementById("pwd1_ch").innerHTML = "��й�ȣ�� 4~16�ڸ��� �Է��Ͻʽÿ�.";
			join.pwd1.value="";
			join.pwd1.focus();
			return false;
		}else{
			document.getElementById("pwd1_ch").innerHTML = "��� ������ ��й�ȣ�Դϴ�.";
			return false;
		}
	}//end
	
	function pw2check(){
		if(join.pwd1.value != join.pwd2.value){
			document.getElementById("pwd2_ch").innerHTML = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			join.pwd2.value="";
			join.pwd2.focus();
			return false;
		}else if(join.pwd1.value == join.pwd2.value){
			document.getElementById("pwd2_ch").innerHTML = "��й�ȣ�� ��ġ�մϴ�.";
			return false;
		}
	}//end
	
	function emailcheck(){
		var email = join.email.value;  
		var email_check = /^([a-zA-Z0-9_-\.]{3,16})@([a-zA-Z0-9_-]{3,16})\.([a-zA-Z]{2,6})$/;   		  
		if(email_check.test(email)==false) {  
			document.getElementById("email_ch").innerHTML = "�߸��� �̸��� �����Դϴ�.";
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
			document.getElementById("tel_ch").innerHTML = "10 �Ǵ� 11�ڸ� ���ڷ� �Է��Ͻʽÿ�.";
			join.tel.value="";
			join.tel.focus();
			return false;
			}
		}else{
		document.getElementById("tel_ch").innerHTML = "���ڸ� �Է��Ͻʽÿ�.";
		join.tel.value="";
		join.tel.focus();
		return false;
		}
	}//end

</script>
	<div id="member_center">
		<form name="join" method="post" action="edit.do?id=<%=id%>">
		<input type=hidden name=id value=<%=id%>>
		<table id=member_tableF>
			<tr>
				<td class="member_tr">
					&nbsp;id <%=id%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type=password name=pwd1 placeholder=��й�ȣ onblur="pw1check()" class="ta">
					<div class="ta2">�ʼ� �����Դϴ�.<span class="ta3" id="pwd1_ch"></span></div>
					<div id=hr></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type=password name=pwd2 placeholder="��й�ȣ Ȯ��" onblur="pw2check()" class="ta">
					<div class="ta2">�ʼ� �����Դϴ�.<span class="ta3" id="pwd2_ch"></span></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type=text name=name placeholder="�̸�" class="ta">
					<div id=hr><span class="ta3"><%=bean.getName()%></span></div>
				</td>
			</tr>
		</table><br>
		<table id=member_tableF>
			<tr>
				<td class="member_tr">
					&nbsp;���� <%=bean.getBirth().substring(0,10)%>
				<div id=member_hr></div>
				</td>
			</tr>
			<tr>
			    <td class="member_tr">
				    &nbsp;�ּ�
				    <input type=text name=zipcode placeholder=���̸� class="member_ta4">
				    <input type=button onClick="zipcheck()" value=�����ȣ onLoad="addrcheck()" class="member_bt">
			    	&nbsp;<input type=text name=addr class="member_ta" value="<%=bean.getAddr()%>"><br>
			    	<div id=member_hr></div>
			    </td>
	 		</tr>
			<tr>
				<td class="member_tr">
					<input type=text name=email placeholder="�̸���" onblur="emailcheck()" class="member_ta" value="<%=bean.getEmail()%>">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					<input type=text name=tel placeholder="����ó" onblur="telcheck()" class="member_ta" value="<%=bean.getTel()%>">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					����ʰ����������&nbsp;<input type=radio name=mem value="1" checked >Yes
					<input type=radio name=mem value="0">No
				</td>
			</tr>
		</table><br>		
		<div id=member_bottom>
			<input type="submit" value="�����ϱ�" class="member_bt2">
			<a href="index.jsp"><input type="button" value="����ȭ��" class="member_bt2"></a>
		</div>
		</form>
	</div>
<%
	}catch(Exception ex){}	
%>
</body>
</html>