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
				<li class="nav-item active"><a class="nav-link"
					href="/board/listPage">게시판</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron text-center">
		<h1>board</h1>
	</div>

	<div class="container">
		<form role="form" method="post">
			<input type="hidden" name="bno" value="${boardVO.bno }">
			<!-- 페이지 정보 유지로 추가 된 부분  -->
			<input type="hidden" name="page" value="${cri.page }"> <input
				type="hidden" name="perPageNum" value="${cri.perPageNum }">
		</form>

		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail">Bno</label> <input type="text"
					name="bno" class="form-control" value="${boardVO.bno }"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail">Title</label> <input type="text"
					name="title" class="form-control" value="${boardVO.title }"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputWriter">Writer</label> <input type="text"
					name="writer" class="form-control" value="${boardVO.writer }"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputContent">Content</label>
				<textarea class="form-control" name="content" rows="5"
					readonly="readonly">${boardVO.content }</textarea>
			</div>
		</div>
		<div class="div-footer">
			<button type="submit" class="btn btn-success modifyBtn">Modify</button>
			<button type="submit" class="btn btn-danger removeBtn">Remove</button>
			<button type="submit" class="btn btn-warning goListBtn">List</button>
		</div>
	</div>
	<hr>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>

<script type="text/javascript">
	var result = '${msg}';
	
	if (result == "success") {
		alert("수정되었습니다.");
	}

	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".modifyBtn").on("click", function() {
			formObj.attr("action", "/board/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".removeBtn").on("click", function() {
			formObj.attr("action", "/board/removePage");
			formObj.submit();
		});

		$(".goListBtn").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/board/listPage");
			formObj.submit();
		});
	});
</script>