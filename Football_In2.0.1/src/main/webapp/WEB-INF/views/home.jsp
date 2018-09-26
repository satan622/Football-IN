<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/4/lux/bootstrap.css"
	media="screen">
	<link rel="stylesheet" href="resources/_assets/css/custom.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		#main-img{
			margin-top:100px;
			margin-bottom:100px;
		}
	</style>
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
	
	<!-- main -->
	<div class="jumbotron text-center">
		<h1 class="display-4">Football IN</h1>
		<img class="img-fluid" id="main-img" alt="football" src="resources/img/메시 실루엣2.png" width="500px">
		<p>맹구 젖닌 박멸, 버기단 출입 금지</p>
	</div>
<!-- 	<div class="container" align="center"> -->
<!-- 		<img id="main-img" alt="football" src="resources/img/외질.jpg" width="80%"> -->
<!-- 	</div> -->
	
</body>
</html>