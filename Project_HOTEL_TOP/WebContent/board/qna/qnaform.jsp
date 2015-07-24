<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
<form method="post" action="qnainsert">
	<table class="table table-striped">
		<colgroup> 
			<col style="width:25%" />
			<col style="width:75%" /></colgroup>
		<tbody>
			<tr>
				<th scope="row" style="vertical-align:middle;">문의유형</th>
				<td>
				<span style="display:block; float:left;">
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="예약" checked>예약</label>
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="객실">객실</label>
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="시설">시설</label>
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="기타">기타</label></span>
				<span style="display:block; float:right;">
					<label class="checkbox-inline" style="padding:6px 0">
  				<input type="checkbox" name="secret" id="inlineCheckbox1" value="1">비공개</label></span></td></tr>
			<tr>
				<th scope="row" style="vertical-align:middle;">제 목</th>
				<td>
					<input type="text" class="form-control" id="exampleInputName2" name="title"></td></tr>
			<tr>
				<th scope="row" style="vertical-align:middle;">내 용</th>
				<td><textarea class="form-control" name="content" rows="7" cols="82"></textarea></td></tr>
		</tbody>
	</table>
	<div style="text-align:right;">
		<input type="hidden" name="name" value="${user}">
		<input class="btn btn-default" type="submit" value="등록">
		<input class="btn btn-default" type="button" value="취소" onclick="location.href='qnalist'"></div>
</form>
</div>