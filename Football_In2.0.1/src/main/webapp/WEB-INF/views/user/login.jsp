<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<li class="nav-item"><a class="nav-link" href="#">선수</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기장</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/sboard/list">게시판</a></li>
			</ul>
		</div>
		<a class="btn btn-secondary" href="/user/login">로그인</a>
	</nav>
	
	<div class="jumbotron text-center">
		<h1>Login</h1>
	</div>
	
	<div class="container">
		
		<form action="/user/loginPost" method="post">
			<div class="row">
				<div class="col-2"></div>
				
				<div class="col-8">
					<div class="form-group has-feedback">
						<input type="text" name="uid" class="form-control" placeholder="USER ID">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="upw" class="form-control" placeholder="Password">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
				</div>
				
				<div class="col-2"></div>
			</div>
			
			<div class="row">
				<div class="container">
					
					<div class="row">
						<div class="col"></div>
						<div class="checkbox icheck">
							<label><input type="checkbox" name="useCookie">&nbsp;Remember ID</label>
						</div>
						<div class="col"></div>
					</div>
					
					<div class="row">
						<div class="col"></div>
						<div>
							<button type="submit" class="btn btn-primary">Sign In</button>
							<div class="btn btn-primary"><a href="" style="color:white; text-decoration: none">Register</a></div>
						</div>
						<div class="col"></div>
					</div>
					
				</div>
			</div>
			
		</form>
	</div>
	
</body>
</html>