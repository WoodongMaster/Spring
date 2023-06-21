<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<style>
	.maindiv{
		width:60%;
		height:500px;
		background-color:white;
		opacity: 0.94;
		position:absolute;
		left:20%;
		top:20%;
	}
	.comment{
		line-height:200px;
	}
</style>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
<div class="background">
<div class="maindiv">
<h1 align="center" class="comment">
	뭐든 말해보시죠!<br>
	이뤄질지는 모르겠지만! 
</h1>

</div>
</div>
<script type="text/javascript">
const msg_home = `<c:out value="${msg_home}"/>`;
const msg_login = `<c:out value="${msg_login}"/>`;
const msg_logout = `<c:out value="${msg_logout}"/>`;
const msg_modify = `<c:out value="${msg_modify}"/>`;
if(msg_home=='1'){
	alert("welcome Homepage");
}
if(msg_login=='1'){
	alert("로그인 완료");
}
if(msg_logout=='1'){
	alert("로그아웃 완료");
}
if(msg_modify=='1'){
	alert("내 정보 수정완료 다시 로그인 해주세요");
}
</script>

<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>
