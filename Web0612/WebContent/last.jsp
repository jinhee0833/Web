<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title> [last.jsp] </title></head>
<body>
	<!-- password, file, select, checkbox, radio, textarea -->
	<form>
	��� : <input type="text"  name="sabun" value="2234"> <br>
	��� : <input type="password" name="pwd"> <br>
	���� : <input type="radio" name="gender" checked="checked">��
	      <input type="radio" name="gender">�� <br>
	���� : <input type="checkbox"  value="1">��
	      <input type="checkbox"   value="2" checked="checked">����
	      <input type="checkbox"   value="3">����
	      <input type="checkbox"   value="4">�ܿ�<br>
	����: <select>
			<option>�ߺ�����</option>
			<option>��������</option>
			<option>��������</option>
			<option>�ؿ���</option>
	     </select><br>
	 ����: <input type="file"><br>
	 ����: <textarea rows="4" cols="30"></textarea><p>    
	 <input type="hidden"  value="7">
	 <input  type="submit" value="����Ÿ����"> &nbsp;
	 <input type="reset" value="����ϱ�">
	      
	</form>
	
	
</body>
</html>