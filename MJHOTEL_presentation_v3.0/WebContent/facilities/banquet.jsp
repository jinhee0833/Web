<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>banquet.jsp</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#tabs" ).tabs(
   		$(".thumbs a").click(function(){	
   			var path = $(this).attr("href");
   			$(this).parent().prev().find("img").attr({ src: path });
   			$(this).parent().prev().find("img").css("opacity","0.5").stop().animate({opacity:2},4000);
   			return false;
   		})		
    );
  });
</script>
</head>
<body>
<div id="faF">
	<div id="faF2">
		<div id="fa_title2">Banquet</div>
		<div id="tabs">
			<ul>
			  <li><a href="#tabs-1">IRIS</a></li>
			  <li><a href="#tabs-2">YI YUAN</a></li>
			  <li><a href="#tabs-3">LOTUS</a></li>
			</ul> 
			<div id="tabs-1">
				<div id="largeImg"><img src="facilities/images/banqnet/iris_01.jpg" alt="image1" /></div>
				<div class="thumbs">
					<a href="facilities/images/banqnet/iris_01.jpg" title="image1"><img src="facilities/images/banqnet/th_iris_01.jpg" /></a>
					<a href="facilities/images/banqnet/iris_02.jpg" title="image2"><img src="facilities/images/banqnet/th_iris_02.jpg" /></a>
				</div>
				<br>
			 	<p>����ϰ� ���õ� �̹����� ���̸��� Ȧ�� �ո� ��ü�� �̷�� �ִ� �����ʸ��� �ҳ������� �����̴� ��ҷ� �θ�ƽ�� �Ͽ콺 ���� ��Ƽ�� ���� ���� ���̳�, ��ũ��, ������ȸ ���� �����ϱ⿡ �����ϴ�.
				<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
			<div id="tabs-2">
				<div id="largeImg"><img src="facilities/images/banqnet/wyiyuan_01.jpg" alt="image1"/></div>
				<div class="thumbs">
				<a href="facilities/images/banqnet/wyiyuan_01.jpg" title="image1"><img src="facilities/images/banqnet/th_wyiyuan_01.jpg" /></a>
				<a href="facilities/images/banqnet/wyiyuan_02.jpg" title="image2"><img src="facilities/images/banqnet/th_wyiyuan_02.jpg" /></a>
				<a href="facilities/images/banqnet/wyiyuan_03.jpg" title="image2"><img src="facilities/images/banqnet/th_wyiyuan_03.jpg" /></a>        
				</div>
				<br>
				<p>MJ HOTEL�� �Ƹ��ٿ� �ڿ������ ������� �����̺��� ��Ƽ�� ����ġ,
				<br>������ȸ, �Ͽ콺����, ����Ͻ� ���ӿ� ������ �����Դϴ�.
				<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div> 
			<div id="tabs-3">
				<div id="largeImg"><img src="facilities/images/banqnet/Lotus_01.jpg" alt="image1"/></div>
				<div class="thumbs">
				<a href="facilities/images/banqnet/Lotus_01.jpg" title="image1"><img src="facilities/images/banqnet/th_Lotus_01.jpg" /></a>
				</div>
				<br>
				<p>�ұԸ� ��Ƽ�� ����Ͻ� ������ ������ �ٸ��� ��ȸ������ ��ġ�� õ����
				<br>�ƴ��ϰ� ���õ� �����⸦ �����Ͽ� ��ǰ�� �����̺� ���ӿ� ������ ����Դϴ�.
				<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>