<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title> [last.jsp] </title></head>
<body>
	<!-- password, file, select, checkbox, radio, textarea -->
	<form>
	사번 : <input type="text"  name="sabun" value="2234"> <br>
	비번 : <input type="password" name="pwd"> <br>
	성별 : <input type="radio" name="gender" checked="checked">남
	      <input type="radio" name="gender">여 <br>
	시즌 : <input type="checkbox"  value="1">봄
	      <input type="checkbox"   value="2" checked="checked">여름
	      <input type="checkbox"   value="3">가을
	      <input type="checkbox"   value="4">겨울<br>
	연령: <select>
			<option>중부지역</option>
			<option>서부지역</option>
			<option>남부지역</option>
			<option>해외팀</option>
	     </select><br>
	 파일: <input type="file"><br>
	 내용: <textarea rows="4" cols="30"></textarea><p>    
	 <input type="hidden"  value="7">
	 <input  type="submit" value="데이타전송"> &nbsp;
	 <input type="reset" value="취소하기">
	      
	</form>
	
	
</body>
</html>