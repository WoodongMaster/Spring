<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<style>
	.container{
		width:250px;
		left:25%;
	}
</style>
<head>
<meta charset="UTF-8">
<title>SignUp page</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<h1 align="center">회원가입 페이지</h1><br><br>
	<div class="container">
	<form action="/user/signup" method="post">
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">ID</span>
  <input type="text" class="form-control" name="id" placeholder="ID를 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">PW</span>
  <input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Name</span>
  <input type="text" class="form-control" name="name" placeholder="이름을 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Email</span>
  <input type="email" class="form-control" name="email" placeholder="이메일을 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Address</span>
  <input type="text" class="form-control" name="home" placeholder="거주지역을 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Age</span>
  <input type="text" class="form-control" name="age" placeholder="나이를 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
</div>
		<div align="center">
		<button type="submit" class="btn btn-success">회원가입</button>
		<a href="/"><button type="button" class="btn btn-secondary">메인화면으로</button></a>
		</div>
	</form>
	</div>
</body>
</html>