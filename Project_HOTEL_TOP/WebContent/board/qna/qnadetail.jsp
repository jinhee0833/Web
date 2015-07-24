<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="qna_detail_box">
	<form method="post" action="qnareply?num=${vo.num}">
		<table class="table table-striped">
		<colgroup>
				<col style="width: 15%" />
				<col style="width: 50%" />
				<col style="width: 10%" />
				<col style="width: 15%" />
				<col style="width: 10%" />
			</colgroup>
			<tr>
				<th scope="col">��������</th>
				<th scope="col">����</th>
				<th scope="col">�ۼ���</th>
				<th scope="col">�ۼ���</th>
				<th scope="col">��ȸ��</th>
			</tr>
			<tr>
				<td>${vo.type}</td>
				<td style="text-align:left;">${vo.title}</td>
				<td>${vo.name}</td>
				<td>${vo.nalja}</td>
				<td>${vo.hit}</td>
			</tr>
			<tr>
				<th scope="col">���ǳ���</th>
				<td colspan="4" style="text-align:left;">${vo.content}</td></tr>
			<c:if test="${vo.reply != null}">
			<tr>
				<th scope="col" style="vertical-align:middle;">�� ��</th>
				<td colspan="4" style="text-align:left;">${vo.reply}</td></c:if>	
			<c:if test="${vo.reply==null and user=='admin'}">
				<tr>
					<th scope="col"  style="vertical-align:middle;">�� ��</th>
					<td colspan="3"><textarea class="form-control" name="reply" cols="82" rows="7"></textarea></td>
					<td><button class="btn btn-default" type="submit" style="display:block; width:100%;">�亯���</button></td></tr></c:if>
		</table></form>
		<button class="btn btn-default" onclick="location.href='qnalist'" style="float:right;"/>����Ʈ</button>
		<c:if test="${user==vo.name && vo.reply==null}">
			<button class="btn btn-default" onclick="location.href='qnadelete?num=${vo.num}'" style="float:right;"/>����</button>
			<button class="btn btn-default" onclick="location.href='qnadetail?editnum=${vo.num}'" style="float:right;"/>����</button></c:if>
		<c:if test="${user=='admin'}">
			<button class="btn btn-default" onclick="location.href='qnadelete?num=${vo.num}'" style="float:right;"/>�ش�ۻ���</button></c:if>
		<c:if test="${user=='admin' && vo.reply!=null}">
			<button class="btn btn-default" onclick="location.href='qnareply?num=${vo.num}'" style="float:right;"/>�亯����</button></c:if></div>