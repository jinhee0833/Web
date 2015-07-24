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
				<th scope="col">문의유형</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			<tr>
				<td>
					<select name="keytype">
					<option selected="selected" value="">문의유형(전체)</option>
					<option value="예약">예약</option>
					<option value="객실">객실</option>
					<option value="시설">시설</option>
					<option value="기타">기타</option></select></td>
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
			<button class="btn btn-default" onclick="location.href='http://localhost:8080/Project_HOTEL_TOP/qnalist'" style="float:right;"/>리스트</button>
			<input class="btn btn-default" type="submit" value="수정완료" style="float:right;">
		</div>
	</div>
</form>
