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
				<th scope="row" style="vertical-align:middle;">��������</th>
				<td>
				<span style="display:block; float:left;">
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="����" checked>����</label>
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="����">����</label>
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="�ü�">�ü�</label>
					<label class="radio-inline">
	  				<input type="radio" name="type" id="inlineRadio1" value="��Ÿ">��Ÿ</label></span>
				<span style="display:block; float:right;">
					<label class="checkbox-inline" style="padding:6px 0">
  				<input type="checkbox" name="secret" id="inlineCheckbox1" value="1">�����</label></span></td></tr>
			<tr>
				<th scope="row" style="vertical-align:middle;">�� ��</th>
				<td>
					<input type="text" class="form-control" id="exampleInputName2" name="title"></td></tr>
			<tr>
				<th scope="row" style="vertical-align:middle;">�� ��</th>
				<td><textarea class="form-control" name="content" rows="7" cols="82"></textarea></td></tr>
		</tbody>
	</table>
	<div style="text-align:right;">
		<input type="hidden" name="name" value="${user}">
		<input class="btn btn-default" type="submit" value="���">
		<input class="btn btn-default" type="button" value="���" onclick="location.href='qnalist'"></div>
</form>
</div>