<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>qna</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="qna/css/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css">
<script src="qna/css/SpryCollapsiblePanel.js" type="text/javascript"></script>
<style type="text/css">
.abox{
	padding-bottom:10px;
	margin-bottom:10px;	
}
.tab{
	margin-top:10px;
	margin-left:30px;
	line-height:30px;
}
.boldtext{
	font-weight: bold;
	font-family: Arial;
	color:#0B9EC4;
}
</style>
</head>
<body>
<div class="gridContainer clearfix">
  <div id="CollapsiblePanel1" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;단체 예약을 하려면 어떻게 해야 하나요?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A</span> &nbsp; 아래 전화로 문의 하시기 바랍니다.</div>
        <ul class="tab">
			<li>TEL 02-1234-1234 (단체 예약문의)</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel2" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;체크인 / 체크아웃 시간을 알고 싶습니다. </div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A</span> &nbsp; 체크인 / 체크아웃 시간은 다음과 같습니다.</div>
        <ul class="tab">
		<li>- 체크인: 오후 3시 이후</li>
		<li>- 체크아웃: 낮 11시</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel3" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;반려동물의 입장이 가능한가요?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A</span> &nbsp; 안내견을 제외한 애완견 등 동물입장은 불가합니다.</div>
        <ul class="tab">
			<li>이점 양해 부탁드립니다.</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel4" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;미성년자의 입실이 가능한가요?</div>
    <div class="CollapsiblePanelContent">
        <p class="abox"><span class="boldtext">A</span> &nbsp; 부모를 동반하지 않는 미성년자는 투숙할 수 없습니다.</p>
        <ul class="tab">
			<li>(청소년 보호법 30조/58조)</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel5" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;객실에 공통으로 적용되는 서비스는 무엇인가요?</div>
    <div class="CollapsiblePanelContent">
        <p class="abox"><span class="boldtext">A</span> &nbsp; MJ 호텔에서 제공해 드리는 공통 서비스는 다음과 같습니다.</p>
        <ul class="tab">
			<li class="boldtext">객실 시설</li>
			<li>- 고급 린넨, 거위털 이불, 오리털 베개, 모던한 욕실</li>
			<li>- 객실에 따라 다양한 형태의 욕실 : Shower-booth type / Bath-tub type</li>
			<li>- 아로마테라피 고급 욕실용품 : 샴푸, 컨티셔터, 샤워젤, 비누</li>
			<li>- 42” Full HD TV</li>
			<li>- 무료 인터넷 전용선</li>
			<li>- 무료생수, 커피</li>
		</ul>
		<ul class="tab">
			<li class="boldtext">부대 시설</li>
			<li>- Modern & Delight Banquet (SOYOO premium buffet)</li>
			<li>- BBQ Loft Garden (HEGUNL 해그늘)</li>
			<li>- Real Espresso Cafe (Cafe ARCO)</li>
			<li>- Body & Foot Skincare (강남스킨케어)</li>
			<li>- 상상력을 자극하는 키즈클럽 (KIDS CLUB)</li>
			<li>- 다양한 미팅이 가능한 미팅룸 (VIP Room, Conference Room)</li>
		</ul>
    </div>
  </div> 
</div>
<div style="height: 400px;">
</div>
<script type="text/javascript">
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1", {contentIsOpen:false});
var CollapsiblePanel2 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel2", {contentIsOpen:false});
var CollapsiblePanel3 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel3", {contentIsOpen:false});
var CollapsiblePanel4 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel4", {contentIsOpen:false});
var CollapsiblePanel5 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel5", {contentIsOpen:false});
</script>
</body>
</html>