<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<a href="/bvo/regPage">등록페이지</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>수정일</th>
		</tr>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.bno}"/></td>
					<td>
						<a class="move" href="<c:out value='${list.bno}'/>"><c:out value="${list.title}"/></a>
					</td>
					<td><c:out value="${list.content}"/></td>
					<td><c:out value="${list.writer}"/></td>
					<td><fmt:formatDate value="${list.regDate}" pattern="yyyy/MM/dd"/></td>
					<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy/MM/dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="moveForm" method="get">
		
	</form>
	
	
<script type="text/javascript">

	$(document).ready(function(){
		
		let result = "<c:out value='${result}'/>";
		
		chkAlert(result);
		
		function chkAlert(result){
			
			if(result == ''){
				return;
			}
			
			if(result == 'enroll'){
				alert("게시글이 등록되었습니다.");
			}

			if(result == 'modify'){
				alert("게시글이 수정되었습니다.");
			}

			if(result == 'delete'){
				alert("게시글이 삭제되었습니다.");
			}
			
		}
		
	});
	
	let moveForm = $('#moveForm');
	
	$('.move').on("click", function(e){
		
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		moveForm.attr("action", "/bvo/detailPage");
		moveForm.submit();
	});
	
	
	
</script>
</body>	
</html>