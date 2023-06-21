<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<style>
	.container{
		width:800px;
		left:25%;
	}
	</style>
<meta charset="UTF-8">
<title>register Page</title>
</head>
<body>
<h1 align="center">게시글 등록</h1>
<div class="container">
<form action="/board/register" method="post" enctype="multipart/form-data">
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control" name="title" placeholder="게시글 제목을 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control" name="writer" value="${ses.id}" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">내용</span>
  <input type="text" class="form-control" name="content" placeholder="내용을 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">첨부파일</span>
  <input type="file" class="form-control" id="file" name="files" aria-label="Username" aria-describedby="basic-addon1" multiple style="display:none">
</div>
	<button type="button" class="btn btn-outline-primary" id="trigger">파일업로드</button><br><br>
	<div id="fileZone">
		
	</div>
	<br>
	<button type="submit" id="regBtn" class="btn btn-outline-success">등록</button>
	<a href="/"><button type="button" class="btn btn-outline-secondary">메인으로</button></a>
</form>
</div>
	<script type="text/javascript" src="/resources/js/register.js"></script>
</body>
</html>