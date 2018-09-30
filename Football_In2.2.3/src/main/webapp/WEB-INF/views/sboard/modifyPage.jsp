<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<li class="nav-item"><a class="nav-link" href="/user/list">선수</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기장</a></li>
				<li class="nav-item"><a class="nav-link active"
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
	
	<!-- header	 -->
	<div class="jumbotron text-center">
		<h1>board</h1>
	</div>

	<div class="container">
		<form role="form" action="modifyPage" method="post">
			<!-- 페이징 정보 -->
			<input type="hidden" name="page" value="${cri.page }">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
			<!-- 검색 정보 -->
			<input type="hidden" name="searchType" value=${cri.searchType }>
			<input type="hidden" name="keyword" value=${cri.keyword }>
			
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail">Bno</label> <input type="text"
						name="bno" class="form-control" value="${boardVO.bno }" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail">Title</label> <input type="text"
						name="title" class="form-control" value="${boardVO.title }">
				</div>
				<div class="form-group">
					<label for="exampleInputWriter">Writer</label> <input type="text"
						name="writer" class="form-control" value="${boardVO.writer }"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputContent">Content</label>
					<textarea class="form-control" name="content" rows="5">${boardVO.content }</textarea>
				</div>
			</div>
		</form>
		<div class="div-footer">
			<button type="submit" class="btn btn-info okBtn">OK</button>
			<button type="submit" class="btn btn-danger cancelBtn">CANCEL</button>
		</div>
	</div>
	<hr>
	
	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>
	
</body>
</html>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".okBtn").on("click", function() {
			formObj.submit();
		});

		$(".cancelBtn").on("click", function() {
			self.location = "/sboard/readPage?page=${cri.page}&perPage=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&bno=${boardVO.getBno()}"; //검색 정보 추가
		});
	});
</script>