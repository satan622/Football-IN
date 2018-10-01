<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="UTF-8">
<title>축구인들을 위한 공간 Football IN</title>
<link rel="stylesheet" href="../resources/4/lux/bootstrap.css"
	media="screen">
<link rel="stylesheet" href="../resources/_assets/css/custom.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<a class="navbar-brand" href="/">Football In</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/user/list">선수</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기장</a></li>
				<li class="nav-item"><a class="nav-link" href="/sboard/list">게시판</a></li>
			</ul>
			<a class="btn btn-secondary" href="/user/login">로그인</a>
		</div>
	</nav>

	<!-- header -->
	<div class="jumbotron text-center">
		<h1>Join</h1>
	</div>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div>
				<div class="container">
<!-- 				onsubmit="return checks()" -->
				<form id="joinForm" method="post" action="join" onsubmit="return checks()">
						<div class="form-group">
							<label for="uid">ID</label>
							<input type="text" class="form-control" name="uid" id="uid" aria-describedby="IDHelp" placeholder="Enter ID">
							<small id="IDHelp" class="form-text text-muted">Football-IN에서 사용할 아이디를 입력해주세요</small>
						</div>
						<div class="form-group">
							<label for="upw">Password</label>
							<input type="password" name="upw" class="form-control" id="upw" placeholder="Password">
						</div>
						<div class="form-group"> 
							<label for="upw2">Check Password</label>
							<input type="password" class="form-control" id="upw2" placeholder="Password agiain">
						</div>

						<div class="form-group">
							<label for="uname">Name</label> <input type="text" name="uname"
								class="form-control" id="uname" placeholder="Enter Name"
								aria-describedby="nameHelp"> <small id="nameHelp"
								class="form-text text-muted">Football-IN에서 사용할 이름을
								입력해주세요</small>
						</div>

						<div class="form-group">
							<label for="location">Location</label>
							<input type="text" 
								class="form-control" id="location" name="location" aria-describedby="locationHelp"
								placeholder="Enter Location">
							<small id="locationHelp" class="form-text text-muted">매칭 시 사용 될 지역을 입력해주세요</small>
						</div>
						<button type="submit" class="btn btn-primary btn-right-bottom">Submit</button>
				</form>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<!-- 	footer -->
	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 10px">
		<p>Football IN</p>
	</div>

</body>
</html>

<!-- 입력 값 유효성 검사 -->
<script type="text/javascript">
function checks(){
	
	//아이디 공백 확인
    if($("#uid").val() == ""){
      alert("아이디 입력바람");
      $("#uid").focus();
      return false;
    }
	
	//비밀번호 공백 확인
    if($("#upw").val() == ""){
      alert("패스워드 입력바람");
      $("#upw").focus();
      return false;
    }
	
	//비밀번호 서로확인
	if($("#upw").val() != $("#upw2").val()){
    	alert("비밀번호가 상이합니다");
    	$("#upw").val("");
    	$("#upw2").val("");
    	$("#upw").focus();
    	return false;
	}
	
	//이름 공백 검사
    if($("#uname").val() == ""){
      alert("이름을 입력해주세요");
      $("#uname").focus();
      return false;
    }
	
  	//생일 공백 검사
    if($("#birth").val() == ""){
      alert("생일을 입력해주세요");
      $("#birth").focus();
      return false;
    }
	
  	//지역 공백 검사
    if($("#location").val() == ""){
      alert("지역을 입력해주세요");
      $("#location").focus();
      return false;
    }
	
	return true;
}
</script>