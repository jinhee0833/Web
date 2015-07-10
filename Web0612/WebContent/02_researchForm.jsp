<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>설문 조사</title>
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
			alert("하나만 체크해줄래?");
			for(var i=0; i < obj.length;i++){
				obj[i].checked = false;
			}
			
			return;
		}else if(cnt==0){
			alret("어서 체크해줄래?");
			return;
		}
		
	}
</script>
<body>
	<h2>설문 조사</h2>
	<form action="02_research.jsp" method="post">
		<table>
			<tr>
				<td>이름 : </td>
				<td>
				<input type="text" name="name" size="20">
				</td>
			</tr>
			<tr>
				<td>성별 : </td>
				<td>
					<input type="radio" name="gender" value="male" checked="checked">남자
					<input type="radio" name="gender" value="female" >여자
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="season" value="1" onclick="oneClick(this)"> 봄
					<input type="checkbox" name="season" value="2" onclick="oneClick(this)"> 여름
					<input type="checkbox" name="season" value="3"onclick="oneClick(this)"> 가을
					<input type="checkbox" name="season" value="4"onclick="oneClick(this)"> 겨울
				</td>
			</tr>
			<tr align="center">
				<td><input type="submit" value="전송"></td>
				<td><input type="reset" value="취소"></td >
			</tr>
		</table>	
	</form>
</body>
</html>