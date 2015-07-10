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
  	<p class="roomS">플로렌스 스위트 룸은 전세계 국빈과 VIP 전용 객실 및 품격 있는 장소로 MJ 호텔의 최고의 객실입니다.
	<br>문의 02 - 2230 - 3310 
	<br>모든 객실과 레스토랑 에서 유, 무선 인터넷 사용이 가능합니다.
	</p>
	
	<p class="roomB">This Room</p>	
	<p class="roomS">대형 스마트 TV(위성 TV 52개 채널)위성채널정보 보기
	<br>300Mbps 초고속 인터넷 유,무선 무료
	<br>220V, 110V 전압 사용 가능
	<br>커피,차 티백 무료 제공
	<br>Extra Bed 추가 - 30,000/1개
	<br>Baby Crib(무료)
	</p>
	
	<p class="roomB">Room Service</p>	
	<p class="roomS">객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.
	<br>양식 및 음료 : 24시간 서비스
	<br>한식, 일식 :
	<br>- 조식 : 07:00~10:00
	<br>- 점심 : 12:00~14:30
	<br>- 저녁 : 18:00~22:00
	</p>
</div>
</body>
</html>