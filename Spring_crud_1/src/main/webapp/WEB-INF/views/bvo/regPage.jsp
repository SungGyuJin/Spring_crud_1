<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="regForm" action="/bvo/regPage" method="post">
		<div>
			<label>제목</label>
			<input type="text" name="title">
		</div>
			<label>내용</label>
			<input type="text" name="content">
		<div>
		</div>
			<label>작성자</label>
			<input type="text" name="writer">
		<div>
		<button>등록</button>
	</form>
	
</body>
</html>