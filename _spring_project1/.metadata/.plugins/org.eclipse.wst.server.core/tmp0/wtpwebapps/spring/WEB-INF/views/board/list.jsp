<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- CSS only -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list page</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div align="center"><h1>게시글 리스트</h1></div>
	
	<table class="table">
		<thead align="center"  vertical-align="middle">
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody align="center"  vertical-align="middle">
		<c:forEach items="${list }" var="b">
			<tr >
				<td>${b.bno }</td>
				<td>
				<a href="/board/post?bno=${b.bno}">
				<button type="button" class="btn btn-primary position-relative" style="border:none;background-color:white;color:black">
  ${b.title }
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    ${b.comment_cnt }
  </span>
</button>
</a>
				</td>
				<td>${b.file_cnt }</td>
				<td>${b.writer }</td>
				<td>${b.read_count }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table><br>
	<div align="center">
			<%-- 이전페이지 버튼 --%>
		<c:if test="${pgh.prev}">
			<a href="/board/list?pageNo=${pgh.startPage-1}&qty=${pgh.pgvo.qty}">
			<button type="button" class="btn btn-outline-primary">◀</button></a>
		</c:if>

		<c:forEach begin="${pgh.startPage}" end="${pgh.endPage}"
			var="destPageNum">
			<a href="/board/list?pageNo=${destPageNum}&qty=${pgh.pgvo.qty}">
			<button type="button" class="btn btn-outline-primary">${destPageNum }</button></a>
		</c:forEach>

		<%-- 다음페이지 버튼 --%>
		<c:if test="${pgh.next}">
			<a	href="/board/list?pageNo=${pgh.endPage+1}&qty=${pgh.pgvo.qty}">
			<button type="button" class="btn btn-outline-primary">▶</button></a>
		</c:if>
	<br><br>
	<a href="home"><button type="button" class="btn btn-secondary">메인으로</button></a>
	</div>
	<script type="text/javascript">
const msg_modify = `<c:out value="${msg_modify}"/>`;
const msg_delete = `<c:out value="${msg_delete}"/>`;

if(msg_modify=='1'){
	alert("게시글 수정 완료");
}
if(msg_delete=='1'){
	alert("삭제 완료");
}
</script>
</body>
</html>