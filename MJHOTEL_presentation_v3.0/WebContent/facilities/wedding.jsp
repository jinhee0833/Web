<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>wedding.jsp</title>
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
		<div id="fa_title2">Wedding</div>
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">BALLROOM</a></li>
				<li><a href="#tabs-2">GARDEN</a></li>
				<li><a href="#tabs-3">ATRIUM</a></li>
				<li><a href="#tabs-4">CALLA</a></li>
				<li><a href="#tabs-5">ORCHID</a></li>
				<li><a href="#tabs-6">TRADITIONAL</a></li>
			</ul>
			<div id="tabs-1">
			<div id="largeImg"><img src="facilities/images/wedding/weddingballroom1.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/weddingballroom1.jpg" title="image1"><img src="facilities/images/wedding/th_weddingballroom1.jpg" /></a>
			<a href="facilities/images/wedding/weddingballroom2.jpg" title="image2"><img src="facilities/images/wedding/th_weddingballroom2.jpg" /></a>
			<a href="facilities/images/wedding/weddingballroom3.jpg" title="image3"><img src="facilities/images/wedding/th_weddingballroom3.jpg" /></a>
			</div>
			<br>
			<p>����� ��ũ �׷��� ������ ��ǰ �ְ� ���õ� �����⸦ �����ϴ� MJ HOTEL ������ ������ �������� ���� �ϰ��� �ູ �ӿ� �������� ������ �޲ٴ� �Ŷ�, �źο��� �Ƹ��ٿ� ������ ����մϴ�.
			<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
			  
			<div id="tabs-2">
			<div id="largeImg"><img src="facilities/images/wedding/bell_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/bell_01.jpg" title="image1"><img src="facilities/images/wedding/th_bell_01.jpg" /></a>
			<a href="facilities/images/wedding/bell_02.jpg" title="image2"><img src="facilities/images/wedding/th_bell_02.jpg" /></a>
			</div>
			<br>
			<p>��ž�� ���Ҹ��� �������� ��ȭ���� �� ���� ��ȥ���� �� �� �ִ� �����ν� �ڿ��� �Ƹ��ٿ��� �״�� ��� �� �ִ� ��Ư�� ��ȥ������ ���� ���� �� �ֽ��ϴ�.
			<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
			  
			<div id="tabs-3">
			<div id="largeImg"><img src="facilities/images/wedding/atrium_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/atrium_01.jpg" title="image1"><img src="facilities/images/wedding/th_atrium_01.jpg" /></a>
			</div><br>
			<p>��Ʈ������ �м��� ���޾� �̾��� ������ ���� ������ �����ν� ����ϰ� ��ǰ�� �������� �����Դϴ�.<br>������ ������ ������ �� ��Ÿ���� ��ž�� ȸ���� �ѷ����� ��Ʈ������ ���󿡼� ���� Ư���� ���� ���� ���� �����Դϴ�.
			<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
			  
			<div id="tabs-4">
			<div id="largeImg"><img src="facilities/images/wedding/calla_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/calla_01.jpg" title="image1"><img src="facilities/images/wedding/th_calla_01.jpg" /></a>
			<a href="facilities/images/wedding/calla_02.jpg" title="image2"><img src="facilities/images/wedding/th_calla_02.jpg" /></a>
			<a href="facilities/images/wedding/calla_03.jpg" title="image3"><img src="facilities/images/wedding/th_calla_03.jpg" /></a>
			<a href="facilities/images/wedding/calla_04.jpg" title="image3"><img src="facilities/images/wedding/th_calla_04.jpg" /></a>
			</div><br>
			<p>ȭ��Ʈ ���� ��޽����� ������ �̹����� ǥ���� ī�� Ȧ��<br>���� ����ε�� ���� ������ õ���� ���� �ڿ��� ���� ���� �� ������, ���⿡ �ź�ο� ������ ������ �������� �������� ���Ͽ� �������� ä�ý� ������ ������ �� �ֽ��ϴ�.
			<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
			  
			<div id="tabs-5">
			<div id="largeImg"><img src="facilities/images/wedding/orchid_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/orchid_01.jpg" title="image1"><img src="facilities/images/wedding/th_orchid_01.jpg" /></a>
			<a href="facilities/images/wedding/orchid_02.jpg" title="image2"><img src="facilities/images/wedding/th_orchid_02.jpg" /></a>
			</div>
			<br>
			<p>�׷��̿� ���̺��� ���� ��ȭ�� ��޽����� ����� �����⸦ �ھƳ��� ��Ű�� Ȧ�� ������ �źθ� ���� ������ ���� ǰ�� �ְ� Ŭ������ ������ �����Դϴ�.
			<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
			  
			<div id="tabs-6">
			<div id="largeImg"><img src="facilities/images/wedding/traditional_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/traditional_01.jpg" title="image1"><img src="facilities/images/wedding/th_traditional_01.jpg" /></a>
			<a href="facilities/images/wedding/traditional_02.jpg" title="image2"><img src="facilities/images/wedding/th_traditional_02.jpg" /></a>
			<a href="facilities/images/wedding/traditional_03.jpg" title="image3"><img src="facilities/images/wedding/th_traditional_03.jpg" /></a>
			<a href="facilities/images/wedding/traditional_04.jpg" title="image3"><img src="facilities/images/wedding/th_traditional_04.jpg" /></a>       
			</div>
			<br>
			<p>�ѱ��� ���빮ȭ�� �Ƹ��ٿ��� �˸���, �ѱ����� �ǽİ� ȥ�� ��� �ϼ��� ���� ������ �����̰� �ֽ��ϴ�. �溹�� ������ ������ ��ȭ�� ����� ���ϱ� ������ ���� �ʷ�û���� �� �ݽ��� �״�� ������ ȥ�ʽ��� MJ HOTEL ���� ȥ�ʸ��� �ŷ��Դϴ�.
			<br><br>* ���� �� ����: (02)1234-1234 / wedding@mjhotel.co.kr</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>