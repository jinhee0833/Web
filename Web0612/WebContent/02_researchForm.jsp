<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>���� ����</title>
</head>
<script type="text/javascript">
	function oneClick(val){
		var cnt=0;
		var obj = document.getElementsByName("season");
		for(var i=0; i < obj.length;i++){
			if(obj[i].checked==true){
				cnt = cnt +1;
			}	
		}
		
		if(cnt>1){ 
			alert("�ϳ��� üũ���ٷ�?");
			for(var i=0; i < obj.length;i++){
				obj[i].checked = false;
			}
			
			return;
		}else if(cnt==0){
			alret("� üũ���ٷ�?");
			return;
		}
		
	}
</script>
<body>
	<h2>���� ����</h2>
	<form action="02_research.jsp" method="post">
		<table>
			<tr>
				<td>�̸� : </td>
				<td>
				<input type="text" name="name" size="20">
				</td>
			</tr>
			<tr>
				<td>���� : </td>
				<td>
					<input type="radio" name="gender" value="male" checked="checked">����
					<input type="radio" name="gender" value="female" >����
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="season" value="1" onclick="oneClick(this)"> ��
					<input type="checkbox" name="season" value="2" onclick="oneClick(this)"> ����
					<input type="checkbox" name="season" value="3"onclick="oneClick(this)"> ����
					<input type="checkbox" name="season" value="4"onclick="oneClick(this)"> �ܿ�
				</td>
			</tr>
			<tr align="center">
				<td><input type="submit" value="����"></td>
				<td><input type="reset" value="���"></td >
			</tr>
		</table>	
	</form>
</body>
</html>