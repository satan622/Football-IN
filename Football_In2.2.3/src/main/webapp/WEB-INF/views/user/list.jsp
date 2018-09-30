<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<style type="text/css">
.page-bar {
	align-items: center;
	align-content: center;
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
				<li class="nav-item active"><a class="nav-link" href="/user/list">선수</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기장</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/sboard/list">게시판</a></li>
			</ul>
			<c:if test="${empty login }">
				<a class="btn btn-secondary" href="/user/login">로그인</a>
			</c:if>
			<c:if test="${not empty login }">
				<h5 style="color:white">User Name: ${login.uname }&nbsp;&nbsp;</h5>
				<a class="btn btn-secondary" href="/user/logout">로그아웃</a>
			</c:if>
		</div>
	</nav>
	
	<!-- header -->
	<div class="jumbotron text-center">
		<h1>Player List</h1>
	</div>
	<!-- body -->
	<div class="container">
		<div class="table-responsive-lg">
			<table class="table table-hover" style="text-align:center">
				<thead>
					<tr>
						<th style="width: 10%">ID</th>
						<th>Name</th>
						<th style="width: 15%">Location</th>
						<th style="width: 20%">Team</th>
						<th style="width: 10%">Regdate</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="userVO">
					<tr>
						<td>${userVO.uid }</td>
						<td>${userVO.uname }</td>
						<td>${userVO.location }</td>
						<td>${userVO.team }</td>
						<td style="text-align: right"><fmt:formatDate pattern="yyyy.MM.dd" value="${userVO.regdate }" /></td>
					</tr>
				</c:forEach> 
			</table>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<ul class="pagination pagination-lg">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href="list?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li class="page-item ${pageMaker.cri.page == idx ? 'active':'' }">
						<a href="list?page=${idx }" class="page-link">${idx }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item"><a class="page-link"
						href="list?page=${pageMaker.endPage +1 } }">&raquo;</a></li>
				</c:if>
			</ul>
			<div class="col"></div>
			<form id="jobForm">
				<input type="hidden" name="page" value=${pageMaker.cri.perPageNum }>
				<input type="hidden" name="perPageNum" value=${pageMaker.cri.perPageNum }>
			</form>
		</div>
	</div>
	
	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>
