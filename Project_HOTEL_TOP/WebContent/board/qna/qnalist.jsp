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
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;��ü ������ �Ϸ��� ��� �ؾ� �ϳ���?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A</span> &nbsp; �Ʒ� ��ȭ�� ���� �Ͻñ� �ٶ��ϴ�.</div>
        <ul class="tab">
			<li>TEL 02-1234-1234 (��ü ���๮��)</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel2" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;üũ�� / üũ�ƿ� �ð��� �˰� �ͽ��ϴ�. </div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A</span> &nbsp; üũ�� / üũ�ƿ� �ð��� ������ �����ϴ�.</div>
        <ul class="tab">
		<li>- üũ��: ���� 3�� ����</li>
		<li>- üũ�ƿ�: �� 11��</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel3" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;�ݷ������� ������ �����Ѱ���?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A</span> &nbsp; �ȳ����� ������ �ֿϰ� �� ���������� �Ұ��մϴ�.</div>
        <ul class="tab">
			<li>���� ���� ��Ź�帳�ϴ�.</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel4" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;�̼������� �Խ��� �����Ѱ���?</div>
    <div class="CollapsiblePanelContent">
        <p class="abox"><span class="boldtext">A</span> &nbsp; �θ� �������� �ʴ� �̼����ڴ� ������ �� �����ϴ�.</p>
        <ul class="tab">
			<li>(û�ҳ� ��ȣ�� 30��/58��)</li>
		</ul>
    </div>
  </div> 
  <div id="CollapsiblePanel5" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q &nbsp;���ǿ� �������� ����Ǵ� ���񽺴� �����ΰ���?</div>
    <div class="CollapsiblePanelContent">
        <p class="abox"><span class="boldtext">A</span> &nbsp; MJ ȣ�ڿ��� ������ �帮�� ���� ���񽺴� ������ �����ϴ�.</p>
        <ul class="tab">
			<li class="boldtext">���� �ü�</li>
			<li>- ��� ����, ������ �̺�, ������ ����, ����� ���</li>
			<li>- ���ǿ� ���� �پ��� ������ ��� : Shower-booth type / Bath-tub type</li>
			<li>- �Ʒθ��׶��� ��� ��ǿ�ǰ : ��Ǫ, ��Ƽ����, ������, ��</li>
			<li>- 42�� Full HD TV</li>
			<li>- ���� ���ͳ� ���뼱</li>
			<li>- �������, Ŀ��</li>
		</ul>
		<ul class="tab">
			<li class="boldtext">�δ� �ü�</li>
			<li>- Modern & Delight Banquet (SOYOO premium buffet)</li>
			<li>- BBQ Loft Garden (HEGUNL �ر״�)</li>
			<li>- Real Espresso Cafe (Cafe ARCO)</li>
			<li>- Body & Foot Skincare (������Ų�ɾ�)</li>
			<li>- ������ �ڱ��ϴ� Ű��Ŭ�� (KIDS CLUB)</li>
			<li>- �پ��� ������ ������ ���÷� (VIP Room, Conference Room)</li>
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
				<option selected="selected" value="">��������(��ü)</option>
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="�ü�">�ü�</option>
				<option value="��Ÿ">��Ÿ</option>
			</select>
		</form>
		<button type="button" class="btn btn-default" onclick="location.href='qnaform'" style="float: right;">�����ϱ�</button>
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
				<th scope="col">��������</th>
				<th scope="col">����</th>
				<th scope="col">�ۼ���</th>
				<th scope="col">�ۼ���</th>
				<th scope="col">��ȸ��</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td class="center">${vo.type}</td>
					<td  style="text-align:left;"><c:if test="${vo.reply==null}">
							<span class="qna_state">�̴亯</span>
						</c:if> <c:if test="${vo.reply!=null}">
							<span class="qna_state">�亯�Ϸ�</span>
						</c:if> <c:if test="${vo.secret==1}">
							<c:choose>
								<c:when test="${vo.name==user || user=='admin'}">
									<a href="qnadetail?num=${vo.num}&user=${user}">${vo.title}</a>
									<span class="ico_lock">�Խù����</span>
								</c:when>
								<c:otherwise>
								${vo.title}<span class="ico_lock">�Խù����</span>
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




