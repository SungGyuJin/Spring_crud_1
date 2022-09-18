<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	.btn{
		cursor: pointer;
		border: solid 2px red;
	}
</style>
</head>
<body>
	<form id="modifyForm" action="/bvo/modifyPage" method="post">
		<div>
			<label>번호</label>
			<input type="text" name="bno" value="${list.bno}" readonly="readonly">
		</div>
		<div>
			<label>제목</label>
			<input type="text" name="title" value="${list.title}">
		</div>
			<label>내용</label>
			<textarea name="content" rows="5">${list.content}</textarea>
		<div>
		</div>
			<label>글쓴이</label>
			<input type="text" name="writer" value="${list.writer}" readonly="readonly">
		<div>
		</div>
			<label>등록일</label>
			<input type="text" name="regDate" value="${list.regDate}" readonly="readonly">
		<div>
			<label>수정일</label>
			<input type="text" name="updateDate" value="${list.updateDate}" readonly="readonly">
		</div>
	</form>
	<div class="btn_wrap">
		<a class="btn" id="btn_modify">수정완료</a>
		<a class="btn" id="btn_list">목록페이지</a>
		<a class="btn" id="btn_cancel">취소</a>
		<a class="btn" id="btn_remove">삭제</a>
	</div>
	
	<form id="moveForm" action="/bvo/modifyPage" method="get">
		<input type="text" id="bno" name="bno" value='<c:out value="${list.bno}"/>'>
		<input type="text" name="nowPage" value="<c:out value='${cri.nowPage}'/>">
		<input type="text" name="amount" value="<c:out value='${cri.amount}'/>">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
	
<script type="text/javascript">

	let moveForm = $('#moveForm');
	let modifyForm = $('#modifyForm');
	
	// 버튼 (수정완료)
	$('#btn_modify').on('click', function(e){
		
		modifyForm.submit();
	});
	
	// 버튼 (목록페이지 이동)
	$('#btn_list').on('click', function(e){
		
		moveForm.find('#bno').remove();
		moveForm.attr("action", "/bvo/listPage");
		moveForm.submit();
	});
	
	// 버튼 (취소)
	$('#btn_cancel').on('click', function(e){
		
		moveForm.attr("action", "/bvo/detailPage");
		moveForm.submit();
	});
	
	// 버튼 (삭제)
	$('#btn_remove').on('click', function(e){
		
		moveForm.attr("action", "/bvo/deleteBoard");
		moveForm.attr("method", "POST");
		moveForm.submit();
	});
	

</script>
</body>
</html>