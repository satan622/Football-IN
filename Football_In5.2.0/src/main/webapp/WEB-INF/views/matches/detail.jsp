<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>축구인들을 위한 공간 Football IN</title>
<link rel="stylesheet" href="../resources/4/lux/bootstrap.css"
	media="screen">
<link rel="stylesheet" href="../resources/_assets/css/custom.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
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
				<li class="nav-item"><a class="nav-link active"
					href="/team/list">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="/map?type=">경기장</a></li>
				<li class="nav-item"><a class="nav-link" href="/sboard/list">게시판</a></li>
			</ul>
			<c:if test="${empty login }">
				<a class="btn btn-secondary" href="/user/login">로그인</a>
			</c:if>
			<c:if test="${not empty login }">
				<h5 style="color: white">User Name: ${login.uname }&nbsp;&nbsp;</h5>
				<a class="btn btn-secondary" href="/user/logout">로그아웃</a>
			</c:if>
		</div>
	</nav>

	<!-- 	header -->
	<div class="jumbotron text-center">
		<h1>Match</h1>
	</div>
	<!-- 	body -->
	<div class="container">
		<div class="row">
			<div class="" style="margin: 10px">
				<h2 style="text-align:center">Home</h2>
				<div class="card mb-3" style="text-align: center">
					<h3 class="card-header">${home.teamname }</h3>
					<div class="card-body">
						<c:if test="${not empty home.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem" src="/displayFile?fileName=${home.emblem }"
								alt="Card image">
						</c:if>
						<c:if test="${empty home.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem">
						</c:if>
					</div>
					<div class="card-body">
						<h5 class="card-title">지역: ${home.location}</h5>
						<h5 class="card-title">인원: ${home.people}</h5>
						<h5 class="card-title">
							창단일:
							<fmt:formatDate pattern="yyyy.MM.dd" value="${home.regdate }" />
						</h5>
						<h5 class="card-title">관리자: ${home.mid }</h5>
					</div>
				</div>
			</div>`
			<div class="col">
				<div style="margin:35%">
					<div class="btn btn-primary btn-lg disabled">vs</div>
				</div>
			</div>
			<div class="" style="margin: 10px">
				<h2 style="text-align:center">Away</h2>
				<div class="card mb-3" style="text-align: center">
					
					<h3 class="card-header">${away.teamname }<c:if test="${empty away }">Empty</c:if></h3>
					<div class="card-body">
						<c:if test="${not empty away.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem" src="/displayFile?fileName=${away.emblem }"
								alt="Card image">
						</c:if>
						<c:if test="${empty away.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem">
						</c:if>
						<c:if test="${empty away }">
							<div>
								<button class="btn btn-primary btn-lg">경기 신청</button>
							</div>
						</c:if>
					</div>
					
					<c:if test="${not empty away }">
					<div class="card-body">
						<h5 class="card-title">지역: ${away.location}</h5>
						<h5 class="card-title">인원: ${away.people}</h5>
						<h5 class="card-title">
							창단일:
							<fmt:formatDate pattern="yyyy.MM.dd" value="${away.regdate }" />
						</h5>
						<h5 class="card-title">관리자: ${away.mid }</h5>
						</div>
					</c:if>
				</div>
			</div>
		</div>

		<div style="text-align: center" >
			<div class="table-responsive-lg">
				<h2>Member List</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<td>ID</td>
							<td>이름</td>
							<td>지역</td>
							<td>팀 가입일</td>
						</tr>
					</thead>
					<tbody id="members"></tbody>
				</table>
			</div>
			<button type="submit" class="btn btn-outline-secondary goListBtn" style="margin:50px">List</button>
		</div>
	</div>

	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>
