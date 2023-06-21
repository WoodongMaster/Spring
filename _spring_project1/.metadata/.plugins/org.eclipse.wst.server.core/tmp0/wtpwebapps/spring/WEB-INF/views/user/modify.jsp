<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user modify page</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<h1 align="center">내 정보 수정</h1><br><br>
	<div class="container">
	
	<form action="/user/modify" method="post">
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">ID</span>
  <input type="text" class="form-control" name="id" value="${uvo.id }" readonly="readonly" aria-label="Username" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3" id="pw_div">
  <span class="input-group-text" id="basic-addon1">기존 비밀번호</span>
  <input type="password" class="form-control" id="pw" name="pw" aria-label="Username" aria-describedby="basic-addon1">
  <button type="button" id="pw_color" class="btn btn-secondary" onclick="pwcheck()">PW확인</button>
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Name</span>
  <input type="text" class="form-control" name="name" aria-label="Username" value="${uvo.name }" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Email</span>
  <input type="email" class="form-control" name="email" aria-label="Username" value="${uvo.email }" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Address</span>
  <input type="text" class="form-control" name="home" aria-label="Username" value="${uvo.home }" aria-describedby="basic-addon1">
</div>
	<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Age</span>
  <input type="text" class="form-control" name="age" aria-label="Username" value="${uvo.age }" aria-describedby="basic-addon1">
</div>
		<div align="center">
		<button type="submit" class="btn btn-success" id="sbmBtn">수정완료</button>
		<a href="/"><button type="button" class="btn btn-secondary">메인화면으로</button></a>
		</div>
	</form>
	</div>
	<script type="text/javascript">
		function pwcheck(){
			let pw = document.getElementById("pw").value;
			console.log(pw);
			checkpwToServer(pw).then(result => {
				
				if(result>0 && (document.getElementById('pw').name == 'pw')){
					alert("pw일치");
				document.getElementById('pw_color').className = 'btn btn-success';
				document.getElementById('pw').setAttribute("name","old_pw");
				const div = document.getElementById("pw_div");
				div.insertAdjacentHTML("afterEnd", `<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">새 비밀번호</span>
					<input type="password" class="form-control" name="pw" aria-label="Username" aria-describedby="basic-addon1">
					</div>`);
				}
				else{
					alert("pw불일치");
				document.getElementById('pw_color').className = 'btn btn-danger';
				}
			});
			console.log(document.getElementById("pw_color").value);
			
		}
		
		async function checkpwToServer(pw){
			try{
				const resp = await fetch('/user/'+pw);
				const result = await resp.json();
				return result;
			}catch(err){
				console.log(err);
			}
		}
		
		document.getElementById('sbmBtn').addEventListener('click', ()=>{
		    if(document.getElementById("pw_color").value == "1"){
		        document.getElementById("pw").disabled ="true";
		    }
		})
	
	</script>
</body>
</html>