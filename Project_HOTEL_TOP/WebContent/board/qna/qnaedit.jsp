<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form name="form" method="post" action="qnaedit?num=${vo.num}">
	<div class="qna_edit_box">
		<table class="table table-striped">
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
			<tr>
				<td>
					<select name="keytype">
					<option selected="selected" value="">��������(��ü)</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="�ü�">�ü�</option>
					<option value="��Ÿ">��Ÿ</option></select></td>
					<script>document.form.keytype.value="${vo.type}"</script>
				<td><input name="title" type="text" value="${vo.title}" style="width:99%"></td>
				<td>${vo.name}</td>
				<td>${vo.nalja}</td>
				<td>${vo.hit}</td>
			</tr>
			<tr>
				<td colspan="5"><textarea class="form-control" name="content" rows="7" cols="104">${vo.content}</textarea></td>
			</tr>
			<c:if test="${vo.reply != null }">
				<tr>
					<td>${vo.reply}</td></tr>
			</c:if>
		</table>
		<div>
			<button class="btn btn-default" onclick="location.href='http://localhost:8080/Project_HOTEL_TOP/qnalist'" style="float:right;"/>����Ʈ</button>
			<input class="btn btn-default" type="submit" value="�����Ϸ�" style="float:right;">
		</div>
	</div>
</form>
