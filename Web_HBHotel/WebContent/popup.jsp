<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> [openInfo.jsp]</title>
<style type="text/css">
#a{text-decoration: none;}
#a:HOVER { text-decoration: underline;
}
</style>

<script type="text/javascript">

	function setCookie( name, value, expiredays ){
	  var todayDate = new Date();
	  todayDate.setDate( todayDate.getDate() + expiredays );
	  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	} //end
	
	function cookie_end(){
		if(document.form_pop.input_chk.checked){
		setCookie("pop", "true", 1);}
		self.close();
	}//end
	
</script>
</head>


<body  bgcolor= #252220 style="width: 275; height: 560;" >
<form name="form_pop">
<div><p>
    <b><font style="font-size: 10pt; color:#FFFFFF ">HANBIT HOTEL</font></b><br>
    <b><font style="font-size: 20pt; color:#FFFFFF">Fall, and a...</font></b><p>
	<img  src="images/pop2.jpg"><p>
</div>	
<font style="font-size:10pt; color: #FFFFFF">
	 <b>가을산책 패키지</b> <p>
	 <b>기간 :</b> ~ 2014-11-30 <p>
	 <b>혜택</b><br>
		 ＊피크닉 박스 <br>
		＊테이크아웃 커피 이용권 2매<br>
		＊한빛호텔 책갈피 2개<p>
	 
	바쁜 도심 속 일상에서 벗어나<br> 
	가벼운 산책과 피크닉을 즐기며 <br>
	달콤한 휴식의 여유를 느껴보세요.<br> 
	
</font>

<div>
	<input type="checkbox" id="chk" name="input_chk"> 
	<label for="chk" ><font style="color: #FFFFFF">하루 동안 열지 않기</font></label>
	<a title="이창을 닫습니다"  href="javascript:cookie_end();">
	<font style="color: #FFFFFF"><b>[닫기X]</b></font></a><p>
</div>
</form>
</body>
</html>