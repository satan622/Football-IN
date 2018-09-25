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
					href="/sboard/list">게시판</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron text-center">
		<h1>board list</h1>
	</div>
	<div class="container">
		<nav class="navbar navbar-light bg-light">
			<select name="searchType" class="col-sm-2"
					id="exampleSelect1">
					<option value="n"
						<c:out value="${cri.searchType == null ? 'selected':'' }" />>---</option>
					<option value="t"
						<c:out value="${cri.searchType == 't' ? 'selected':'' }" />>Title</option>
					<option value="c"
						<c:out value="${cri.searchType == 'c' ? 'selected':'' }" />>Content</option>
					<option value="w"
						<c:out value="${cri.searchType == 'w' ? 'selected':'' }" />>Writer</option>
					<option value="tc"
						<c:out value="${cri.searchType == 'tc' ? 'selected':'' }" />>Title
						OR Content</option>
					<option value="wc"
						<c:out value="${cri.searchType == 'wc' ? 'selected':'' }" />>Writer
						OR Content</option>
					<option value="tcw"
						<c:out value="${cri.searchType == 'tcw' ? 'selected':'' }" />>Title
						OR Writer OR Content</option>
				</select>
				<input class="col-sm-6 form-inline" type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
				<button class="form-inline btn btn-primary" id="searchBtn">Search</button>
				<button class="btn btn-primary my-2 my-sm-0" type="button" id="newBtn">New Board</button>
		</nav>
		<div class="table-responsive-sm">
			<table class="dogdrip-table table-hover">
				<thead>
					<tr>
						<th style="width: 10%">NO</th>
						<th>Title</th>
						<th style="width: 15%">WRITER</th>
						<th style="width: 10%">TIME</th>
						<th style="width: 5%">VIEW</th>
					</tr>
				</thead>
				<c:forEach items="#{list }" var="boardVO">
					<tr>
						<td>${boardVO.bno }</td>
						<td><a
							href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno }">${boardVO.title }<small>[${boardVO.replycnt }]</small></a></td>
						<td>${boardVO.writer }</td>
						<td style="text-align: right"><fmt:formatDate pattern="yyyy.MM.dd HH:mm"
								value="${boardVO.regdate }" /></td>
						<td style="text-align: center"><span class="badge badge-primary badge-pill">${boardVO.viewcnt }</span></td>
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
					<li class="page-item disabled"><a
						href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li class="page-item ${pageMaker.cri.page == idx ? 'active':'' }">
<%-- 						<a href="${idx }" class="page-link">${idx }</a> --%>
						<a href="list${pageMaker.makeSearch(idx) }" class="page-link">${idx }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item disabled"><a
						href="listPage${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
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

<script>
	var result = '${msg}';

	if (result == "regist") {
		alert("새로운 글을 작성했습니다.");
	}
	if (result == "remove") {
		alert("삭제 되었습니다.")
	}
	if (result == "modify") {
		alert("수정되었습니다.");
	}

// 	$(".pagination li a").on("click", function(event) {
// 		event.preventDefault();

// 		var targetPage = $(this).attr("href");

// 		var jobForm = $("#jobForm");
// 		jobForm.find("[name='page']").val(targetPage);
// 		jobForm.attr("action", "/board/listPage").attr("method", "get");
// 		jobForm.submit();
// 	});
	
	$(document).ready(function(){
		$('#searchBtn').on("click", function(evt){
			self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		$('#newBtn').on("click",function(event){
			self.location = "regist";
		});
	});
	
</script>