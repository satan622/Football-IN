<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style type="text/css">
.page-bar {
	align-items: center;
	align-content: center;
}
</style>
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
		<h1>board list</h1>
	</div>
	<div class="container">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>Title</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>
			</thead>
			<c:forEach items="#{list }" var="boardVO">
				<tr>
					<td>${boardVO.bno }</td>
					<td><a
						href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${boardVO.bno }">${boardVO.title }</a></td>
					<td>${boardVO.writer }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.regdate }" /></td>
					<td><span class="badge badge-primary badge-pill">${boardVO.viewcnt }</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<ul class="pagination pagination-lg">
				<c:if test="${pageMaker.prev }">
					<li class="page-item disabled"><a
						href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li class="page-item ${pageMaker.cri.page == idx ? 'active':'' }">
						<a href="${idx }" class="page-link">${idx }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item disabled"><a
						href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
				</c:if>
			</ul>
			<div class="col"></div>
			<form id="jobForm">
				<input type="hidden" name="page" value=${pageMaker.cri.perPageNum }>
				<input type="hidden" name="perPageNum"
					value=${pageMaker.cri.perPageNum }>
			</form>
		</div>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>

<script>
	var result = '${msg}';

	if (result == "register") {
		alert("새로운 글을 작성했습니다.");
	}
	if (result == "remove"){
		alert("삭제 되었습니다.")
	}

	$(".pagination li a").on("click", function(event) {
		event.preventDefault();

		var targetPage = $(this).attr("href");

		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/board/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>