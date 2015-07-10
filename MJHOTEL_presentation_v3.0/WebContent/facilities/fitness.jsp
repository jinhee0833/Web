<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>fitness.jsp</title>
<link rel="stylesheet" type="text/css" href="facilities/css/styles.css"></link>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
</head>

<!--  ���ǻ��� ���� ��ũ�� ��ũ��Ʈ  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<!--  ���ǻ��� ���� ��ũ��Ʈ  -->
<script>
	$(function() {
		$("#accordion").accordion({
			event : "click hoverintent"
		});
	});

	$.event.special.hoverintent = {
		setup : function() {
			$(this).bind("mouseover", jQuery.event.special.hoverintent.handler);
		},
		teardown : function() {
			$(this).unbind("mouseover",
					jQuery.event.special.hoverintent.handler);
		},
		handler : function(event) {
			var currentX, currentY, timeout, args = arguments, target = $(event.target), previousX = event.pageX, previousY = event.pageY;

			function track(event) {
				currentX = event.pageX;
				currentY = event.pageY;
			}
			;

			function clear() {
				target.unbind("mousemove", track).unbind("mouseout", clear);
				clearTimeout(timeout);
			}

			function handler() {
				var prop, orig = event;

				if ((Math.abs(previousX - currentX) + Math.abs(previousY
						- currentY)) < 7) {
					clear();

					event = $.Event("hoverintent");
					for (prop in orig) {
						if (!(prop in event)) {
							event[prop] = orig[prop];
						}
					}

					delete event.originalEvent;

					target.trigger(event);
				} else {
					previousX = currentX;
					previousY = currentY;
					timeout = setTimeout(handler, 100);
				}
			}

			timeout = setTimeout(handler, 100);
			target.bind({
				mousemove : track,
				mouseout : clear
			});
		}
	};
</script>

<!--  �̹��� ��� ����  -->
<script type="text/javascript">
	$(document).ready(function() {

		/*�����Ҷ� */
		var default_image = 'facilities/images/fitness/large/facilityimgs07.jpg';
		var default_caption = 'MJ Hotel Fitness Center';

		/*(����) default �ҷ�����*/
		loadPhoto(default_image, default_caption);

		function loadPhoto($url, $caption) {
			/*Image pre-loader*/
			var img = new Image();
			jQuery(img).load(function() {
				jQuery(img).hide();
			}).attr({
				"src" : $url
			});
			$('#largephoto').css('background-image', 'url("' + $url + '")');
		}

		/* ����� Ŭ�� ��*/
		$('.thumb_container').click(function() {
			var handler = $(this).find('.large_image');
			var newsrc = handler.attr('src');
			var newcaption = handler.attr('rel');
			loadPhoto(newsrc, newcaption);
		});

		/* ����� �ִ� ���̼� ���� ����� �ʹ� ������. */
		$('.thumb_container').hover(function() {
			$(this).find(".large_thumb").stop().animate({
				marginLeft : -5,
				marginTop : -5
			}, 200);

		}, function() {
			$(this).find(".large_thumb").stop().animate({
				marginLeft : 0,
				marginTop : 0
			}, 200);
		});
	});
</script>
<body>
<div id="faF3">
	<div id="fa_title2">Fitness</div>
</div>			
		<div id="container">
			<div id="containertitle">MJ Hotel Fitness Center</div>
			<div class="mainframe">
				<div id="largephoto">
					<div id="largetrans"></div>
				</div>
			</div>
			<div class="thumbnails">
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs01.jpg" class="large_thumb_image" alt="thumb" />
							<img src="facilities/images/fitness/large/facilityimgs01.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs02.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs02.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs03.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs03.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs04.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs04.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs05.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs05.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs06.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs06.jpg" class="large_image"  />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs07.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs07.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs08.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs08.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs09.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs09.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs10.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs10.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div>
			<h1 style="padding:20px; font-size: 2em; color:#6e6464;">More Information</h1>
			<div id="accordion">
				<h3 style="color: #FFFFFF; background: #DE0028;">About MJ Fitness Center</h3>
				<div>
					<p>MJ Hotel�� ��Ʈ�Ͻ� ���ʹ� 65m�� ����Ʈ���� ���׸ӽ�, 30������ �ֽ� ��ⱸ�� �ǳ� ������ü���
						�����ϰ� ������ ���� Ʈ���̳ʰ� �����ϸ�, ü�������� ���� GX Room���� �䰡, �ʶ��׽�, ���Ǵ׵� ���� ���α׷���
						�����մϴ�.</p>
				</div>
				<h3 style="color: #FFFFFF; background: #DE0028;">�̿�ð� �� ���� �ȳ�</h3>
				<div>
					<p>�ｺŬ���� 06:00~22:00���� ��ϸ�, �������� 21:30���� ��մϴ�.</p>
					<p>���߹��޷� ��ǰ� �ִ� ��Ʈ�Ͻ� ���Ͱ� ������ ������ ���� ��å ���� �� ����ü� ������ �������� �ſ� ��°��
						ȭ���� ���� �ް��� �ǽ��մϴ�.
				</div>
		
				<h3 style="color: #FFFFFF; background: #DE0028;">�������� �� ���� ��ȭ</h3>
				<div>
					<p>�ǳ� �������� ���л� ���� �̿밡�� �ϸ�,��Ʈ�Ͻ� ���ʹ� ����л� ���� �̿� �����մϴ�.</p>
					<p>*Ŭ�� ��� �̻��� ���� �̿� �� ������ ���� �̿밡��</p>
					<ul>
						<li>�Ϲ�����ȭ</li>
						<li>TEL> 02.555.5555</li>
						<li>PHONE> 010.1818.4444</li>
					</ul>
				</div>
		
				<h3 style="color: #FFFFFF; background: #DE0028;">GX ���α׷� �ȳ�</h3>
				<div>
					<ul>
						<li>19:00~20:00</li>
						<li>�� : �䰡 (���ٴϿ� ������)</li>
						<li>ȭ : �ӽ��� (�Ƴ�� ȫ ������)</li>
						<li>�� : �ٵ���Ʈ�Ͻ� (�� �� ������)</li>
						<li>�� : �ʶ��׽� (Ŭ��� ������)</li>
						<li>�� : �Ǽ�ü�� (��ȫö ������)</li>
					</ul>
				</div>
			</div>
		</div>	
</body>
</html>
