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
<style>
	
	.pageInfo{
		list-style: none;
		margin: 50px 0 0 100px;
	}

	.pageBtn li{
		float: left;
		margin: 0 0 0 20px;
	}
	.active{
		background-color: pink;
	}
	.search_area{
    	display: inline-block;
    	margin-top: 30px;
    	margin-left: 260px;
  	}
  	.search_area input{
    	height: 30px;
    	width: 250px;
  	}
  	.search_area button{
  		width: 100px;
    	height: 36px;
    	cursor: pointer;
  	}
</style>
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
	<br>
	<div class="search_wrap">
		<div class="search_area">
			<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
			<button>검색</button>
		</div>	
	</div>
	
	<div class="pageBtn">
		<div class="pageBtn_area">
			<ul class="pageInfo" id="pageInfo">
			
				<!-- 이전버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn prev"><a href="${pageMaker.startPage - 1}">이전</a></li>
				</c:if>
			
				<!-- 페이지 번호 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageBtn_li ${pageMaker.cri.nowPage == num ? "active":""}"><a href="${num}">${num}</a></li>
				</c:forEach>
				
				<!-- 다음버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn prev"><a href="${pageMaker.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<form id="moveForm" method="get">
		<input type="hidden" name="nowPage" value="${pageMaker.cri.nowPage}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
	
	$('#pageInfo a').on("click", function(e){
		
		e.preventDefault();
		
		moveForm.find("input[name='nowPage']").val($(this).attr("href"));
		moveForm.attr("action", "/bvo/listPage");
		moveForm.submit();
	});
	
	$(".search_area button").on("click", function(e){
		
		e.preventDefault();
		
		let val = $("input[name='keyword']").val();
		moveForm.find("input[name='keyword']").val(val);
		moveForm.find("input[name='nowPage']").val(1);
		moveForm.submit();
	});
	
</script>
</body>	
</html>