<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>popup</title>
<script type="text/javascript">
	/*
	
	function setCookie(a,b,c) {
	  var todayDate = new Date();
	  todayDate.setMinutes(todayDate.getMinutes() + c);
	  document.cookie = a + "=" + escape(b) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	  var msg = todayDate.toGMTString();
	  alert(msg);
	  alert(document.cookie);
	}//end
	function chkClick(){
		setCookie("info_pop", "false", 1);
		self.close();
	}*/
	
	function chkClick() {
		setCookie("popupTest", "pop", 24);
		self.close();
	}

	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setHours(todayDate.getHours() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";";
	}
	
</script>
</head>

<body>
	<div align="center">
		<img src="images/a2.png" width=350 height=250>
	</div>
	
	<p>
	<font size=5 color=red>
		<b>
			크리스마스 20%세일<br>
			신년연휴설 50%세일<br>
			발렌타인데이 반값세일<br>
		</b>
	</font>
	<p>
	&nbsp;&nbsp;
		<input type="checkbox" name="chk" onclick="chkClick()"><b>오늘 하루 안보이기</b>
	
</body>
</html>