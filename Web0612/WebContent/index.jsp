<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		function info(){
			var data = document.cookie;
			alert(data);
			
			if(data!="popupTest=pop"){
				window.open("popup.jsp","title","width=400,height=500,left=200,top=200");
				opener.self();
			}
			
		}
		
		
		
	
		 
		function getCookieValue(strName) {
			var strCookieName = strName + "=";
			var objCookie = document.cookie;
			if (objCookie.length > 0) {
				var nBegin = objCookie.indexOf(strCookieName);
				if (nBegin < 0) {
					return "";
				}
				nBegin += strCookieName.length;
				var nEnd = objCookie.indexOf(";", nBegin);
				if (nEnd == -1) {
					nEnd = objCookie.length;
				}
			}
			return unescape(objCookie.substring(nBegin, nEnd));
		}

		function initWin() {
			if (getCookieValue("popupTest") != "pop") {
				window.open("popup.jsp", "title","width=400,height=500,left=200,top=200");
				opener.self();
			}
		}
		
	</script>
<body onload="info()">

	<font size = 7 color=red>index.jsp</font>
	
		<p>
	&nbsp;&nbsp;
		<input type="checkbox" name="chk" onclick="chkReset()"><b>쿠키팝업창 초기화
		</b>
	
</body>
</html>