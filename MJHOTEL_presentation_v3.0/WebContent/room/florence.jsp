<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>florence</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(function() {
   		$(".thumbs a").click(function(){	
   			var path = $(this).attr("href");
   			$(this).parent().prev().find("img").attr({ src: path });
   			$(this).parent().prev().find("img").css("opacity","0.5").stop().animate({opacity:2},4000);
   			return false;
   		});		
  	});	
</script>
</head>
<body>
<div id="roomF">  
	<div id="room_title2">Florence</div>
    <div id="largeImg"><img src="room/images/florence1.jpg" alt="image1" /></div>
    <div class="thumbs">
        <a href="room/images/florence1.jpg" title="image1"><img src="room/images/florence_th1.jpg" /></a>
        <a href="room/images/florence2.jpg" title="image2"><img src="room/images/florence_th2.jpg" /></a>
        <a href="room/images/florence3.jpg" title="image3"><img src="room/images/florence_th3.jpg" /></a>
        <a href="room/images/florence4.jpg" title="image4"><img src="room/images/florence_th4.jpg" /></a>
    </div>
  	<p class="roomS">�÷η��� ����Ʈ ���� ������ ����� VIP ���� ���� �� ǰ�� �ִ� ��ҷ� MJ ȣ���� �ְ��� �����Դϴ�.
	<br>���� 02 - 2230 - 3310 
	<br>��� ���ǰ� ������� ���� ��, ���� ���ͳ� ����� �����մϴ�.
	</p>
	
	<p class="roomB">This Room</p>	
	<p class="roomS">���� ����Ʈ TV(���� TV 52�� ä��)����ä������ ����
	<br>300Mbps �ʰ�� ���ͳ� ��,���� ����
	<br>220V, 110V ���� ��� ����
	<br>Ŀ��,�� Ƽ�� ���� ����
	<br>Extra Bed �߰� - 30,000/1��
	<br>Baby Crib(����)
	</p>
	
	<p class="roomB">Room Service</p>	
	<p class="roomS">���ǿ��� ���� �� �ִ� �پ��� �뼭�� �޴��� �غ�Ǿ� �ֽ��ϴ�.
	<br>��� �� ���� : 24�ð� ����
	<br>�ѽ�, �Ͻ� :
	<br>- ���� : 07:00~10:00
	<br>- ���� : 12:00~14:30
	<br>- ���� : 18:00~22:00
	</p>
</div>
</body>
</html>