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
</head>
<body id="login_center">
	<form name="join" action="join.do" method="post">
		<table class="table table-striped">
		<caption>�ű� ��� </caption>
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
						<input type="text" name="id" id=InputId" placeholder="���̵� ����,���� 4~16�ڸ�" value="<%=idcheck%>" class="form-control">
						<div class="form-group ta2">�ʼ� �����Դϴ�.<span class="ta3"><%=condition%></span></div>
						<input type=button value="�ߺ�Ȯ��" onclick="idcheck()"  class="btn btn-default">
						<div id=hr></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="InputId">��й�ȣ</label>
				</td>
				
				<td>
					<div class="form-group form-inline">
						<input type=password name=pwd1 placeholder=��й�ȣ onblur="pw1check()" class="form-control">
						<div class="form-group ta2">�ʼ� �����Դϴ�.<span class="ta3" id="pwd1_ch"></span></div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="InputId">��й�ȣ Ȯ��</label>
				</td>
				
				<td>
					<div class="form-group form-inline">
						<input type=password name=pwd2 placeholder="��й�ȣ Ȯ��" onblur="pw2check()" class="form-control">
						<div class="form-group ta2">�ʼ� �����Դϴ�.<span class="ta3" id="pwd2_ch"></span></div>
					</div>
				</td>
			</tr>

		<tr>
			<td>
				<label >�̸�</label>
			</td>
			<td>
				<input type=text name=name placeholder="�̸�"  class="btn btn-default">
				<div id=hr></div>
			</td>
		</tr>
		<tr>
			<td>
				<label >�������</label>
			</td>
			<td>
							
			<script type="text/javascript">  
				var std_yr = parseInt(new Date().getYear()); 
				var start_yr = (std_yr+1900) - 10;
				var end_yr = (std_yr+1900) - 100; 
				
				document.write("<font size=2><select name=year>"); 
				document.write("<option value='' placeholder=���� selected>"); 
				for (i=start_yr; i>=end_yr; i--){document.write("<option>"+i);} 
				document.write("</select>��  "); 
				
				document.write("<select name=month>"); 
				document.write("<option value='' placeholder=�� selected>"); 
				for (i=1; i<=12;i++){document.write("<option>"+i);} 
				document.write("</select>��  "); 
				
				document.write("<select name=day>"); 
				document.write("<option value='' placeholder=�� selected>"); 
				for (i=1; i<=31;i++){document.write("<option>"+i);} 
				document.write("</select>��  </font>"); 
			</script> 
			<div id=hr></div>
			</td>
		</tr>
		<tr>
			<td>
				<div><label>�����ȣ</label></div>
				<div><label>�ּ�</label></div>
			</td>
		    <td><div class="form-group form-inline">
				    <input type=text name=zipcode placeholder="�� �˻�" class="form-control" style="width:70px">
				    <input type=button onClick="addrcheck()" value="�����ȣ ã��"  class="btn btn-default">
			    </div>
		    	<input type=text name=addr class="form-control"><br>
		    	<div id=hr></div>
		    </td>
 		</tr>
 			
 		<tr>
 			<td>
				<label >�̸���</label>
			</td>
			<td><input type=text name=email placeholder="�̸���" onblur="emailcheck()" class="form-control">
			<div id=hr></div>
			<div class="ta2">****@******.*** ���·� �Է��Ͻʽÿ�.<span class="ta3" id="email_ch"></span></div>
			</td>
		</tr>
		<tr>
			<td>
				<label>����ó</label>
			</td>
			<td><input type=text name=tel placeholder="����ó" onblur="telcheck()" class="form-control">
			<div id=hr></div>
			<div class="ta2">'-'�� �����ϰ� �Է��Ͻʽÿ�.<span class="ta3" id="tel_ch"></span></div>
			</td>
		</tr>
		<tr>
			<td>
				<label>����ʰ����������</label>
			</td>
			<td>
				<input type=radio name=mem value="1" checked>Yes
				<input type=radio name=mem value="0">No
				<div class="ta2">����ʰ����� ����Ͻô� ���Բ����� 02-000-000���� �����ֽñ� �ٶ��ϴ�.<span class="ta3"></span></div>
			</td>
		</tr>
		</table>
		<div id=login_bottom align="right">
		<input type="submit" value="�����ϱ�"  class="btn btn-default">
		<a href=index.jsp><input type=button value="����ȭ��"  class="btn btn-default"></a>
	</div>
	</form>
</body>
</html>