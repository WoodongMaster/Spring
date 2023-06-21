<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board post page</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<h1 align="center">게시글</h1>
	<c:set var="bvo" value="${bdto.bvo}"></c:set>
	
	<table class="table table-bordered table-striped" style="width:50%;margin:auto">
		<tr align="center">
			<th scope="col">글번호</th>
		</tr>
		<tr align="center">
			<td scope="row">${bvo.bno}</td>
		</tr>
		<tr align="center">
			<th scope="col">제목</th>
		</tr>
		<tr align="center">
			<td scope="row">${bvo.title}</td>
		</tr>
		<tr align="center">
			<th scope="col">작성자</th>
		</tr>
		<tr align="center">
			<td scope="row">${bvo.writer}</td>
		</tr>
		<tr align="center">
			<th scope="col">등록일자</th>
		</tr>
		<tr align="center">
			<td scope="row">${bvo.reg_date}</td>
		</tr>
		<tr align="center">
			<td scope="col">내용</td>
		</tr>
		<tr align="center">
			<td scope="row">${bvo.content}</td>
		</tr>
				<tr align="center">
			<td scope="col">첨부파일</td>
		</tr>
		<tr align="center">
			<td scope="row">
					<c:set var="flist" value="${bdto.flist}"></c:set>
		<div align="center">
			<ul>
				<c:forEach items="${flist }" var="fvo">
					<li>
						<c:choose>
							<c:when test="${fvo.file_type eq 1}">
								<div>
									<img alt="없음" src="/upload/${fn:replace(fvo.save_path, '\\','/')}/
									${fvo.uuid}_${fvo.file_name}">
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
								<div>
									<!-- 클립모양 같은 파일 아이콘 모양 값을 넣음 -->
									<div>${fvo.file_name }</div>
									${fvo.reg_date }
								</div>
								
					</li>
				</c:forEach>
			</ul>
		</div>
			</td>
		</tr>
	</table>

	

		
	<br>
	<div align="center">
	<c:if test="${bvo.writer eq ses.id}">
		<a href="/board/modify?bno=${bvo.bno}"><button type="button" class="btn btn-warning">수정하기</button></a>
		<a href="/board/delete?bno=${bvo.bno}"><button type="button" class="btn btn-danger">삭제하기</button></a>
	</c:if>
	<a href="home"><button type="button" class="btn btn-secondary">메인으로</button></a>
</div>
<br>
	<!-- comment line -->

	<div  align="center">
		<!-- 댓글 작성 라인 -->
		<div>
			<span id="cmtWriter"> ${ses.id }</span> <input type="text"
				id="cmtText" placeholder="Test Add Comment">
			<button type="button" id="cmtPostBtn" class="btn btn-outline-success">Post</button>
		</div>
		<!-- 댓글 표시 라인 -->
		<div>
			<!-- li 하나가 하나의 댓글 객체 -->
			<ul id="cmtListArea">
				<li>
					<div>
						<div>Writer</div>
						Content for Comment
					</div> <span>mod_date</span>
				</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		const bnoVal = '<c:out value="${bvo.bno}" />';
		const id = '<c:out value="${ses.id}" />';
		console.log("bno : " + bnoVal);
		console.log("id : " + id);
	</script>
	<script type="text/javascript" src="/resources/js/comment.js"></script>
	<script type="text/javascript">
		getCommentList(bnoVal);
	</script>

</body>
</html>