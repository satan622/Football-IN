<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Board</title>
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
				<li class="nav-item"><a class="nav-link active"
					href="/sboard/list">게시판</a></li>
			</ul>
		</div>
		<a class="btn btn-secondary" href="/user/login">로그인</a>
	</nav>
	
	<!-- header -->
	<div class="jumbotron text-center">
		<h1>board</h1>
	</div>

	<div class="container">
		<form method="post" role="form">
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail">Title</label> <input type="text"
						name="title" class="form-control" placeholder="Enter Title">
				</div>
				<div class="form-group">
					<label for="exampleInputWriter">Writer</label> <input type="text"
						name="writer" class="form-control" placeholder="Enter Writer">
				</div>
				<div class="form-group">
					<label for="exampleInputContent">Content</label>
					<textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea>
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>
	
	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>
	
</body>
</html>