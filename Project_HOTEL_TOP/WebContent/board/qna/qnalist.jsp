<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.qna_list_box .ico_lock {
	display: inline-block;
	overflow: hidden;
	width: 15px;
	height: 15px;
	margin: -2px 0 0 3px;
	line-height: 500%;
	background: url("images/board/qna/ico_lock.gif") no-repeat;
	vertical-align: middle;
}

.qna_list_box .qna_state {
	display: inline-block;
	width: 47px;
	margin: -3px 6px 0 0;
	border: 1px solid #afb5c1;
	background: #fff;
	text-align: center;
	letter-spacing: -1px;
	font-size: 11px;
	line-height: 1.5;
	color: #677791;
	vertical-align: middle;
}

td a {
	color: #000;
}

.paging a {
	color: #000;
	font-size: 17px;
}
</style>
<link href="css/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.11.3.js"></script>
<script src="js/SpryCollapsiblePanel.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#select_type").change(function() {
			document.form.submit();
		});
	});
</script>


<div class="qna_list_box">
		<hr size=3>
		<font size="5" style="font-weight: bold;">Q & A</font>
		<hr color="white">
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
<script type="text/javascript">
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1", {contentIsOpen:false});
var CollapsiblePanel2 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel2", {contentIsOpen:false});
var CollapsiblePanel3 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel3", {contentIsOpen:false});
var CollapsiblePanel4 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel4", {contentIsOpen:false});
var CollapsiblePanel5 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel5", {contentIsOpen:false});
</script>
	
	<div>
		<hr color="white" style="margin: 0 0 15px 0"></div>
	<div style="height: 30px; margin:10px 0;">
		<form method="post" name="form" action="qnalist" style="display: inline-block;">
			<select class="form-control" name="keytype" id="select_type">
				<option selected="selected" value="">문의유형(전체)</option>
				<option value="예약">예약</option>
				<option value="객실">객실</option>
				<option value="시설">시설</option>
				<option value="기타">기타</option>
			</select>
		</form>
		<button type="button" class="btn btn-default" onclick="location.href='qnaform'" style="float: right;">문의하기</button>
		<script>
			document.form.keytype.value = "${keytype}"
		</script>
	</div>
	<div>
		<table class="table table-striped" style="margin-bottom: 0">
			<colgroup>
				<col style="width: 15%" />
				<col style="width: 50%" />
				<col style="width: 10" />
				<col style="width: 15%" />
				<col style="width: 10" />
			</colgroup>
			<tr>
				<th scope="col">문의유형</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td class="center">${vo.type}</td>
					<td  style="text-align:left;"><c:if test="${vo.reply==null}">
							<span class="qna_state">미답변</span>
						</c:if> <c:if test="${vo.reply!=null}">
							<span class="qna_state">답변완료</span>
						</c:if> <c:if test="${vo.secret==1}">
							<c:choose>
								<c:when test="${vo.name==user || user=='admin'}">
									<a href="qnadetail?num=${vo.num}&user=${user}">${vo.title}</a>
									<span class="ico_lock">게시물잠김</span>
								</c:when>
								<c:otherwise>
								${vo.title}<span class="ico_lock">게시물잠김</span>
								</c:otherwise>
							</c:choose>
						</c:if> <c:if test="${vo.secret==0}">
							<a href="qnadetail?num=${vo.num}">${vo.title}</a>
						</c:if></td>
					<td class="center">${vo.name}</td>
					<td class="center">${vo.nalja}</td>
					<td class="center">${vo.hit}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=5 style="padding: 0"></td>
			</tr>
		</table>



		<nav style="text-align: center;">
			<ul class="pagination">
				<c:if test="${startpage > pagesize }">
					<li><a
						href="qnalist?keytype=${keytype}&pagenum=${startpage-pagesize}"
						aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
					</li>
				</c:if>
				<c:set var="flag" value="true" />
				<c:forEach var="page" begin="${startpage}"
					end="${startpage+pagesize-1 }">
					<c:if test="${flag}">
						<li><a href="qnalist?keytype=${keytype}&pagenum=${page}">${page}</a></li>
					</c:if>
					<c:if test="${page==totalpage}">
						<c:set var="flag" value="false"></c:set>
					</c:if>
				</c:forEach>

				<c:if test="${startpage+pagesize<=totalpage}">
					<li><a
						href="qnalist?keytype=${keytype}&pagenum=${startpage+pagesize}"
						aria-label="Next">&raquo;</a></li>
				</c:if>
			</ul>
		</nav>



	</div>
</div>
</div>




